//
//  NSDictionary+Log.m
//  MCHSecretary
//
//  Created by 朱进 on 16/8/12.
//  Copyright © 2016年 朱进. All rights reserved.
//

#import "NSDictionary+Log.h"

@implementation NSDictionary (Log)

-(NSString *)descriptionWithLocale:(id)locale indent:(NSUInteger)level {
    //初始化可变字符串
    NSMutableString *string = [NSMutableString string];
    //拼接开头[
    [string appendString:@"{"];
    
    //拼接字典中所有的键值对
    [self enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        [string appendFormat:@"%@:",key];
        [string appendFormat:@"\"%@\"",obj];
        [string appendFormat:@","];
    }];
    
    //拼接结尾]
    [string appendString:@"}"];
    
    return string;
}

@end
