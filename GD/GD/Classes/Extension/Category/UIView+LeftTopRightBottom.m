//
//  UIView+LeftTopRightBottom.m
//  HR_XY3
//
//  Created by Friday on 14-9-24.
//  Copyright (c) 2014年 DreamTouch. All rights reserved.
//

#import "UIView+LeftTopRightBottom.h"

@implementation UIView (LeftTopRightBottom)


-(void)setFLeft:(float)Left
{
    CGRect frame=self.frame;
    frame.origin.x=Left;
    self.frame=frame;
}
-(void)setFTop:(float)Top
{
    CGRect frame=self.frame;
    frame.origin.y=Top;
    self.frame=frame;
}

-(void)setFWidth:(float)Width
{
    CGRect frame=self.frame;
    frame.size.width=Width;
    self.frame=frame;
}
-(void)setFHeight:(float)Height
{
    CGRect frame=self.frame;
    frame.size.height=Height;
    self.frame=frame;
}
-(float)FLeft
{
    return self.frame.origin.x;
}
-(float)FTop
{
    return self.frame.origin.y;
}
-(float)FRight
{
    return self.frame.origin.x+self.frame.size.width;
}
-(float)FBottom
{
    return self.frame.origin.y+self.frame.size.height;
}
-(float)FWidth
{
    return self.frame.size.width;
}
-(float)FHeight
{
    return self.frame.size.height;
}
@end
