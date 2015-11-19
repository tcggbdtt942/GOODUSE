//
//  WZGuideViewController.h
//  NPM
//
//  Created by zjm on 15/7/3.
//  Copyright (c) 2015年 DreamTouch. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WZGuideViewController : UIViewController
{
    BOOL _animating;
    
    UIScrollView *_pageScroll;
}

@property (nonatomic,assign) BOOL animating;
@property (nonatomic,retain) UIScrollView *pageScroll;
@property (nonatomic,retain) UIPageControl *pageControl;

+(WZGuideViewController *)sharedGuide;
+(void)show;
+(void)hide;


@end
