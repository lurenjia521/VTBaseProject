//
//  NSString+Helper.m
//  Panku
//
//  Created by wangxu on 16/8/23.
//  Copyright © 2016年 Monster. All rights reserved.
//

#import "NSString+Helper.h"

#include <netdb.h>
#include <arpa/inet.h>
#include <net/if.h>
#include <ifaddrs.h>
#import <dlfcn.h>
#import <SystemConfiguration/CaptiveNetwork.h>

@implementation NSString (Helper)

#pragma mark清空字符串中的空白字符
- (NSString*)trimString
{
    return [self stringByReplacingOccurrencesOfString:@" " withString:@""];
}

#pragma mark是否空字符串
+ (BOOL)isNilOrEmptyString:(NSString *)string {
    
    if (!string) {
        return YES;
    }
    
    if ([string isKindOfClass:[NSNull class]]) {
        return YES;
    }
    
    NSCharacterSet *whitespaceAndNewlineCharacterSet = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    NSString *trimedString = [string stringByTrimmingCharactersInSet:whitespaceAndNewlineCharacterSet];
    
    if ([trimedString isEqualToString:@""]) {
        return YES;
    }
    
    return NO;
}

#pragma mark返回沙盒中的文件路径
- (NSString*)documentsPath
{
    NSString*path =NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES)[0];
    return[path stringByAppendingString:self];
}

#pragma mark写入UserDefaults
- (void)saveToNSDefaultsWithKey:(NSString*)key
{
    [[NSUserDefaults standardUserDefaults]setObject:self forKey:key];
    [[NSUserDefaults standardUserDefaults]synchronize];

}

- (BOOL)isMobileNumber
{
    if (self.length != 11)
    {
        return NO;
    }
    /**
          * 手机号码:
          * 13[0-9], 14[5,7], 15[0, 1, 2, 3, 5, 6, 7, 8, 9], 17[6, 7, 8], 18[0-9], 170[0-9]
          * 移动号段: 134,135,136,137,138,139,150,151,152,157,158,159,182,183,184,187,188,147,178,1705
          * 联通号段: 130,131,132,155,156,185,186,145,176,1709
          * 电信号段: 133,153,180,181,189,177,1700
          */
    NSString *MOBILE = @"^1(3[0-9]|4[57]|5[0-35-9]|8[0-9]|70)\\d{8}$";
    /**
          * 中国移动：China Mobile
          * 134,135,136,137,138,139,150,151,152,157,158,159,182,183,184,187,188,147,178,1705
          */
    NSString *CM = @"(^1(3[4-9]|4[7]|5[0-27-9]|7[8]|8[2-478])\\d{8}$)|(^1705\\d{7}$)";
    /**
          * 中国联通：China Unicom
          * 130,131,132,155,156,185,186,145,176,1709
          */
    NSString *CU = @"(^1(3[0-2]|4[5]|5[56]|7[6]|8[56])\\d{8}$)|(^1709\\d{7}$)";
    /**
          * 中国电信：China Telecom
          * 133,153,180,181,189,177,1700
          */
    NSString *CT = @"(^1(33|53|77|8[019])\\d{8}$)|(^1700\\d{7}$)";
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    if (([regextestmobile evaluateWithObject:self] == YES)
        || ([regextestcm evaluateWithObject:self] == YES)
        || ([regextestct evaluateWithObject:self] == YES)
        || ([regextestcu evaluateWithObject:self] == YES))    {
        return YES;
    }
    else
    {
        return NO;
    }
}

