//
//  BaseTools.h
//  LW_baseProject
//
//  Created by lianjie on 2018/4/2.
//  Copyright © 2018年 lianjie. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseTools : NSObject
/**
 *  判断字符串是否为空
 */
+ (BOOL)isBlankString:(NSString *)string;

/** 是否是当前用户*/
//+ (BOOL)isCurrentUserWithUserId:(NSInteger)userId;

///MD5 加密
+(NSString *)Pawmd5:(NSString *)str;

///获取设备型号
+ (NSString *)getDeviceName;

/// 获取iPhone名称
+ (NSString *)getiPhoneName;

/// 获取app版本号
+ (NSString *)getAPPVerion;

///判断字符串为空返回默认字符串@“”
+ (NSString *)validString:(NSString *)string;

@end
