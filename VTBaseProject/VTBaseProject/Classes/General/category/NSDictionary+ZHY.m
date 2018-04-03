//
//  NSDictionary+ZHY.m
//  网络GETAndPOST请求
//
//  Created by 609972942 on 16/1/8.
//  Copyright (c) 2016年 ios. All rights reserved.
//

#import "NSDictionary+ZHY.h"

@implementation NSDictionary (ZHY)

- (NSString *)descriptionWithLocale:(id)locale{
    
    NSMutableString *string = [NSMutableString string];
    [string appendString:@"{\n"];
    
    for (NSString *key in self) {
        
        NSString *value =[self valueForKey:key];
        [string appendFormat:@"\t\"%@\" = %@;\n",key,value];
    }
    
    [string appendString:@"}"];
    
    return string;
}

@end
