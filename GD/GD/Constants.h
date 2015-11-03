//
//  Constants.h
//  GD
//
//  Created by liuyixin on 15/11/3.
//  Copyright © 2015年 chenyue. All rights reserved.
//

#ifndef Constants_h
#define Constants_h

//输出日志
#ifdef DEBUG
#define DBG(format, ...) NSLog(format, ## __VA_ARGS__)
#else
#define DBG(format, ...)
#endif
//判断string为空
#define IS_NULL_STRING(__POINTER) \
(__POINTER == nil || \
__POINTER == (NSString *)[NSNull null] || \
![__POINTER isKindOfClass:[NSString class]] || \
![__POINTER length])
//color
#define Rgb2UIColor(r, g, b, a) [UIColor colorWithRed:((r) / 255.0) green:((g) / 255.0) blue:((b) / 255.0) alpha:((a)/1.0)] //颜色设置
#define THEME_COLOR Rgb2UIColor(28, 213, 216, 1) //主题色
#define BG_COLOR Rgb2UIColor(238, 238, 238, 1) //背景色
#define LINE_COLOR Rgb2UIColor(229, 229, 229, 1)  //线颜色
#define FONT_DARK_COLOR Rgb2UIColor(51, 51, 51, 1)  //字体颜色 深
#define FONT_NORMAL_COLOR Rgb2UIColor(102, 102, 102, 1)  //字体颜色 其次
#define FONT_LIGHT_COLOR Rgb2UIColor(153, 153, 153, 1)  //字体颜色 浅
#define BTN_DISABLE_COLOR Rgb2UIColor(203, 203, 203, 1)  //按钮禁用色
#define CLEAR_COLOR Rgb2UIColor(255, 255, 255, 0) //透明色
//size
#define SCREEN_HEIGHT ((([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortrait) || ([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortraitUpsideDown)) ? [[UIScreen mainScreen] bounds].size.height : [[UIScreen mainScreen] bounds].size.width)

#define SCREEN_WIDTH  ((([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortrait) || ([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortraitUpsideDown)) ? [[UIScreen mainScreen] bounds].size.width : [[UIScreen mainScreen] bounds].size.height)

#define NAVGATIONBAR_HEIGHT 64
#define TABLEVIEW_SECTION_SPACE 10
#define TABLEVIEW_NOHEIGHT 0.01f
#define TABLEVIEW_CELLHEIGHT 44
#define TABLEVIEW_MYTRAINEECELL_HEIGHT 123
#endif /* Constants_h */
