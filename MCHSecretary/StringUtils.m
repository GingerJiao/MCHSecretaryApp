//
//  StringUtils.m
//  Payment
//
//  Created by 朱进 on 16/5/30.
//  Copyright © 2016年 朱进. All rights reserved.
//

#import "StringUtils.h"

@implementation StringUtils


+ (Boolean) isBlankString:(NSString *)string {
    if (string == nil || string == NULL) {
        return YES;
    }
//    if([[NSNull null] isEqual:(NSNull *)string])
//    {
//        return YES;
//    }
    if ([string isKindOfClass:[NSNull class]]) {
        return YES;
    }
    if ([[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length]==0) {
        return YES;
    }
    return NO;
}

/**
 *  计算文本的宽高
 *
 *  @param str     需要计算的文本
 *  @param font    文本显示的字体
 *  @param maxSize 文本显示的范围
 *
 *  @return 文本占用的真实宽高
 */
+ (CGSize)sizeWithString:(NSString *)str font:(UIFont *)font maxSize:(CGSize)maxSize {
    NSDictionary *dict = @{NSFontAttributeName : font};
    // 如果将来计算的文字的范围超出了指定的范围,返回的就是指定的范围
    // 如果将来计算的文字的范围小于指定的范围, 返回的就是真实的范围
    CGSize size =  [str boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil].size;
    return size;
}

+ (NSString *)TimeLongToString:(NSString *)str{
    NSTimeInterval time = [str doubleValue]+28800;//因为时差问题要加8小时 == 28800 sec
    
    NSDate *detaildate = [NSDate dateWithTimeIntervalSince1970:time];
//    NSLog(@"date:%@",[detaildate description]);
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yy-MM-dd HH:mm"];
    
    NSString *currentDateStr = [dateFormatter stringFromDate:detaildate];
    return currentDateStr;
}



@end
