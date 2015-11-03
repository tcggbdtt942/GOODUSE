//
//  UILabel+AttributeText.h
//  IRM
//
//  Created by intMax on 15/2/7.
//  Copyright (c) 2015年 Friday. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (AttributeText)

-(void) setAttributedTextWithText:(NSString *) text StartPos:(NSArray *) startPos Color:(NSArray *) color Font:(UIFont *) font;

@end
