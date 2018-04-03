//
//  UIBarButtonItem+MainBar.h
//  BaseProject
//
//  Created by lianjie on 2017/10/31.
//  Copyright © 2017年 lianjie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (MainBar)



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
+ (UIBarButtonItem *)itemWithTarget:(id)target action:(SEL)action image:(NSString *)image highImage:(NSString *)highImage andTitle:(NSString *)title;

@end
