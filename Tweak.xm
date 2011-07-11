#import <UIKit/UIKit.h>


@interface SBIconController : NSObject { }
+(SBIconController*)sharedInstance;
-(void)setIsEditing:(BOOL)editing;
-(BOOL)isEditing;
@end

@interface SBIcon { }
-(id)applicationBundleID;
@end

@interface UIApplication (MessageTo)
-(void)applicationOpenURL:(id)url;
@end

%hook SBIcon

-(void)touchesEnded:(id)ended withEvent:(id)event {

%orig;

if ([[objc_getClass("SBIconController") sharedInstance] isEditing]) {

NSSet *touchSet = [event allTouches];
switch ([touchSet count]){
				
				case 1: {
					UITouch *touchAmount = [[touchSet allObjects] objectAtIndex:0];
					switch ([touchAmount tapCount]) {
						case 1: {
							
							} 
							break;

						case 2: {
						

if([[self applicationBundleID] isEqualToString:@"com.apple.mobilemail"]) {					

 [[UIApplication sharedApplication] applicationOpenURL:[NSURL URLWithString:[NSString stringWithFormat:@"mailto:"]]];

}

if([[self applicationBundleID] isEqualToString:@"com.apple.MobileSMS"]) {	

 [[UIApplication sharedApplication] applicationOpenURL:[NSURL URLWithString:[NSString stringWithFormat:@"sms:+"]]];

}

break;

}
}
}
}
}
}

%end
