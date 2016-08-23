//
//  ChoiceCycleAppRequest.h
//  MCHSecretary
//
//  Created by 朱进 on 16/8/11.
//  Copyright © 2016年 朱进. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ChoiceCycleAppRequest : NSObject

-(void) getCycleAppInfo:(void(^)(NSMutableArray * array))resultBlock failure:(void(^)(NSURLResponse * response, NSError * error, NSDictionary * dic))failureBlock;

@end
