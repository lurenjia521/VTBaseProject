//
//  UserInfoManager.h
//  DengGaoYunShan
//
//  Created by lianjie on 2017/11/6.
//  Copyright © 2017年 lianjie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseUserInfoModel.h"
@interface UserInfoManager : NSObject



+ (instancetype)sharedManager;

/**
 *  登录成功
 */
- (void)didLoginInWithUserInfo:(id)userInfo;

/**
 *  退出
 */
- (void)didLoginOut;

/**
 *  获取用户信息
 */
- (BaseUserInfoModel *)currentUserInfo;

/**
 *  更新缓存中的用户信息
 */
- (void)resetUserInfoWithUserInfo:(BaseUserInfoModel *)userInfo;

/**
 *  用来记录是否是登陆状态
 */
@property (nonatomic, assign) BOOL isLogin;

@end
