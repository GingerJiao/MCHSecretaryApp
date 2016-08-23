//
//  AppPacketInfo.m
//  MCHSecretary
//
//  Created by 朱进 on 16/8/9.
//  Copyright © 2016年 朱进. All rights reserved.
//

#import "AppPacketInfo.h"

@implementation AppPacketInfo

@synthesize smallImageUrl, packetName, packetSize, appDescribe, appDownloadNum, downloadUrl;
@synthesize largeImageUrl, describeimageUrl, commentNumber, starAverage, describeImages;
@synthesize contentDescribe, updateLogs, versionInfo;
@synthesize updateData, appType, language, developCompany, compatible;

-(id) init{
    if (self = [super init]) {
        smallImageUrl = @"";
        packetName = @"";
        packetSize = @"";
        appDownloadNum = @"";
        appDescribe = @"";
        downloadUrl = @"";
        largeImageUrl = @"";
        describeimageUrl = @"";
        commentNumber = @"";
        starAverage = 0;
        describeImages = @"";
    }
    return self;
}
- (id)initWithDict:(NSDictionary *)dict {
    if (self = [super init]) {
        [self setValuesByDic:dict];
    }
    return self;
}

+ (id)packWithDict:(NSDictionary *)dict {
    return [[self alloc] initWithDict:dict];
}

-(void) setValuesByDic:(NSDictionary *)dict{
    
    //图片地址
    smallImageUrl = [NSString stringWithFormat:@"%@", [dict objectForKey:@"smalliconurl"]];
    //应用名称
    packetName = [NSString stringWithFormat:@"%@", [dict objectForKey:@"name"]];
    //应用包大小
    packetSize = [NSString stringWithFormat:@"%@", [dict objectForKey:@"packetsize"]];
    //应用下载量
    appDownloadNum = [NSString stringWithFormat:@"%@", [dict objectForKey:@"downloadnum"]];
    //应用描述
    appDescribe = [NSString stringWithFormat:@"%@", [dict objectForKey:@"describe"]];
    //下载地址
    downloadUrl = [NSString stringWithFormat:@"%@", [dict objectForKey:@"downloadurl"]];
    //图片地址
    largeImageUrl = [NSString stringWithFormat:@"%@", [dict objectForKey:@"largeiconurl"]];
    //应用介绍图片地址
    describeimageUrl = [NSString stringWithFormat:@"%@", [dict objectForKey:@"describeurl"]];
    //评论数
    commentNumber = [NSString stringWithFormat:@"%@", [dict objectForKey:@"commentnmber"]];
    //平均星级
    NSString *starStr = [NSString stringWithFormat:@"%@", [dict objectForKey:@"staraverage"]];
    starAverage = [starStr floatValue];
    
    describeImages = [NSString stringWithFormat:@"%@", [dict objectForKey:@"describeimages"]];
    
    contentDescribe = [NSString stringWithFormat:@"%@", [dict objectForKey:@"describecontent"]];
    updateLogs = [NSString stringWithFormat:@"%@", [dict objectForKey:@"updatelogs"]];
    versionInfo = [NSString stringWithFormat:@"%@", [dict objectForKey:@"versioninfo"]];
    
    updateData = [NSString stringWithFormat:@"%@", [dict objectForKey:@"updatedata"]];
    appType = [NSString stringWithFormat:@"%@", [dict objectForKey:@"apptype"]];
    language = [NSString stringWithFormat:@"%@", [dict objectForKey:@"language"]];
    developCompany = [NSString stringWithFormat:@"%@", [dict objectForKey:@"developcompany"]];
    compatible = [NSString stringWithFormat:@"%@", [dict objectForKey:@"compatible"]];
}

-(NSString *)appDownloadNum{
    float downNum = [appDownloadNum floatValue];
    if(downNum >= 10000){
        float w = downNum / 10000;
        return [NSString stringWithFormat:@"%.1f%@", w, NSLocalizedString(@"DownLoadUnit", @"")];
    }
    return appDownloadNum;
}

@end
