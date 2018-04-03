//
//  AppDelegate.m
//  BaseProject
//
//  Created by kangbinbin on 2018/2/27.
//  Copyright © 2018年 kangbinbin. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc]init];
    self.window .frame = [UIScreen mainScreen].bounds;
    //设置跟控制器
    self.window.rootViewController = [[KTabBarViewController alloc]init];
    //显示窗口
    [self.window makeKeyAndVisible];

    [self KeyBoard];
    return YES;
}
//键盘处理
-(void)KeyBoard
{
    IQKeyboardManager *manager = [IQKeyboardManager sharedManager];
    // 控制整个功能是否启用。
    manager.enable = YES;
    // 控制点击背景是否收起键盘
    manager.shouldResignOnTouchOutside = YES;
    // 控制键盘上的工具条文字颜色是否用户自定义
    manager.shouldToolbarUsesTextFieldTintColor = YES;
    // 控制是否显示键盘上的工具条
    manager.enableAutoToolbar = YES;
    // 控制是否显示工具条上的文字
    manager.shouldShowToolbarPlaceholder = NO;
    // 最新版的设置键盘的returnKey的关键字 ,可以点击键盘上的next键，自动跳转到下一个输入框，最后一个输入框点击完成，自动收起键盘。
    manager.toolbarManageBehaviour = IQAutoToolbarByTag;
    
    //这两个界面不用IQKeyboardManager 这个第三方
    //    [[IQKeyboardManager sharedManager] disableToolbarInViewControllerClass:[VisitorsViewController class]];
    //
    //    [[IQKeyboardManager sharedManager] disableToolbarInViewControllerClass:[MIneViewController class]];
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
