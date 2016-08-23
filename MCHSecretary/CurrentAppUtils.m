//
//  CurrentAppUtils.m
//  MCHSecretary
//
//  Created by zhujin zhujin on 16/8/23.
//  Copyright © 2016年 朱进. All rights reserved.
//

#import "CurrentAppUtils.h"

@implementation CurrentAppUtils

+(NSString *) appVersion{
//    NSString *executableFile = [[[NSBundle mainBundle] infoDictionary] objectForKey:(NSString *)kCFBundleExecutableKey];    //获取项目名称
    
    NSString *version = [[[NSBundle mainBundle] infoDictionary] objectForKey:(NSString *)kCFBundleVersionKey];      //获取项目版本号
    
    return version;
    
//    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
////    CFShow((__bridge CFTypeRef)(infoDictionary));
//    // app名称
//    NSString *app_Name = [infoDictionary objectForKey:@"CFBundleDisplayName"];
//    // app版本
//    NSString *app_Version = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
//    // app build版本
//    NSString *app_build = [infoDictionary objectForKey:@"CFBundleVersion"];
}
@end
