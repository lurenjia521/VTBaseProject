//
//  UIWindow+MainWindow.h
//  BaseProject
//
//  Created by lianjie on 2017/10/31.
//  Copyright © 2017年 lianjie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIWindow (MainWindow)

///根据版本号判断是否显示新特性（判断版本当前版本并切换视图）
-(void)switchRootViewController;


///切换跟视图控制器到首页
-(void)backMainRootViewController;
@end
