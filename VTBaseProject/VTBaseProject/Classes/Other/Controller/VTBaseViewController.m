//
//  VTBaseViewController.m
//  LW_baseProject
//
//  Created by lianjie on 2018/3/30.
//  Copyright © 2018年 lianjie. All rights reserved.
//

#import "VTBaseViewController.h"
#import "AFNetworking.h"
#import "AFNetworkActivityIndicatorManager.h"

@interface VTBaseViewController ()

@end

@implementation VTBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = WhiteColor;
    
    
    UITableView.appearance.estimatedRowHeight = 0;
    UITableView.appearance.estimatedSectionFooterHeight = 0;
    UITableView.appearance.estimatedSectionHeaderHeight = 0;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}



#pragma mark -----网络请求
- (void) POST:(NSString *)URLString parameters:(id)parameters success:(void (^)(id))success ctrl:(UIViewController *)ctrl
{
    
    [self checkNetworkAvailable:^(BOOL hasNet) {
       
        if (hasNet) {
            
            [ctrl showIndicatorHint:@"加载中..."];
            
            
            
            [BaseRequestManager POST:URLString parameters:parameters success:^(id responseObject) {
                [ctrl hideHud:YES];
                if (success) {
                    ////cookie丢失，重新登录
                    if ([[NSString stringWithFormat:@"%@",responseObject[@"code"]] isEqualToString:@"11"]) {
                        
                        
                        [WTAlert showAlertFrom:ctrl title:@"温馨提示" message:@"权限丢失，请重新登录" cancelButtonTitle:nil cancle:nil confirmButtonTitle:@"确定" confirm:^{
                            ///没有权限
                            APPWindow.rootViewController = [[NSClassFromString(@"") alloc] init];
                        }];
                        
                        
                        
                    }else if ([[NSString stringWithFormat:@"%@",responseObject[@"code"]] isEqualToString:@"0"]){
                      ///正常情况下返回数据
                        success(responseObject);
                        
                    }else{
                        
                        ////参数错误、后台出错等code的情况下报错，给出提示语
                        
                        [self showSignView:ctrl message:[NSString stringWithFormat:@"%@",responseObject[@"msg"]]];
                        
                    }
                    
                    
                }
                
            } failure:^(NSError *error) {
                
                [ctrl hideHud:YES];
                
                VTLog(@"错误信息=====%@",error);
                
            }];
            
            
        }else{
            
            [ctrl showHint:@"请检查当前网络"];
            
        }
    }];
}

///tableView下移问题
-(void) setScrollViewQuestion:(UIScrollView *)scrollView
{
    
    if (@available(iOS 11.0, *)) {
        scrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }else{
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    
}

#pragma mark -- 检测网络状态2（AF自带）
-(void)checkNetworkAvailable:(void(^)(BOOL hasNet))netBlock{
    
    // 电池条显示网络活动
    [[AFNetworkActivityIndicatorManager sharedManager] setEnabled:YES];
    //开始监听网络
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        NSLog(@"Reachability: %@", AFStringFromNetworkReachabilityStatus(status));
        switch (status)
        {
            case AFNetworkReachabilityStatusReachableViaWWAN:
                NSLog(@"当前网络为WAN");
                break;
            case AFNetworkReachabilityStatusReachableViaWiFi:
                NSLog(@"当前网络为WiFi");
                break;
            case AFNetworkReachabilityStatusNotReachable:
                NSLog(@"没有网络！");
                break;
            case AFNetworkReachabilityStatusUnknown:
                NSLog(@"当前网络为未知网络！");
                break;
            default:
                break;
        }
        if(status ==AFNetworkReachabilityStatusReachableViaWiFi || status ==AFNetworkReachabilityStatusReachableViaWWAN){
            netBlock(YES);
            //            showNetworkStatus(YES);
        }else{
            netBlock(NO);
            //            showNetworkStatus(NO);
        }
    }];
}

///提示信息弹窗
-(void) showSignView:(UIViewController *)ctrl message:(NSString *)message
{
    
    [WTAlert showAlertFrom:ctrl title:@"温馨提示" message:message cancelButtonTitle:@"" cancle:nil confirmButtonTitle:@"确定" confirm:nil];
}

@end
