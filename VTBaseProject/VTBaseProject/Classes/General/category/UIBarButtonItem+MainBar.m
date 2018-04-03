//
//  UIBarButtonItem+MainBar.m
//  BaseProject
//
//  Created by lianjie on 2017/10/31.
//  Copyright © 2017年 lianjie. All rights reserved.
//
/*******方便tabBar的设置，进行了封装处理******/
#import "UIBarButtonItem+MainBar.h"
#import "NSString+Addition.h"

@implementation UIBarButtonItem (MainBar)

/**
 *  创建一个item
 *
 *  @param target    点击item后调用哪个对象的方法
 *  @param action    点击item后调用target的哪个方法
 *  @param image     图片
 *  @param highImage 高亮的图片
 *
 *  @return 创建完的item
 */
+ (UIBarButtonItem *)itemWithTarget:(id)target action:(SEL)action image:(NSString *)image highImage:(NSString *)highImage andTitle:(NSString *)title
{
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    ///设置图片
    [button setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:highImage] forState:UIControlStateHighlighted];
    
    if (title) {
        
        
        [button setTitle:title forState:UIControlStateNormal];
        
        ///设置tabbar文字的大小
        button.titleLabel.font = [UIFont systemFontOfSize:15];
        
        ///设置tabbar文字的不同状态颜色
        [button setTitleColor:WhiteColor forState:UIControlStateNormal];
        [button setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
        
    }
    
    [button setImageEdgeInsets:UIEdgeInsetsMake(0, -15, 0, 0)];
    
    [button setTitleEdgeInsets:UIEdgeInsetsMake(3, -10, 3, 5)];
    
    ///设置按钮的尺寸为背景图片的尺寸+文字大小
    
    button.width = button.currentImage.size.width + [title sizeWithFont:button.titleLabel.font maxSize:CGSizeMake(MAXFLOAT, MAXFLOAT)].width;
    
    button.height = button.currentImage.size.height;
    
    return [[UIBarButtonItem alloc]initWithCustomView:button];
    
    
    
}


@end