+ (NSString *)changeToMD5:(NSString *)str{

    const char *cStr = [str UTF8String];
    unsigned char digest[16];
    CC_MD5( cStr, (CC_LONG)strlen(cStr), digest ); // This is the md5 call

    NSMutableString *output = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];

    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
        [output appendFormat:@"%02x", digest[i]];

    return  output;
}
//将时间转成时间戳
+(NSInteger)timeSwitchTimestamp:(NSString *)formatTime andFormatter:(NSString *)format{
    
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:format]; //(@"YYYY-MM-dd hh:mm:ss") ----------设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];
    [formatter setTimeZone:timeZone];
    
    NSDate* date = [formatter dateFromString:formatTime]; //------------将字符串按formatter转成nsdate
    //时间转时间戳的方法:
    NSInteger timeSp = [[NSNumber numberWithDouble:[date timeIntervalSince1970]] integerValue];
    
    return timeSp;
    
}
//将时间戳转成时间
+(NSString *)timestampSwitchTime:(NSInteger)timestamp andFormatter:(NSString *)format{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:format]; // （@"YYYY-MM-dd hh:mm:ss"）----------设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时
    NSTimeZone *timeZone = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];
    [formatter setTimeZone:timeZone];
    NSDate *confromTimesp = [NSDate dateWithTimeIntervalSince1970:timestamp];
    
    NSString *confromTimespStr = [formatter stringFromDate:confromTimesp];
    
    return confromTimespStr;
}
//获取当前时间的时间戳
+(NSInteger)getNowTimestampWithFormatter:(NSString *)format{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:format]; // ----------设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制//YYYY-MM-dd HH:mm:ss
    //设置时区,这个对于时间的处理有时很重要
    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];
    [formatter setTimeZone:timeZone];
    NSDate *datenow = [NSDate date];//现在时间
//    MYLog(@"设备当前的时间:%@",[formatter stringFromDate:datenow]);
    //时间转时间戳的方法:
    NSInteger timeSp = [[NSNumber numberWithDouble:[datenow timeIntervalSince1970]] integerValue];
//    MYLog(@"设备当前的时间戳:%ld",(long)timeSp); //时间戳的值
    return timeSp;
}


+(NSString *)getTimeIntervalWithDate:(NSDate *)date{
    
    //获取时间区域（上午、 下午）
    NSString * hour = [NSString DateTOString:date DateFormat:@"HH"];
    NSInteger hourInt = [hour integerValue];
    NSString *des = [NSString getDescriptionWithMoment:hourInt];
    
    //
    NSString *moment = [NSString DateTOString:date DateFormat:@"HH:mm"];
    
    return [NSString stringWithFormat:@"%@ %@",des,moment];
    
}
//日期格式化转字符串
+ (NSString *)DateTOString:(NSDate *)sender DateFormat:(NSString *)dateFormat
{
    //设置时间显示的格式
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //设置显示类型
    dateFormatter.dateFormat = dateFormat;
    //设置月份显示的时候为数字
    [dateFormatter setMonthSymbols:[NSArray arrayWithObjects:@"01",@"02",@"03",@"04",@"05",@"06",@"07",@"08",@"09",@"10",@"11",@"12", nil]];
    NSString * DateStr = [dateFormatter stringFromDate:sender]; // date转换成为字符串
    return DateStr;
}
+(NSString *)getDescriptionWithMoment:(NSInteger)moment{
    
    /**
     清晨：5-7
     早上（早晨）：7-9
     上午：9-12
     中午：12-14
     下午：14-17
     傍晚：17-19
     晚上：19-21
     深夜：21-24
     凌晨：0-5
     
     */
    
    NSString * des = @"";
    if (moment < 6) {
        des = @"凌晨";
    }else if (moment < 12) {
        des = @"上午";
    }else if (moment < 18) {
        des = @"下午";
    }else {
        des = @"晚上";
    }
    
    return des;
}

//系统格林尼治时间 转当前时区时间
+ (NSDate *)getDateWithDate:(NSDate *)date{
    NSTimeZone *zone = [NSTimeZone systemTimeZone]; // 获得系统的时区
    NSTimeInterval time = [zone secondsFromGMTForDate:date];// 以秒为单位返回当前时间与系统格林尼治时间的差
    NSDate *newDate = [date dateByAddingTimeInterval:time];// 然后把差的时间加上,就是当前系统准确的时间
    return newDate;
}


