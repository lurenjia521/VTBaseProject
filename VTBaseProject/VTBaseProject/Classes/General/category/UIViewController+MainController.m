//
//  UIViewController+MainController.m
//  BaseProject
//
//  Created by lianjie on 2017/10/31.
//  Copyright © 2017年 lianjie. All rights reserved.
//
/********用于网络加载，提示动画**********/

#import "UIViewController+MainController.h"
#import <objc/runtime.h>

static CGFloat const  WSpacing = 16.0;
///绑定activity的Key
static char * const  WActivityIndicatorViewKey = "ActivityIndicatorView";
///绑定提示label的Key
static char * const ActivityMessageTextKey = "MessageText";

static CGFloat const WTitleViewHeight = 25.0f;

static CGFloat const WBarItemWidth = 52.0f;

static CGFloat const WMessageFontSize = 16.0f;

static CGFloat const WNavigationTitleFontSize = 20.0f;

@implementation UIViewController (MainController)

///设置导航提示
-(UIActivityIndicatorView *)navigationActivity
{
    
    UIView *customTitleView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame) - 4 *WSpacing - 2*WBarItemWidth, WTitleViewHeight)];
    
    UILabel *titleLabel = [[UILabel alloc]init];
    titleLabel.textColor = [UIColor whiteColor];
    
    titleLabel.font = [UIFont systemFontOfSize:WNavigationTitleFontSize];
    
    titleLabel.text = self.title;
    
    [customTitleView addSubview:titleLabel];
    
    
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.center.equalTo(customTitleView);
        
        make.height.equalTo(customTitleView);
    }];
    
    
    UIActivityIndicatorView *activity = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    
    [customTitleView addSubview:activity];
    
    [activity mas_makeConstraints:^(MASConstraintMaker *make) {
    
        
        make.centerY.equalTo(customTitleView);
        
        make.trailing.equalTo(titleLabel.mas_leading).offset(-10);
        
    }];
    
    self.navigationItem.titleView = customTitleView;
    
    ///关联对象
    objc_setAssociatedObject(self, &WActivityIndicatorViewKey, activity, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    return activity;
    
    
}

///加载动画（没有文字提示）
-(UIActivityIndicatorView *)activity
{
    UIActivityIndicatorView *_activity = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    
    [self.view addSubview:_activity];
    
    
    [_activity mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.center.equalTo(self.view);
        
        
    }];
    
    [_activity startAnimating];
    
    
    objc_setAssociatedObject(self, &WActivityIndicatorViewKey, _activity, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    return _activity;
}

////添加带文字的加载提示动画
- (UIActivityIndicatorView *)activityWithMessage:(NSString *)message
{
    UILabel *messageLabel = [UILabel new];
    messageLabel.textColor = [UIColor darkGrayColor];
    
    messageLabel.font = [UIFont systemFontOfSize:WMessageFontSize];
    
    messageLabel.text = message;
    
    [self.view addSubview:messageLabel];
    
    [messageLabel mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.centerX.equalTo(self.view);
        
        make.centerY.equalTo(self.view).offset(30);
        
        
    }];
    
    objc_setAssociatedObject(self, &ActivityMessageTextKey, messageLabel, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    return [self activity];
}

///隐藏动画
-(void)hidenActivity
{
    UIActivityIndicatorView *activity = objc_getAssociatedObject(self, &WActivityIndicatorViewKey);
    
    [activity stopAnimating];
    
    [activity removeFromSuperview];
    
    activity = nil;
    
    UILabel *message = objc_getAssociatedObject(self, &ActivityMessageTextKey);
    
    message.hidden = YES;
    
    [message removeFromSuperview];
    
    message = nil;
}

///判断是否加载动画
-(BOOL)isActivity
{
    UIActivityIndicatorView *activity = objc_getAssociatedObject(self, &WActivityIndicatorViewKey);
    
    return activity.isAnimating;
}

#pragma mark -----自定义动画
//定义关联的Key
static const char *key = "MBProgressHUD";
- (MBProgressHUD *)hud{
    
    return objc_getAssociatedObject(self, key);
}

- (void)setHud:(MBProgressHUD *)hud{
    objc_setAssociatedObject(self, key, hud, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)showIndicatorHint:(NSString *)hint {
    
    [self showIndicatorHint:hint yOffset:0];
}



- (void)showIndicatorHint:(NSString *)hint  yOffset:(CGFloat)yOffset {
    
    MBProgressHUD *HUD = [MBProgressHUD showHUDAddedTo:[UIApplication sharedApplication].keyWindow animated:YES];;
    HUD.label.text = hint;
    if (yOffset) {
        HUD.offset = CGPointMake(0, yOffset);
    }
    [HUD showAnimated:YES];
    HUD.margin = 20.0;
    self.hud = HUD;
}

- (void)showHint:(NSString *)hint {
    [self showHint:hint duration:2.0 yOffset:0];
}


- (void)showHint:(NSString *)hint duration:(NSTimeInterval)timeInterval yOffset:(CGFloat)yOffset {
    
    MBProgressHUD *HUD = [MBProgressHUD showHUDAddedTo:[UIApplication sharedApplication].keyWindow animated:YES];;
    HUD.mode = MBProgressHUDModeText;
    HUD.label.text = hint;
    if (yOffset) {
        HUD.offset = CGPointMake(0, yOffset);
    }
    HUD.removeFromSuperViewOnHide = YES;
    [HUD showAnimated:YES];
    [HUD hideAnimated:YES afterDelay:timeInterval];
    
}

- (void)showHint:(UIView *)view  hint:(NSString *)hint duration:(NSTimeInterval)timeInterval yOffset:(CGFloat)yOffset {
    
    MBProgressHUD *HUD = [MBProgressHUD showHUDAddedTo:self.view animated:YES];;
    HUD.mode = MBProgressHUDModeText;
    HUD.label.text = hint;
    if (yOffset) {
        HUD.offset = CGPointMake(0, yOffset);
    }
    HUD.removeFromSuperViewOnHide = YES;
    [HUD showAnimated:YES];
    [HUD hideAnimated:YES afterDelay:timeInterval];
}

- (void)hideHud:(BOOL)animated {
    [self.hud hideAnimated:animated];
}


@end
