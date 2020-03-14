//
//  KLConsole.h
//  KLConsole
//
//  Created by Logic on 2020/1/6.
//

#import <Foundation/Foundation.h>
#import "KLConsoleConfig.h"

NS_ASSUME_NONNULL_BEGIN

@interface KLConsole : NSObject

/// 通用配置
/// @param setup 通用配置回调
+ (void)consoleSetup:(void (^)(NSMutableArray<KLConsoleConfig *> *configs))setup;

/// 获取通用配置集合
/// @return 通用配置集合
+ (NSArray<KLConsoleConfig *> *)configs;

/// 环境配置
/// @param setup 环境配置回调
+ (void)consoleAddressSetup:(void (^)(NSMutableArray<KLConsoleSecondConfig *> *configs))setup;

/// 获取环境配置集合
/// @return 环境配置集合
+ (NSArray<KLConsoleSecondConfig *> *)addressConfigs;

/// 调起控制台，并处理扩展配置回调
+ (void)consoleSetupAndSelectedCallBack:(void (^)(NSIndexPath *indexPath, BOOL switchOn))callBack;

@end

NS_ASSUME_NONNULL_END
