//
//  UIView+Extension.m
//  Panku
//
//  Created by wangxu on 16/8/23.
//  Copyright © 2016年 Monster. All rights reserved.
//

#import "UIView+PKExtension.h"
#import "MBProgressHUD.h"
#import <objc/runtime.h>
const char *hodKey;
@implementation UIView (PKExtension)

- (void)HUDShowText:(NSString *)title{
    
    UIWindow *window = [[UIApplication sharedApplication].delegate window];
    
    MBProgressHUD *HUD = [[MBProgressHUD alloc] initWithView:self];
    [window addSubview:HUD];
    HUD.label.text = title;
    HUD.mode = MBProgressHUDModeText;
    
    [HUD showAnimated:YES whileExecutingBlock:^{
        sleep(2);
    } completionBlock:^{
        [HUD removeFromSuperview];
    }];
}

- (void)HUDShowText:(NSString *)title completBlock:(void (^)())complet{
    
    UIWindow *window = [[UIApplication sharedApplication].delegate window];
    
    MBProgressHUD *HUD = [[MBProgressHUD alloc] initWithView:self];
    [window addSubview:HUD];
    HUD.label.text = title;    HUD.mode = MBProgressHUDModeText;
    
    [HUD showAnimated:YES whileExecutingBlock:^{
        sleep(2);
    } completionBlock:^{
        [HUD removeFromSuperview];
        complet();
    }];
}


- (void)setViewX:(CGFloat)viewX{
    CGRect frame = self.frame;
    frame.origin.x = viewX;
    self.frame = frame;
}
- (CGFloat)viewX
{
    return self.frame.origin.x;
}


- (void)setViewY:(CGFloat)viewY{
    
    CGRect frame = self.frame;
    frame.origin.y = viewY;
    self.frame =  frame;
}
- (CGFloat)viewY
{
    return self.frame.origin.y;
}


- (void)setViewMaxX:(CGFloat)viewMaxX{
    
    self.viewX = viewMaxX - self.viewWidth;
}
- (CGFloat)viewMaxX
{
    return CGRectGetMaxX(self.frame);
}

- (void)setViewMaxY:(CGFloat)viewMaxY{
    
    self.viewY = viewMaxY - self.viewHeight;
}
- (CGFloat)viewMaxY
{
     return CGRectGetMaxY(self.frame);
}

- (void)setViewCenterX:(CGFloat)viewCenterX{
    CGPoint center = self.center;
    center.x = viewCenterX;
    self.center = center;
}
- (CGFloat)viewCenterX{
    
    return self.center.x;
}
- (void)setViewCenterY:(CGFloat)viewCenterY{
    CGPoint center = self.center;
    center.y = viewCenterY;
    self.center = center;
}
- (CGFloat)viewCenterY{
    
    return self.center.y;
}

- (void)setViewWidth:(CGFloat)viewWidth
{
    CGRect frame = self.frame;
    frame.size.width = viewWidth;
    self.frame =frame;
}
- (CGFloat)viewWidth{
    
    return self.frame.size.width;
}

- (void)setViewHeight:(CGFloat)viewHeight{
    CGRect frame = self.frame;
    frame.size.height = viewHeight;
    self.frame = frame;
}
- (CGFloat)viewHeight{
    return self.frame.size.height;
}


- (void)setViewSize:(CGSize)viewSize{
    CGRect frame = self.frame;
    frame.size = viewSize;
    self.frame = frame;
}
- (CGSize)viewSize{
    return self.frame.size;
}

- (void)showLoding {
    MBProgressHUD *HUD = objc_getAssociatedObject(self, hodKey);
    if (HUD) {
        [HUD hideAnimated:YES];
        [HUD removeFromSuperview];
    }
    // as the HUD would move with the content as we scroll).
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self animated:YES];
    // 属性的动态绑定
    objc_setAssociatedObject(self, hodKey, hud, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)hiddenLoding {
    
    MBProgressHUD *hud = objc_getAssociatedObject(self, hodKey);
    [hud hideAnimated:YES];
    [hud removeFromSuperview];
    hud = nil;
}
-(void)lodingFaile{
    
    MBProgressHUD *hud = objc_getAssociatedObject(self, hodKey);
    [hud hideAnimated:YES];
    [hud removeFromSuperview];
    hud = nil;
    
    MBProgressHUD *HUD = [[MBProgressHUD alloc] initWithView:self];
    [self addSubview:HUD];
    HUD.label.text = @"请求失败";
    HUD.mode = MBProgressHUDModeText;
    HUD.layer.zPosition = 5.0;
    [HUD showAnimated:YES whileExecutingBlock:^{
        sleep(1);
    } completionBlock:^{
        [HUD removeFromSuperview];
    }];
    
    
}


@end
