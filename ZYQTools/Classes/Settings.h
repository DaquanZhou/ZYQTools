//
//  Settings.h
//  DMHome
//
//  Created by Albert on 2020/3/17.
//  Copyright © 2020 Coder_zzz. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Settings : NSObject
+ (NSString *)stringOfKey:(NSString *)aKey;
+ (void)setString:(NSString *)aString forKey:(NSString *)aKey;

+ (BOOL)boolOfKey:(NSString *)aKey;
+ (void)setBool:(BOOL)aBool forKey:(NSString *)aKey;

+ (NSInteger)integerOfKey:(NSString *)aKey;
+ (void)setInteger:(NSInteger)aInteger forKey:(NSString *)aKey;

+ (NSNumber *)numberOfKey:(NSString *)aKey;
+ (void)setNumber:(NSNumber *)aNumber forKey:(NSString *)aKey;

+ (NSDictionary *)dictionaryOfKey:(NSString *)aKey;
+ (void)setDictionary:(NSDictionary *)aDictionary forKey:(NSString *)aKey;

+ (NSMutableArray *)arrayOfKey:(NSString *)aKey;
+ (void)setArray:(NSMutableArray *)aArray forKey:(NSString *)aKey;

+ (NSData *)dataOfKey:(NSString *)aKey;
+ (void)setData:(NSData *)aData forKey:(NSString *)aKey;

+ (NSDictionary *)dictionaryFromPListFile:(NSString *)aPListFile;

+ (void)synchronize;
+ (void)removeObjectForKey:(NSString *)aKey;

//获取一个不为空的可变字典
+ (NSMutableDictionary *)mdicForKey:(NSString *)strKey;

+ (NSArray *)arrHomeListDataCache;

@end

NS_ASSUME_NONNULL_END
