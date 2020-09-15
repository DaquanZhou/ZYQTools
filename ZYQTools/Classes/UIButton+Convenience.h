//
//  UIButton+Convenience.h
//  DMHome
//
//  Created by Albert on 2020/3/19.
//  Copyright © 2020 Coder_zzz. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

// 定义一个枚举（包含了四种类型的button）
typedef NS_ENUM(NSUInteger, WMButtonAlignmentStyle) {
    WMButtonAlignmentStyleTop, // 图片在上，文字在下
    WMButtonAlignmentStyleLeft, // 图片在左，文字在右
    WMButtonAlignmentStyleBottom, // 图片在下，文字在上
    WMButtonAlignmentStyleRight // 图片在右，文字在左
};

@interface UIButton (Convenience)
/*  设置按钮的文字和图片的布局样式和间距
*
*  @param style 布局样式
*  @param space 文字与图片的间距
*/
- (void)setButtonImageAlignmentStyle:(WMButtonAlignmentStyle)style
                imageAndLabelSpace:(CGFloat)space;
@end

NS_ASSUME_NONNULL_END
