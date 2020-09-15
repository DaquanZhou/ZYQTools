//
//  UIColor+Convenience.h
//  DMHome
//
//  Created by Albert on 2020/3/16.
//  Copyright © 2020 Coder_zzz. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN


#ifndef RGB
#define RGB(r, g, b) RGBA((r),(g),(b),1)
#define RGBA(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:a]
#endif
#define HEXA(hex, a) [UIColor colorWithHex:(hex) alpha:(a)]
#define HEX(hex) [UIColor colorWithHex:(hex) alpha:(1)]

@interface UIColor (Convenience)

+ (UIColor *)colorWithHex:(NSInteger)hex alpha:(float)alpha;


/**
 *  NSString -> UIColor
 *
 *  @param aColorString normal:@“#AB12FF” or @“AB12FF” or gray: @"C7"
 *
 *  @return UIColor
 */
+ (UIColor *)colorFromString:(NSString *)aColorString;

/**
 *  NSString -> UIColor with alpha
 *
 *  @param aColorString normal:@“#AB12FF” or @“AB12FF” or gray: @"C7"
 *  @param aAlpha       alpha 0-1.0
 *
 *  @return UIColor
 */
+ (UIColor *)colorFromString:(NSString *)aColorString alpha:(CGFloat)aAlpha;


@end

NS_ASSUME_NONNULL_END
