//
//  ZYUserInfo.h
//  ZYRuntime
//
//  Created by mygame on 15/9/23.
//  Copyright © 2015年 mygame. All rights reserved.
//

#import <Foundation/Foundation.h>

/// 用户信息
@interface ZYUserInfo : NSObject
@property (nonatomic) NSUInteger uid; /// < 用户ID

/// 现金
@property (nonatomic) NSUInteger cash;

/**
 *  地址
 */
@property (copy, nonatomic) NSString *address;

@property (copy, nonatomic) NSString *city; /***< 城市 */
@end
