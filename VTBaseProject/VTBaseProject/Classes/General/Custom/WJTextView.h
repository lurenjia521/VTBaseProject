//
//  WJTextView.h
//  DengGaoYunShan
//
//  Created by lianjie on 2017/11/16.
//  Copyright © 2017年 lianjie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WJTextView : UITextView
/** 占位文字 */
@property (nonatomic, copy) NSString *placeholder;
/** 占位文字颜色 */
@property (nonatomic, strong) UIColor *placeholderColor;

@end
