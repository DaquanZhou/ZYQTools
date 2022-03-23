//
//  TimerProxy.h
//
//  Created by Albert on 2022/3/23.
//  Copyright © 2022 Coder_zzz. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TimerProxy : NSProxy

@property(nonatomic, weak) id target;

+ (instancetype)proxyWithTarget:(id)target;

@end

NS_ASSUME_NONNULL_END
