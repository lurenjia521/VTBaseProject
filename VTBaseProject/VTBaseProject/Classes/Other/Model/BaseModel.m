//
//  BaseModel.m
//  DengGaoYunShan
//
//  Created by lianjie on 2017/11/6.
//  Copyright © 2017年 lianjie. All rights reserved.
//

#import "BaseModel.h"
#import "MJExtension.h"
#import "BaseFileCacheManager.h"
@implementation BaseModel


MJCodingImplementation;

+ (NSDictionary *)replacedKeyFromPropertyName {
    return @{
             @"Id":@"id",
             @"desc":@"description",
             @"responseData" : @"data"
             };
}

+ (NSMutableArray *)modelArrayWithDictArray:(NSArray *)response {
    if ([response isKindOfClass:[NSArray class]]) {
        NSMutableArray *array = [self mj_objectArrayWithKeyValuesArray:response];
        return array;
    }
    return [NSMutableArray new];
}

+ (id)modelWithDictionary:(NSDictionary *)dictionary {
    if ([dictionary isKindOfClass:[NSDictionary class]]) {
        return [self mj_objectWithKeyValues:dictionary];
    }
    
    return [[self alloc] init];
}


+ (id) modelWithParase:(id)parase
{
    if ([parase isKindOfClass:[NSDictionary class]]) {
        return [self mj_objectWithKeyValues:parase];
    }else if ([parase isKindOfClass:[NSArray class]]){
        
        return [self mj_objectArrayWithKeyValuesArray:parase];
    }
    
    return [[self alloc] init];
    
    
}

+ (void)setUpModelClassInArrayWithContainDict:(NSDictionary *)dict {
    if (dict.allKeys.count == 0) {
        return ;
    }
    [self mj_setupObjectClassInArray:^NSDictionary *{
        return dict;
    }];
}

+ (NSMutableArray *)modelArrayWithDictArray:(NSArray *)response containDict:(NSDictionary *)dict {
    if (dict == nil) {
        dict = [NSMutableDictionary new];
    }
    [self setUpModelClassInArrayWithContainDict:dict];
    return [self modelArrayWithDictArray:response];
}

+ (id)modelWithDictionary:(NSDictionary *)dictionary containDict:(NSDictionary *)dict {
    if (dict == nil) {
        dict = [NSMutableDictionary new];
    }
    [self setUpModelClassInArrayWithContainDict:dict];
    return [self modelWithDictionary:dictionary];
}

- (id)unarchiver {
    id obj = [BaseFileCacheManager getObjectByFileName:[self.class description]];
    return obj;
}
//
- (void)archive {
    [BaseFileCacheManager saveObject:self byFileName:[self.class description]];
}
//
- (void)remove {
    [BaseFileCacheManager removeObjectByFileName:[self.class description]];
}




@end
