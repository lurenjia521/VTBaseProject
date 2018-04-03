//
//  BaseDefine.h
//  BaseProject
//
//  Created by lianjie on 2017/10/31.
//  Copyright © 2017年 lianjie. All rights reserved.
//

#ifndef BaseDefine_h
#define BaseDefine_h

#pragma mark ----UIColor（颜色）
/**颜色*/
#define ClearColor [UIColor clearColor]//透明
#define WhiteColor [UIColor whiteColor]//白色
#define BlackColor [UIColor blackColor]//黑色
#define VTColor(r,g,b,a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define UIColorFromRGB(rgbValue)  [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0f green:((float)((rgbValue & 0xFF00) >> 8))/255.0f blue:((float)(rgbValue & 0xFF))/255.0f alpha:1.0f]
#define VTC(r,g,b) WJColor(r,g,b,1.0f)
#define NavRed UIColorFromRGB(0xFF4872)
/**
 tabBarColor
 */
#define tabBarNormalColor WJC(53.0f, 53.0f, 53.0f)
#define tabBarSelectColor WJC(29.0f, 150.0f, 211.0f)

/**尺寸*/
#pragma mark ---ViewSize（尺寸）

#define kiPhone6_W 375



/***  当前屏幕宽度 */
#define VTScreenWidth  [[UIScreen mainScreen] bounds].size.width
/***  当前屏幕高度 */
#define VTScreenHeight  [[UIScreen mainScreen] bounds].size.height

///比例尺寸
#define autoScaleW(width)   [self autoScaleW:(width)]
#define autoScaleH(height) [self autoScaleH:(height)]
#define aScaleW(width)   [self aScaleW:(width)]
#define aScaleH(height) [self aScaleH:(height)]
///CGRectMake
#define vtRect(x,y,w,h) CGRectMake(aScaleW(x), aScaleH(y), aScaleW(w), aScaleH(h))

///字体大小
#define VTfonts(Size)  [UIFont systemFontOfSize:aScaleH(Size)]

#define VTfonts36  [self aScaleW:22]
#define VTfonts30  [self aScaleW:19]
//#define VTfonts26  [self aScaleW:15]
//#define VTfonts24  [self aScaleW:14]
//#define VTfonts20  [self aScaleW:12]
//#define VTfonts18  [self aScaleW:10]
//#define VTfonts14  [self aScaleW:8]



#pragma mark ---其他
/**其他*/

/**若指针*/
#define WeakSelf(weakSelf)  __weak __typeof(&*self)weakSelf = self;

/**打印*/
#ifdef DEBUG // 处于开发阶段
#define VTLog(...) NSLog(__VA_ARGS__)
#else // 处于发布阶段
#define VTLog(...)
#endif

/**观察者*/
#define APPNotificationCenter [NSNotificationCenter defaultCenter]

/**用户管理者*/
#define APPUserDefaults [NSUserDefaults standardUserDefaults]

/**窗口中心*/
#define APPWindow [UIApplication sharedApplication].keyWindow
#endif /* BaseDefine_h */
