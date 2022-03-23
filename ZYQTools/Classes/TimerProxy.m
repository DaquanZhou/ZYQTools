//
//  TimerProxy.m
//
//  Created by Albert on 2022/3/23.
//  Copyright © 2022 Coder_zzz. All rights reserved.
//

#import "TimerProxy.h"

@implementation TimerProxy

+ (instancetype)proxyWithTarget:(id)target{
    TimerProxy *proxy = [self alloc];
    proxy.target = target;
    return  proxy;
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)sel{
    return [self.target methodSignatureForSelector:sel];
}

- (void)forwardInvocation:(NSInvocation *)invocation{
    [invocation invokeWithTarget:self.target];
}

@end
