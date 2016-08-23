//
//  AppPacketInfo.h
//  MCHSecretary
//
//  Created by 朱进 on 16/8/9.
//  Copyright © 2016年 朱进. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppPacketInfo : NSObject


//图片地址
@property (nonatomic, copy) NSString *smallImageUrl;
//应用名称
@property (nonatomic, copy) NSString *packetName;
//应用包大小
@property (nonatomic, copy) NSString *packetSize;
//应用下载量
@property (nonatomic, copy) NSString *appDownloadNum;
//应用描述
@property (nonatomic, copy) NSString *appDescribe;
//下载地址
@property (nonatomic, copy) NSString *downloadUrl;


//图片地址
@property (nonatomic, copy) NSString *largeImageUrl;
//应用介绍地址
@property (nonatomic, copy) NSString *describeimageUrl;
//评论数
@property (nonatomic, copy) NSString *commentNumber;
//平均星级
@property (nonatomic, assign) float starAverage;
//图片介绍
@property (nonatomic, copy) NSString *describeImages;


//内容简介
@property (nonatomic, copy) NSString *contentDescribe;
//更新日志
@property (nonatomic, copy) NSString *updateLogs;
//版本信息
@property (nonatomic, copy) NSString *versionInfo;
//更新时间
@property (nonatomic, copy) NSString *updateData;
//应用类型
@property (nonatomic, copy) NSString *appType;
//语言
@property (nonatomic, copy) NSString *language;
//开发商
@property (nonatomic, copy) NSString *developCompany;
//兼容性
@property (nonatomic, copy) NSString *compatible;



- (id)initWithDict:(NSDictionary *)dict;

+ (id)packWithDict:(NSDictionary *)dict;

@end
