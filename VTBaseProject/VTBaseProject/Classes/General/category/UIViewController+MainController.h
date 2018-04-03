//
//  UIViewController+MainController.h
//  BaseProject
//
//  Created by lianjie on 2017/10/31.
//  Copyright © 2017年 lianjie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"
@interface UIViewController (MainController)


#pragma mark --------系统自带的加载动画
/**导航加载动画*/
- (UIActivityIndicatorView *)navigationActivity;

/**页面中心的加载圆圈，没有提示文字*/
- (UIActivityIndicatorView *)activity;
/**
 页面中间的加载圆圈，有文字提示
 */
- (UIActivityIndicatorView *)activityWithMessage:(NSString *)message;
/**
 隐藏加载动画
 */
- (void)hidenActivity;
/**
 判断动画是否开启状态
 */
- (BOOL)isActivity;

#pragma mark -----自定义加载动画

@property (nonatomic,strong) MBProgressHUD *hud;

- (void)hideHud:(BOOL)animated;
/**
 显示提示信息(有菊花, 一直显示, 不消失)
 
 - parameter view:    显示在哪个View上
 - parameter hint:    提示信息
 - parameter yOffset: y上的偏移量
 */
- (void)showIndicatorHint:(NSString *)hint yOffset:(CGFloat)yOffset;

/**
 显示提示信息(有菊花, 一直显示, 不消失)
 
 - parameter view:    显示在哪个View上
 - parameter hint:    提示信息
 
 */
- (void)showIndicatorHint:(NSString *)hint;
///提示文字展示2秒
- (void)showHint:(NSString *)hint;

/**
 显示纯文字提示信息(显示在keywindow上)
 
 - parameter hint: 提示信息
 - parameter duration: 持续时间(不填的话, 默认两秒)
 - parameter yOffset: y上的偏移量
 */
- (void)showHint:(NSString *)hint duration:(NSTimeInterval)timeInterval yOffset:(CGFloat)yOffset;

/**
 显示纯文字提示信息
 
 - parameter hint: 显示在哪个View上
 - parameter hint: 提示信息
 - parameter duration: 持续时间(不填的话, 默认两秒)
 - parameter yOffset: y上的偏移量
 */
- (void)showHint:(UIView *)view  hint:(NSString *)hint duration:(NSTimeInterval)timeInterval yOffset:(CGFloat)yOffset;
@end
