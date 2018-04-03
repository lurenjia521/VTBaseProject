//
//  RequestTool.m
//  Panku
//
//  Created by wangxu on 16/6/23.
//  Copyright © 2016年 Monster. All rights reserved.
// 封装整个项目的GET／POST请求

#import "RequestTool.h"
#import "PKGlobeConst.h"
#import <objc/runtime.h>
const char *hudKeys;

@implementation RequestTool


#pragma mark - get url

- (NSString *)getUrl:(RequestMethodType)type {
    NSString *url = @"";
    switch (type) {
            
        case RequestLogin:
            url = MYLogin;
            break;
            
        default:
            url = nil;
            break;
    }
    
    return url;
    
}
#pragma mark - AFN网络请求
/** -- post请求 -- */

+ (void)POSTRequestMethod:(RequestMethodType)type params:(NSDictionary *)params success:(void (^)(id))success failure:(void (^)(NSError *))failure
{
    NSString *port = [[[self alloc] init] getUrl:type];
    NSString *url = [NSString stringWithFormat:@"%@%@",PKDomainName,port];

    // 1.创建请求管理对象
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.requestSerializer.timeoutInterval = 20.0f;

//    MYLog(@"--url: %@--",url);
//    MYLog(@"--params: %@--",params);

    // 2.发送请求
    //AFN 3.0
    [manager POST:url parameters:params progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            NSString * str = [[NSString alloc]initWithData:responseObject encoding:NSUTF8StringEncoding];
            NSString * str2 = [str stringByReplacingOccurrencesOfString:@"\t" withString:@""];
            str2 = [str2 stringByReplacingOccurrencesOfString:@"\n" withString:@""];
            str2 = [str2 stringByReplacingOccurrencesOfString:@"\r" withString:@""];
            NSData *jsonData =[str2 dataUsingEncoding:NSUTF8StringEncoding];
            NSError *err;
            NSDictionary *diction = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&err];
            success(diction);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
    }];
    
}

/**
 * 上传图片
 */
+ (void)POSTRequestMethod:(RequestMethodType)type params:(NSDictionary *)params formDataArray:(NSArray *)formDataArray success:(void (^)(id json))success failure:(void (^)(NSError *error))failure;
{
    
    NSString *port = [[[self alloc] init] getUrl:type];
    NSString *url = [NSString stringWithFormat:@"%@%@",PKDomainName,port];
//    MYLog(@"--url: %@--",url);
//    MYLog(@"--params: %@--",params);
    // 1.创建请求管理对象
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer.timeoutInterval = 30.0f;
    //2.发送请求
    [manager POST:url parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull totalFormData) {
        for (PKFormData *formData in formDataArray) {
            
            [totalFormData appendPartWithFileData:formData.data name:formData.name fileName:formData.filename mimeType:formData.mimeType];
        }
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
    }];
}

/**
 * GET 请求
 */
+ (void)GETRequestMethod:(RequestMethodType)type params:(NSDictionary *)params success:(void (^)(id))success failure:(void (^)(NSError *))failure
{
    NSString *port = [[[self alloc] init] getUrl:type];
    NSString *url = [NSString stringWithFormat:@"%@%@",PKDomainName,port];
    
//    MYLog(@"--url: %@--",url);
//    MYLog(@"--params: %@--",params);
    
    // 1.创建请求管理对象
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer.timeoutInterval = 30.0f;
    // 2.发送请求
    [manager GET:url parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
    }];
}

@end

/**
 *  用来封装文件数据的模型
 */
@implementation PKFormData


@end
