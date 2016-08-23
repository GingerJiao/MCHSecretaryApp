//
//  StringUtils.h
//  Payment
//
//  Created by 朱进 on 16/5/30.
//  Copyright © 2016年 朱进. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface StringUtils : NSObject

+ (Boolean) isBlankString:(NSString *)string;

/**
 *  计算文本的宽高
 *
 *  @param str     需要计算的文本
 *  @param font    文本显示的字体
 *  @param maxSize 文本显示的范围
 *
 *  @return 文本占用的真实宽高
 */
+ (CGSize)sizeWithString:(NSString *)str font:(UIFont *)font maxSize:(CGSize)maxSize;

+ (NSString *)TimeLongToString:(NSString *)str;

@end
