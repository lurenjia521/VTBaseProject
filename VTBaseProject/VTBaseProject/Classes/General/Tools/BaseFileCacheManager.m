//
//  BaseFileCacheManager.m
//  BaseProject
//
//  Created by lianjie on 2017/11/3.
//  Copyright © 2017年 lianjie. All rights reserved.
//

#import "BaseFileCacheManager.h"
#import "NSFileManager+Paths.h"

@implementation BaseFileCacheManager

+(NSString *)appendFileName:(NSString *)fileName
{
    ///1、沙盒缓存路径
    NSString *cachesPath = [NSFileManager cachesPath];
    
    if ([[NSFileManager defaultManager] fileExistsAtPath:cachesPath isDirectory:nil]) {
        
        [[NSFileManager defaultManager] createDirectoryAtPath:cachesPath withIntermediateDirectories:NO attributes:nil error:nil];
    }
    
    return cachesPath;
}


///把对象归档到沙盒路径
+ (BOOL)saveObject:(id)object byFileName:(NSString *)fileName
{
    ///获取沙盒路径
    NSString *path = [self appendFilePath:fileName];
    //拼接路径
    path = [path stringByAppendingString:@".archive"];
    
    BOOL sucess = [NSKeyedArchiver archiveRootObject:object toFile:path];
    
    return sucess;
}

///通过文件名从沙盒中找到归档的对象
+ (id)getObjectByFileName:(NSString *)fileName
{
    NSString *path = [self appendFilePath:fileName];
    path = [path stringByAppendingString:@".archive"];
    
    id obj = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    
    return obj;
}

///根据文件名删除沙盒中的文件
+(void)removeObjectByFileName:(NSString *)fileName
{
    NSString *path = [self appendFilePath:fileName];
    path = [path stringByAppendingString:@".archive"];
    
    [[NSFileManager defaultManager] removeItemAtPath:path error:nil];
}

/**拼接文件路径*/
+(NSString *)appendFilePath:(NSString *)fileName
{
    ///1、沙盒路径
    NSString *cachesPath = [NSFileManager cachesPath];
    
    NSString *filePath = [NSString stringWithFormat:@"%@/%@",cachesPath,fileName];
    
    if (![[NSFileManager defaultManager] fileExistsAtPath:filePath isDirectory:nil]) {
        
        [[NSFileManager defaultManager] createDirectoryAtPath:filePath withIntermediateDirectories:NO attributes:nil error:nil];
        
    }
    return filePath;
    
}

///用户属性列表保存
+(void)saveUserData:(id)data forKey:(NSString *)key
{
    [[NSUserDefaults standardUserDefaults] setObject:data forKey:key];
    
    [[NSUserDefaults standardUserDefaults] synchronize];
    
}

///读取用户偏好设置属性
+(id) readUserDataForKey:(NSString *)key
{
    id obj = [[NSUserDefaults standardUserDefaults] objectForKey:key];
    [[NSUserDefaults standardUserDefaults] synchronize];
    return obj;
}

///删除用户偏好设置
+ (void)removeUserDataForkey:(NSString *)key
{
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:key];
    
    [[NSUserDefaults standardUserDefaults] synchronize];
}
@end
