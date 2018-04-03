//
//  UIView+Extension.h
//  Panku
//
//  Created by wangxu on 16/8/23.
//  Copyright © 2016年 Monster. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (PKExtension)

/** view的x坐标值*/
@property (nonatomic, assign) CGFloat viewX;
/** view的y坐标值*/
@property (nonatomic, assign) CGFloat viewY;
/** view的宽度*/
@property (nonatomic, assign) CGFloat viewWidth;
/** view的高度*/
@property (nonatomic, assign) CGFloat viewHeight;
/** view的x坐标的最大值*/
@property (nonatomic, assign) CGFloat viewMaxX;
/** view的y坐标最大值*/
@property (nonatomic, assign) CGFloat viewMaxY;
/** view的中心点x值*/
@property (nonatomic, assign) CGFloat viewCenterX;
/** view的中心点y值*/
@property (nonatomic, assign) CGFloat viewCenterY;
/** view的大小*/
@property (nonatomic, assign) CGSize viewSize;

/**
 *  显示网络加载框
 */
- (void)showLoding;

/**
 *  隐藏网络加载框
 */
- (void)hiddenLoding;


-(void)lodingFaile;
/**
 *  显示提示信息
 */
- (void)HUDShowText:(NSString *)title;

/**
 *  显示提示信息
 */
- (void)HUDShowText:(NSString *)title completBlock:(void (^)(void))complet;

@end
