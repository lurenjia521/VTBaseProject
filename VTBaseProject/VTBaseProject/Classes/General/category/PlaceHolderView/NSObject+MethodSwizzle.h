//
//  NSObject+MethodSwizzle.h
//  PlaceHolderView
//
//  Created by yh on 17/5/16.
//  Copyright © 2017年 yh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

@interface NSObject (MethodSwizzle)

///方法变换（A->B）(即：A收到消息之后执行B)
+ (void)swizzleMethod:(SEL)origSelector withMethod:(SEL)newSelector;

@end
