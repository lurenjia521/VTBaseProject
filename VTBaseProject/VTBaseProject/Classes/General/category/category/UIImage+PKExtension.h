//
//  UIImage+Extension.h
//  Panku
//
//  Created by wangxu on 16/8/23.
//  Copyright © 2016年 Monster. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (PKExtension)

/**
 从中心点拉伸的图片
 @param name 图片名
 */
+ (UIImage *)resizedImageWithName:(NSString *)name;
/**
 *  根据图片名拉伸一张图片
 *  @param name 图片名
 *  @param left 图片拉伸部分距离左边的百分比
 *  @param top  图片拉伸部分距离右边的百分比
 *
 *  @return 拉升后的图片
 */
+ (UIImage *)resizedImageWithName:(NSString *)name left:(CGFloat)left top:(CGFloat)top;

/**
 根据颜色来创建一个纯色img

 @param color 颜色
 @param size 大小
 @return 图片
 */
+ (UIImage *)createImageWithColor:(UIColor *)color size:(CGSize)size;
@end
