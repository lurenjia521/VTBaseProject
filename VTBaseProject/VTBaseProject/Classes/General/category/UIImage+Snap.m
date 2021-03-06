//
//  UIImage+TY_Snap.m
//  TYFoundationDemo
//
//  Created by tanyang on 15/12/8.
//  Copyright © 2015年 tanyang. All rights reserved.
//

#import "UIImage+Snap.h"

@implementation UIImage (TY_Snap)

+ (UIImage *)snapshotWithView:(UIView *)view
{
    return [self snapshotWithView:view size:view.bounds.size];
}

+ (UIImage *)snapshotWithView:(UIView *)view size:(CGSize)snapSize
{
    UIGraphicsBeginImageContextWithOptions(snapSize, NO, 0);
    [view drawViewHierarchyInRect:view.bounds afterScreenUpdates:YES];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}



+ (UIImage *)imageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

@end
