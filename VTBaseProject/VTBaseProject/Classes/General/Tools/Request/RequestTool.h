//
//  RequestTool.h
//  Panku
//
//  Created by wangxu on 16/6/23.
//  Copyright © 2016年 Monster. All rights reserved.
// 封装整个项目的GET／POST请求

#import <Foundation/Foundation.h>
#import "AFNetworking.h"


/** -- 枚举 请求方法类型 -- */
typedef enum {
    
    /** 手机号 验证码登录 */
    RequestLogin,
    

} RequestMethodType;

@interface RequestTool : NSObject

/**
 *  发送一个POST请求
 *
 *  @param params               请求参数
 *  @param success              请求成功后的回调
 *  @param failure              请求失败后的回调
 */
+ (void)POSTRequestMethod:(RequestMethodType)type params:(NSDictionary *)params success:(void (^)(id json))success failure:(void (^)(NSError *error))failure;

/**
 *  发送一个POST请求(上传文件数据)
 *
 *  @param params               请求参数
 *  @param success              请求成功后的回调
 *  @param failure              请求失败后的回调
 */
+ (void)POSTRequestMethod:(RequestMethodType)type params:(NSDictionary *)params formDataArray:(NSArray *)formDataArray success:(void (^)(id json))success failure:(void (^)(NSError *error))failure;



/**
 *  发送一个GET请求
 *
 *  @param params               请求参数
 *  @param success              请求成功后的回调
 *  @param failure              请求失败后的回调
 */
+ (void)GETRequestMethod:(RequestMethodType)type params:(NSDictionary *)params success:(void (^)(id json))success failure:(void (^)(NSError *error))failure;


//+ (void)asyncUploadObjectWithbucketName:(NSString *)bucketName  ObjectKey:(NSString *)objectKey data:(NSData *)data success:(void (^)(id task))success failure:(void (^)(NSError *error))failure;


@end

/**
 *  用来封装文件数据的模型
 */
@interface PKFormData : NSObject
/**
 *  文件数据
 */
@property (nonatomic, strong) NSData *data;

/**
 *  参数名
 */
@property (nonatomic, copy) NSString *name;

/**
 *  文件名
 */
@property (nonatomic, copy) NSString *filename;

/**
 *  文件类型
 */
@property (nonatomic, copy) NSString *mimeType;


@end









