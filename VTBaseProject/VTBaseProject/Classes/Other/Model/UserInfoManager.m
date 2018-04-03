//
//  UserInfoManager.m
//  DengGaoYunShan
//
//  Created by lianjie on 2017/11/6.
//  Copyright © 2017年 lianjie. All rights reserved.
//

#import "UserInfoManager.h"
#import "BaseUserInfoModel.h"
#import "BaseFileCacheManager.h"

static UserInfoManager *_singleton = nil;

@implementation UserInfoManager

+ (instancetype)sharedManager {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _singleton = [[UserInfoManager alloc] init];
    });
    return _singleton;
}

// 当前用户信息
- ( BaseUserInfoModel*)currentUserInfo {
    
    id obj = [BaseFileCacheManager getObjectByFileName:NSStringFromClass([BaseUserInfoModel class])];
    if (obj != nil) {
        return  obj;
    }
    return nil;
}

// 重置用户信息
- (void)resetUserInfoWithUserInfo:(BaseUserInfoModel *)userInfo {
    [userInfo archive];
}

// 登陆
- (void)didLoginInWithUserInfo:(id)userInfo {
    
    BaseUserInfoModel *userinfo = [BaseUserInfoModel modelWithDictionary:userInfo];
    [userinfo archive];
    
    [BaseFileCacheManager saveUserData:@YES forKey:kELHasLoginFlag];
}

// 退出登陆
- (void)didLoginOut {
    [BaseFileCacheManager removeObjectByFileName:NSStringFromClass([BaseUserInfoModel class])];
    
    [BaseFileCacheManager saveUserData:@NO forKey:kELHasLoginFlag];
}

// 判断是否是登陆状态
- (BOOL)isLogin {
    return [[NSUserDefaults standardUserDefaults] boolForKey:kELHasLoginFlag];
}

@end
