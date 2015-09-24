//
//  ZYUserInfo+Runtime.h
//  ZYRuntime
//
//  Created by mygame on 15/9/23.
//  Copyright © 2015年 mygame. All rights reserved.
//

#import "ZYUserInfo.h"

@class ZYRuntimeData;

/// rumtime
@interface ZYUserInfo (Runtime)
@property (strong, nonatomic) NSDate *runtimeDate; ///< 用runtime添加一个Foundation框架中的类

@property (copy, nonatomic) void(^runtimeBlock)(void); ///< 用runtime添加一个block

@property (nonatomic) NSUInteger runtimeInt; ///< 用runtime添加一个属性（添加基本类型）

@property (strong, nonatomic) ZYRuntimeData *runtimeData; ///< 用runtime添加一个属性（自定义类）
@end

@interface ZYRuntimeData : NSObject
@property (copy, nonatomic) NSString *nickname; ///< 昵称
@property (nonatomic) NSUInteger age; ///< 年龄
@end
