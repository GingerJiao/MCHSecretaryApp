//
//  BaseNetManager.h
//  Payment
//
//  Created by 朱进 on 16/6/3.
//  Copyright © 2016年 朱进. All rights reserved.
//

#import <Foundation/Foundation.h>

//#define urlpre @"http://a2.vlcms.com/sdk.php"
//#define urlpre @"http://sdk.mlwed.com/sdk.php?s="
#define urlpre @"https://iosdemo.vlcms.com"

@interface BaseNetManager : NSObject{
}

/**
 *  创建支付单例服务
 *
 *  @return 返回单例对象
 */
+ (BaseNetManager *) sharedInstance;

- (void)get:(NSString *)urlstr success:(void(^)(NSDictionary * dic))successblock failure:(void(^)(NSURLResponse * response, NSError * error, NSDictionary * dic))failureBlock;

//-(NSString * _Nonnull) sortDicToString:(NSMutableDictionary * _Nonnull)dic;

-(void) httpPost:(NSString *)urlstr param:(NSString *)param success:(void(^)(NSDictionary * dic))successblock failure:(void(^)(NSURLResponse * response, NSError * error, NSDictionary * dic))failureBlock;

@end
