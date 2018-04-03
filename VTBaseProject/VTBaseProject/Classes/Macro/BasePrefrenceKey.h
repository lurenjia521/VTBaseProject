//
//  BasePrefrenceKey.h
//  BaseProject
//
//  Created by lianjie on 2017/10/31.
//  Copyright © 2017年 lianjie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface BasePrefrenceKey : NSObject
/**版本号*/
UIKIT_EXTERN NSString *const versionKey;

///是否登录
UIKIT_EXTERN NSString *const kELHasLoginFlag;

/**微信*/
UIKIT_EXTERN NSString *const WeChatAPP_KEY;
/**QQ*/
UIKIT_EXTERN NSString *const TencentAPP_KEY;
/**支付宝*/
UIKIT_EXTERN NSString *const AlipayAPP_KEY;
/**友盟*/
UIKIT_EXTERN NSString *const UMengAPP_KEY;

@end
