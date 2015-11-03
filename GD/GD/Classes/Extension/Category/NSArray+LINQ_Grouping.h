//
//  NSArray+LINQ_Grouping.h
//  IRM
//
//  Created by intMax on 15/3/20.
//  Copyright (c) 2015年 Friday. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (LINQ_Grouping)

/**
 Returns NSDictionary of groups that share a common
 attribute defined by selector. Each group is defined
 as a dictionary etnry whose key is a result of a selector
 and its value is an array of all elements that return
 the same key, i.e. selector(element) -> key.
 
 {
 key <- selector(element)
 value <- [element : key == selector(element)]
 }
 
 */
- (NSDictionary *)linq_groupBy:(id (^)(id item))block;

@end
