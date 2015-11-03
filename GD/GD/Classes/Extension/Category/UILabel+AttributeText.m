//
//  UILabel+AttributeText.m
//  IRM
//
//  Created by intMax on 15/2/7.
//  Copyright (c) 2015年 Friday. All rights reserved.
//

#import "UILabel+AttributeText.h"

@implementation UILabel (AttributeText)

-(void) setAttributedTextWithText:(NSString *) text StartPos:(NSArray *) startPos Color:(NSArray *) color Font:(UIFont *) font
{
    int l=[[startPos lastObject] intValue]-[[startPos firstObject] intValue];
    if(text.length<=l)
        text=[text stringByAppendingString:@"暂无数据"];
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:text];
    
    for(int i=0;i<startPos.count;i++)
    {
        if(![color[i] isKindOfClass:[UIColor class]])
            break;
        NSInteger start = [startPos[i] intValue];
        NSInteger len = 0;
        if(i==startPos.count-1)
            len = [str length]-start;
        else
            len = [startPos[i+1] intValue]-start;
        [str addAttribute:NSForegroundColorAttributeName value:color[i] range:NSMakeRange(start,len)];
        [str addAttribute:NSFontAttributeName value:font range:NSMakeRange(start, len)];
    }
    self.attributedText=str;
}

@end
