//
//  Settings.m
//  DMHome
//
//  Created by Albert on 2020/3/17.
//  Copyright © 2020 Coder_zzz. All rights reserved.
//

#import "Settings.h"

@implementation Settings
+ (NSString *)stringOfKey:(NSString *)aKey
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *stringValue = [defaults stringForKey:aKey];
    return stringValue;
}

+ (void)setString:(NSString *)aString forKey:(NSString *)aKey
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:aString forKey:aKey];
    [defaults synchronize];
}

+ (BOOL)boolOfKey:(NSString *)aKey
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    BOOL boolValue = [defaults boolForKey:aKey];
    return boolValue;
}

+ (void)setBool:(BOOL)aBool forKey:(NSString *)aKey
{
    if (aKey.length <= 0) {
        return;
    }
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setBool:aBool forKey:aKey];
    [defaults synchronize];
}

+ (NSInteger)integerOfKey:(NSString *)aKey
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSInteger integerValue = [defaults integerForKey:aKey];
    return integerValue;
}

+ (void)setInteger:(NSInteger)aInteger forKey:(NSString *)aKey
{
    if (aKey.length <= 0) {
        return;
    }
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:aInteger forKey:aKey];
    [defaults synchronize];
}

+ (NSNumber *)numberOfKey:(NSString *)aKey
{
    if (aKey.length <= 0) {
        return [NSNumber new];
    }
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSNumber *numberValue = [defaults objectForKey:aKey];
    return numberValue;
}

+ (void)setNumber:(NSNumber *)aNumber forKey:(NSString *)aKey
{
    if (aKey.length <= 0) {
        return;
    }
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:aNumber forKey:aKey];
    [defaults synchronize];
}

+ (NSDictionary *)dictionaryOfKey:(NSString *)aKey
{
    if (aKey.length <= 0) {
        return [NSDictionary dictionary];
    }
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSDictionary *dictionary = [defaults objectForKey:aKey];
    return dictionary;
}

+ (void)setDictionary:(NSDictionary *)aDictionary forKey:(NSString *)aKey
{
    if (aKey.length <= 0) {
        return;
    }
    
    NSDictionary *newDic = [self objectFromObject:aDictionary];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:newDic forKey:aKey];
    [defaults synchronize];
}

+ (NSMutableArray *)arrayOfKey:(NSString *)aKey
{
    if(aKey.length <= 0){
        return [NSMutableArray array];
    }
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSMutableArray *array = [NSMutableArray arrayWithArray:(NSMutableArray *)[defaults objectForKey:aKey]];
    //NSMutableArray *array = [defaults objectForKey:aKey];
    return array;
}

+ (void)setArray:(NSMutableArray *)aArray forKey:(NSString *)aKey
{
    if(aKey.length <= 0){
        return;
    }
    //NSMutableArray *newArr = [self objectFromObject:aArray];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:aArray forKey:aKey];
    [defaults synchronize];
}

+ (id)objectFromObject:(id)aObject
{
    if ([aObject isKindOfClass:[NSString class]] || [aObject isKindOfClass:[NSNumber class]])
    {
        return aObject;
    }
    else if ([aObject isKindOfClass:[NSArray class]])
    {
        NSMutableArray *newArray = [NSMutableArray array];
        for (id arrayObj in aObject)
        {
            id object = [self objectFromObject:arrayObj];
            if (object != nil)
            {
                [newArray addObject:object];
            }
        }
        return newArray;
    }
    else if ([aObject isKindOfClass:[NSDictionary class]])
    {
        NSMutableDictionary *newDic = [NSMutableDictionary dictionary];
        for (NSString *key in [aObject allKeys])
        {
            id object = [self objectFromObject:[aObject objectForKey:key]];
            if (object != nil)
            {
                [newDic setObject:object forKey:key];
            }
        }
        return newDic;
    }
    
    return nil;
}

+ (NSData *)dataOfKey:(NSString *)aKey
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSData *data = [defaults objectForKey:aKey];
    return data;
}

+ (void)setData:(NSData *)aData forKey:(NSString *)aKey
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:aData forKey:aKey];
    [defaults synchronize];
}

+ (NSDictionary *)dictionaryFromPListFile:(NSString *)aPListFile
{
    NSString *path = [[NSBundle mainBundle] pathForResource:aPListFile ofType:@"plist"];
    NSDictionary *dictionary = [[NSDictionary alloc] initWithContentsOfFile:path];
    return dictionary;
}

+ (void)synchronize
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults synchronize];
}

+ (void)removeObjectForKey:(NSString *)aKey;
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults removeObjectForKey:aKey];
}
/**
 保存数据 通用方法

 @param value <#value description#>
 @param strKey <#strKey description#>
 @param arrCompareKey 对比参数
 */
+ (void)saveCache:(id)value
           forKey:(NSString *)strKey
    andCompareKey:(NSArray *)arrCompareKey
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSMutableArray *marrCache = [[defaults objectForKey:strKey]mutableCopy];
    if (!marrCache)
    {
        marrCache = [NSMutableArray array];
        [marrCache addObject:value];
        [defaults setObject:marrCache.copy
                     forKey:strKey];
    }
    else
    {
        [marrCache addObject:value];
        //暂时直接保存
        return;
        
        __block BOOL isExist = NO;
        if ([value isKindOfClass:[NSString class]])
        {
            [marrCache enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                if ([value isEqualToString:obj])
                {
                    isExist = YES;
                    *stop = YES;
                }
            }];
        }
        else if ([value isKindOfClass:[NSObject class]])
        {
            [arrCompareKey enumerateObjectsUsingBlock:^(NSString *obj, NSUInteger idx, BOOL * _Nonnull stop)
            {
                //需要比较的内容
                id valueEnum = value[obj];
                if (valueEnum)
                {
                    
                }
            }];
        }
        else
        {
            
        }
    }
}

+ (NSArray *)getCacheForKey:(NSString *)strKey
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSArray *arrData = [defaults objectForKey:strKey];
    return arrData;
}

//获取一个不为空的可变字典
+ (NSMutableDictionary *)mdicForKey:(NSString *)strKey
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSMutableDictionary *mdic = [defaults objectForKey:strKey];
    if (!mdic || ![mdic isKindOfClass:[NSDictionary class]])
    {
        mdic = [NSMutableDictionary dictionary];
    }
    else
    {
        mdic = [mdic mutableCopy];
    }
    return mdic;
}

+ (NSArray *)arrHomeListDataCache
{
    return [NSArray array];
}
@end
