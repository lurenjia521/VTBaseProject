//
//  UIButton+Extension.h
//  Panku
//
//  Created by wangxu on 16/8/25.
//  Copyright © 2016年 Monster. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (PKExtension)
/** button标题文字普通状态颜色*/
@property (strong, nonatomic) UIColor * _Nullable titleColor;
/** button标题文字高亮状态颜色*/
@property (strong, nonatomic) UIColor * _Nullable highlightedTitleColor;
/** button标题文字选中状态颜色*/
@property (strong, nonatomic) UIColor * _Nullable selectedTitleColor;

/** button普通状态标题文字*/
@property (copy, nonatomic) NSString * _Nullable title;
/** button高亮状态标题文字*/
@property (copy, nonatomic) NSString * _Nullable highlightedTitle;
/** button选中状态标题文字*/
@property (copy, nonatomic) NSString * _Nonnull selectedTitle;

/** button普通状态下图片*/
@property (copy, nonatomic) NSString * _Nullable image;
/** button高亮状态下图片*/
@property (copy, nonatomic) NSString * _Nullable highlightedImage;
/** button选中状态下图片*/
@property (copy, nonatomic) NSString * _Nullable selectedImage;

/** button普通状态下背景图片*/
@property (copy, nonatomic) NSString * _Nullable bgImage;
/** button高亮状态下背景图片*/
@property (copy, nonatomic) NSString * _Nonnull highlightedBgImage;
/** button选中状态下背景图片*/
@property (copy, nonatomic) NSString * _Nullable selectedBgImage;

/**
 *  快速添加按钮点击事件
 *
 *  @param target 代理
 *  @param action 点击事件
 */
- (void)addTarget:(id _Nonnull )target action:(SEL _Nonnull )action;

@end








