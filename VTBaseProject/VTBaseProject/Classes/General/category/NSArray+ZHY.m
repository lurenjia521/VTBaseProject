//
//  NSArray+ZHY.m
//  网络GETAndPOST请求
//
//  Created by 609972942 on 16/1/8.
//  Copyright (c) 2016年 ios. All rights reserved.
//

#import "NSArray+ZHY.h"

@implementation NSArray (ZHY)

- (NSString *)descriptionWithLocale:(id)locale{
    
    NSMutableString *string = [NSMutableString string];
    
    [string appendString:@"(\n"];
    
    for (NSString *title in self) {
        
        [string appendFormat:@"\t\"%@\",\n",title];
    }
    [string appendString:@")"];
    
    return string;
}

@end
