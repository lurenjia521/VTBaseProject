//
//  BaseRequestManager.m
//  BaseProject
//
//  Created by lianjie on 2017/11/2.
//  Copyright © 2017年 lianjie. All rights reserved.
//

/**********对网络请求的基本封装***********/

#import "BaseRequestManager.h"



/**********网络请求管理类分类设置初始化方法**************/
@interface AFHTTPSessionManager (Shared)
///请求管理对象单例模式
+ (instancetype) sharedManager;


@end


@implementation AFHTTPSessionManager (Shared)

+(instancetype)sharedManager
{
    static AFHTTPSessionManager *_manager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        _manager = [AFHTTPSessionManager manager];
        
        _manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/plain", @"text/json", @"text/javascript", @"text/html", nil];
        
    });
    return _manager;
}


@end


@implementation BaseRequestManager

+ (void)GET:(NSString *)URLString parameters:(id)parameters success:(void (^)(id))success failure:(void (^)(NSError *))failure
{
        AFHTTPSessionManager *manager = [AFHTTPSessionManager sharedManager];
        
        ///设置请求头
        /////////////登陆操作之后不需要设置
        //    [manager.requestSerializer setValue:@"" forHTTPHeaderField:@"Cookie"];
        ///设置请求格式
        manager.requestSerializer = [AFJSONRequestSerializer serializer];//设置上传参数格式为JSON类型
        
        [manager.requestSerializer setValue:@"application/x-www-form-urlencoded; charset=utf-8" forHTTPHeaderField:@"Content-Type"];//告诉服务端编码方式 charset=utf-8
        
        manager.requestSerializer.timeoutInterval = 10.f;
        
        ///https证书设置
        
        /*
         AFSecurityPolicy *policy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeCertificate];
         
         policy.allowInvalidCertificates = YES;
         
         manager.securityPolicy = policy;
         */
        
        ///请求数据
        [manager GET:URLString parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            if (success) {
                success(responseObject);
            }
            
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            if (failure) {
                failure(error);
            }
        }];
    
    
}


////post请求
+(void)POST:(NSString *)URLString parameters:(id)parameters success:(void (^)(id))success failure:(void (^)(NSError *))failure
{
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager sharedManager];
//    171202115306H8zM962w
    ///设置请求头
    [manager.requestSerializer setValue:@"application/x-www-form-urlencoded; charset=utf-8" forHTTPHeaderField:@"Content-Type"];///告诉后台编码方式
    
    ///设置请求类型
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];//JSON请求类型
    
    ///设置请求超时
    manager.requestSerializer.timeoutInterval = 10.f;
    
    ///设置返回类型

    
    ///设置证书
//    AFSecurityPolicy *policy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeCertificate];
//
//    policy.allowInvalidCertificates = YES;
//
//    manager.securityPolicy = policy;
    ///请求数据
    [manager POST:URLString parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
       
        if (failure) {
            failure(error);
        }
        
    }];
    
}

  

///post请求，上传数据
+(void)POST:(NSString *)URLString parameters:(id)parameters constructingBodyWithBlock:(void (^)(id<AFMultipartFormData>))block success:(void (^)(id))success failure:(void (^)(NSError *))failure
{
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager sharedManager];
    
    ///1、设置请求头
//    manager.requestSerializer =
    
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    
    ///2、设置返回类型
    
    
    ///设置证书
//    AFSecurityPolicy *policy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeCertificate];
//
//    policy.allowInvalidCertificates = YES;
//
//    manager.securityPolicy = policy;
    
    [manager POST:URLString parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        if (block) {
            block(formData);
        }
    } progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(responseObject);
        }
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        if (failure) {
            failure(error);
        }
        
    }];
}
///取消所有网络请求
+(void)cancelAllRequests
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager sharedManager];
    
    [manager.operationQueue cancelAllOperations];
    
    
}

@end
