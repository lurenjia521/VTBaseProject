//
//  NSString+Helper.h
//  Panku
//
//  Created by wangxu on 16/8/23.
//  Copyright © 2016年 Monster. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <CommonCrypto/CommonCrypto.h>

@interface NSString (Helper)
/**
 *清空字符串中的空格字符
 *
 *@return清除空格字符串之后的字符串
 */
- (NSString*)trimString;

/**
 *是否空字符串
 *
 *@return如果字符串为nil或者长度为0返回YES
 */
+ (BOOL)isNilOrEmptyString:(NSString *)string;

/**
 *返回沙盒中的文件路径
 *@return返回当前字符串对应在沙盒中的完整文件路径
 */
- (NSString*)documentsPath;

/**写入UserDefaults**/
- (void)saveToNSDefaultsWithKey:(NSString*)key;

/**手机号码**/
- (BOOL)isMobileNumber;
/** MD5加密 **/
+ (NSString *)changeToMD5:(NSString *)str;

/**判断是否为邮箱地址**/
+ (BOOL)isValidateEmail:(NSString *)email;

/*将某个时间转化成时间戳*/
+(NSInteger)timeSwitchTimestamp:(NSString *)formatTime andFormatter:(NSString *)format;
//获取当前时间的时间戳
+(NSInteger)getNowTimestampWithFormatter:(NSString *)format;
//将时间戳转成时间
+(NSString *)timestampSwitchTime:(NSInteger)timestamp andFormatter:(NSString *)format;
//获取某一时刻的时间描述
+(NSString *)getTimeIntervalWithDate:(NSDate *)date;

//日期转字符串
+ (NSString *)DateTOString:(NSDate *)sender DateFormat:(NSString *)dateFormat;
//获取当前时间（点）所属时间区域
+(NSString *)getDescriptionWithMoment:(NSInteger)moment;

//系统格林尼治时间 转当前时区时间
+(NSDate *)getDateWithDate:(NSDate *)date;

//字符串转日期
+ (NSDate *)StringTODate:(NSString *)sender andFormatter:(NSString *)format;

//日期格式化转字符串
+ (NSString *)DateTOString:(NSDate *)sender;

/**
 获取plist文件数据
 @param plistName plist文件名
 @return plist数据
 */
+(NSMutableArray *)getArrWidthPlistName:(NSString *)plistName;

/**
 根据时间戳获取周几
 @param timeStamp 时间戳
 @return 周几
 */
+ (NSString*)weekdayStringFromDate:(NSString*)timeStamp;

@end