//字符串转日期
+ (NSDate *)StringTODate:(NSString *)sender andFormatter:(NSString *)format
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:format]; //(@"YYYY-MM-dd HH:mm:ss") ----------设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
    //    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];
    NSTimeZone *timeZone = [NSTimeZone systemTimeZone]; // 获得系统的时区
    [formatter setTimeZone:timeZone];
    
    NSDate* date = [formatter dateFromString:sender]; //------------将字符串按formatter转成nsdate
    return date;
}
//日期格式化转字符串
+ (NSString *)DateTOString:(NSDate *)sender
{
    //设置时间显示的格式
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //设置显示类型
    dateFormatter.dateFormat = @"HH:mm";
    //设置月份显示的时候为数字
    [dateFormatter setMonthSymbols:[NSArray arrayWithObjects:@"01",@"02",@"03",@"04",@"05",@"06",@"07",@"08",@"09",@"10",@"11",@"12", nil]];
    NSString * DateStr = [dateFormatter stringFromDate:sender]; // date转换成为字符串
    return DateStr;
}


+(NSMutableArray *)getArrWidthPlistName:(NSString *)plistName{
    
    NSMutableArray *elementArr = [NSMutableArray array];
    
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:plistName ofType:@"plist"];
    NSArray *dataArr = [[NSArray alloc]initWithContentsOfFile:plistPath];
    NSArray *list = [NSMutableArray arrayWithArray:dataArr];
    
    for (NSDictionary *dic in list) {
        NSInteger count = [[dic objectForKey:@"repeatCount"] integerValue];
        NSArray *contentArr = [dic objectForKey:@"content"];
        
        for (int i = 0; i < count; i++) {
            for (NSString *str in contentArr) {
                [elementArr addObject:str];
            }
        }
        
    }
    
    return elementArr;
    
}
+ (NSString*)weekdayStringFromDate:(NSString*)timeStamp {
    
    NSArray *weekdays = [NSArray arrayWithObjects: @"周日", @"周一", @"周二", @"周三", @"周四", @"周五", @"周六", nil];
    
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    
    NSTimeZone *timeZone = [[NSTimeZone alloc] initWithName:@"Asia/Shanghai"];
    
    [calendar setTimeZone: timeZone];
    
    NSCalendarUnit calendarUnit = NSWeekdayCalendarUnit;
    
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:[timeStamp integerValue]];
    NSDateComponents *theComponents = [calendar components:calendarUnit fromDate:date];
    MYLog(@"theComponents.weekday: %ld",theComponents.weekday);
    return [weekdays objectAtIndex:theComponents.weekday-1];
    
}
//邮箱地址的正则表达式
+ (BOOL)isValidateEmail:(NSString *)email{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}


+ (NSString*)lookupHostIPAddressForURL:(NSURL*)url
{
    NSLock * lock = [[NSLock alloc]init];
    [lock lock];
    // Ask the unix subsytem to query the DNS
    struct hostent *remoteHostEnt = gethostbyname([[url host] UTF8String]);
    // Get address info from host entry
    struct in_addr *remoteInAddr = (struct in_addr *) remoteHostEnt->h_addr_list[0];
    // Convert numeric addr to ASCII string
    char *sRemoteInAddr = inet_ntoa(*remoteInAddr);
    // hostIP
    NSString* hostIP = [NSString stringWithUTF8String:sRemoteInAddr];
    [lock unlock];
    return hostIP;
}


-(NSString *) getIPWithHostName:(const NSString *)hostName
{
    const char *hostN= [hostName UTF8String];
    struct hostent* phot;
    
    @try {
        phot = gethostbyname(hostN);
        
    }
    @catch (NSException *exception) {
        return nil;
    }
    
    struct in_addr ip_addr;
    memcpy(&ip_addr, phot->h_addr_list[0], 4);
    char ip[20] = {0};
    inet_ntop(AF_INET, &ip_addr, ip, sizeof(ip));
    
    NSString* strIPAddress = [NSString stringWithUTF8String:ip];
    return strIPAddress;
}


@end
