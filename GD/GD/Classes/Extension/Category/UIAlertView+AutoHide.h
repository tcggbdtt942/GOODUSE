//
//  UIAlertView+AutoHide.h
//  ICP
//
//  Created by GO on 14-7-28.
//  Copyright (c) 2014年 DreamTouch. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIAlertView (AutoHide)

- (void)setWithMessage:(NSString *)message interval:(CGFloat) interval;
- (void) setWithMessage:(NSString *)message CancelTitle:(NSString *)cancelTitle SureTitle:(NSString *)sureTitle;
@end
