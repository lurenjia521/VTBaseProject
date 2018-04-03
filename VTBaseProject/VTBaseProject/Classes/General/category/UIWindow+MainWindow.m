//
//  UIWindow+MainWindow.m
//  BaseProject
//
//  Created by lianjie on 2017/10/31.
//  Copyright © 2017年 lianjie. All rights reserved.
//

/**判断版本当前版本并切换视图**/

#import "UIWindow+MainWindow.h"

@implementation UIWindow (MainWindow)


///根据版本号判断是否显示新特性（判断版本当前版本并切换视图）
-(void)switchRootViewController
{
//    1、获取上次打开的版本号（存储在沙盒中的版本号）
    NSString *lastVersion = [APPUserDefaults objectForKey:versionKey];
    
//    2、当前的版本号(从info.plist文件中获取)
    NSString *currentVersion = [NSBundle mainBundle].infoDictionary[versionKey];
    if (lastVersion) {
        if ([currentVersion isEqualToString:lastVersion]) {
            ///如果版本一致，说明没有更新，回到跟视图控制器中
            self.rootViewController = [[NSClassFromString(@"MainTabBarController") alloc]init];
        }else{
            ///如果版本不一致，推出新特性视图
            self.rootViewController = [[NSClassFromString(@"NewFeatureCtrl.h") alloc]init];
            ///保存当前版本号
            [APPUserDefaults setObject:currentVersion forKey:versionKey];
            [APPUserDefaults synchronize];///同步保存
        }
    }else{
        ///如果版本不一致，推出新特性视图
        self.rootViewController = [[NSClassFromString(@"NewFeatureCtrl.h") alloc]init];
        ///保存当前版本号
        [APPUserDefaults setObject:currentVersion forKey:versionKey];
        [APPUserDefaults synchronize];///同步保存
    }

  
}
///切换跟视图控制器到首页
-(void)backMainRootViewController
{
    self.rootViewController = [[NSClassFromString(@"MainTabBarController") alloc]init];
}


@end
