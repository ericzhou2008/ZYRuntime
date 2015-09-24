//
//  ZYUserInfo+Runtime.m
//  ZYRuntime
//
//  Created by mygame on 15/9/23.
//  Copyright © 2015年 mygame. All rights reserved.
//

#import "ZYUserInfo+Runtime.h"
#import <objc/runtime.h>

static char ZYRuntimeDataKey;
static char ZYRuntimeBlockKey;
static char ZYRuntimeIntKey;
static char ZYRuntimeDateKey;
@implementation ZYUserInfo (Runtime)

@dynamic runtimeDate, runtimeBlock, runtimeData, runtimeInt;
/* --- Foundation框架中的类 --- */
- (NSDate *)runtimeDate {
    return objc_getAssociatedObject(self, &ZYRuntimeDateKey);
}

- (void)setRuntimeDate:(NSDate *)runtimeDate {
    [self willChangeValueForKey:@"runtimeDate"];  // 模拟KVO
    objc_setAssociatedObject(self, &ZYRuntimeDateKey, runtimeDate, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self didChangeValueForKey:@"runtimeDate"];
}

/* --- block类型 --- */
- (void (^)(void))runtimeBlock {
    return objc_getAssociatedObject(self, &ZYRuntimeBlockKey);
}

- (void)setRuntimeBlock:(void (^)(void))runtimeBlock {
    objc_setAssociatedObject(self, &ZYRuntimeBlockKey, runtimeBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

/* --- 对象类型 --- */
- (ZYRuntimeData *)runtimeData {
    return objc_getAssociatedObject(self, &ZYRuntimeDataKey);
}

- (void)setRuntimeData:(ZYRuntimeData *)runtimeData {
    [self willChangeValueForKey:@"runtimeData"]; // 模拟KVO
    objc_setAssociatedObject(self, &ZYRuntimeDataKey, runtimeData, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self didChangeValueForKey:@"runtimeData"];
}


/* --- 基本类型 --- */
- (NSUInteger)runtimeInt {
    return [objc_getAssociatedObject(self, &ZYRuntimeIntKey) unsignedIntegerValue];
}

- (void)setRuntimeInt:(NSUInteger)runtimeInt {
    [self willChangeValueForKey:@"runtimeInt"];  // 模拟KVO
    objc_setAssociatedObject(self, &ZYRuntimeIntKey, @(runtimeInt), OBJC_ASSOCIATION_ASSIGN);
    [self didChangeValueForKey:@"runtimeInt"];
}

@end


@implementation ZYRuntimeData

- (void)dealloc
{
    NSLog(@"%s", __PRETTY_FUNCTION__);
}

@end