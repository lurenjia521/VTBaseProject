//
//  VTBaseViewController.h
//  LW_baseProject
//
//  Created by lianjie on 2018/3/30.
//  Copyright © 2018年 lianjie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIViewController+MainController.h"
#import "BaseRequestManager.h"
#import "WTAlert.h"
@interface VTBaseViewController : UIViewController


///提示弹窗
-(void) showSignView:(UIViewController *)ctrl message:(NSString *)message;

/**
 网络请求
 POST：
 1、URLString：服务地址目录。EXP：/web/servercode/passWord.htm（服务器地址已经拼接好）
 2、Parameters（id类型）：请求参数。如果为没有参数传nil即可。（有则根据具体类型进行传递）
 3、返回参数responseObject：（一般为JSON类型）
 4、ctrl：请求对象的弱引用：__weak修饰。
 */
- (void) POST:(NSString *)URLString parameters:(id)parameters success:(void (^)(id))success ctrl:(UIViewController *)ctrl;

@end
