//
//  NSArray+LINQ_Grouping.m
//  IRM
//
//  Created by intMax on 15/3/20.
//  Copyright (c) 2015年 Friday. All rights reserved.
//

#import "NSArray+LINQ_Grouping.h"

@implementation NSArray (LINQ_Grouping)

- (NSDictionary *)linq_groupBy:(id (^)(id item))block {
    NSMutableDictionary *result = [NSMutableDictionary dictionary];
    for (id item in self) {
        id key = block(item);
        if(!key)
            key=[NSString stringWithFormat:@"nilKey"];//保证键值不为空
        NSMutableArray *group = [result objectForKey:key];
        if (!group) {
            group = [NSMutableArray array];
            [result setObject:group forKey:key];
        }
        [group addObject:item];
    }
    return result;
}

@end
