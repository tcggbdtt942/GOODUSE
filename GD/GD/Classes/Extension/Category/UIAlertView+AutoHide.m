//
//  UIAlertView+AutoHide.m
//  ICP
//
//  Created by GO on 14-7-28.
//  Copyright (c) 2014年 DreamTouch. All rights reserved.
//

#import "UIAlertView+AutoHide.h"

@implementation UIAlertView (AutoHide)
- (void) setWithMessage:(NSString *)message interval:(CGFloat) interval
{
    self.title=ALERT_TITLE;
    self.delegate=nil;
    self.message=message;
    [NSTimer scheduledTimerWithTimeInterval:interval target:self selector:@selector(performDismiss:) userInfo:nil repeats:NO];
}
-(void)performDismiss:(NSTimer*)timer
{
    [self dismissWithClickedButtonIndex:0 animated:YES];
}

- (void) setWithMessage:(NSString *)message CancelTitle:(NSString *)cancelTitle SureTitle:(NSString *)sureTitle
{
    self.title=ALERT_TITLE;
    self.delegate=nil;
    self.message=message;
    if (cancelTitle!=nil||cancelTitle.length>0) {
        [self addButtonWithTitle:cancelTitle];
    }
    if (sureTitle!=nil||sureTitle.length>0) {
        [self addButtonWithTitle:sureTitle];
    }
}
@end
