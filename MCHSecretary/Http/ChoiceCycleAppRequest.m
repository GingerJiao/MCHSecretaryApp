//
//  ChoiceCycleAppRequest.m
//  MCHSecretary
//
//  Created by 朱进 on 16/8/11.
//  Copyright © 2016年 朱进. All rights reserved.
//

#import "ChoiceCycleAppRequest.h"
#import "BaseNetManager.h"
#import "StringUtils.h"

#import "ChoiceListItem.h"
#import "NomalFrame.h"
#import "AppPacketInfo.h"

#define TopViewHeight 70
#define checkNull(__X__) (__X__) == [NSNull null] || (__X__) == nil ? @"" : [NSString stringWithFormat:@"%@", (__X__)]

#define cycleappinfourl @"/appinfo.html"

@implementation ChoiceCycleAppRequest

-(void) getCycleAppInfo:(void(^)(NSMutableArray * array))resultBlock failure:(void(^)(NSURLResponse * response, NSError * error, NSDictionary * dic))failureBlock{
    
    [[BaseNetManager sharedInstance] get:cycleappinfourl success:^(NSDictionary *dic) {
//        NSLog(@"[ChoiceCycleAppRequest] resultStr : %@", dic);
        NSString *status = [NSString stringWithFormat:@"%@", [dic objectForKey:@"status"]];
        if([@"1" isEqualToString:status]){
            NSMutableArray *result = [self dicToArray:dic];
            resultBlock(result);
        }else{
            NSString *errorMsg = [NSString stringWithFormat:@"%@", [dic objectForKey:@"return_msg"]];
            if([StringUtils isBlankString:errorMsg]){
                errorMsg = NSLocalizedString(@"HTTPDataException", @"");
            }
            
            failureBlock(nil, nil, @{@"status":@"-1001", @"return_msg":errorMsg});
        }
        
    } failure:^(NSURLResponse *response, NSError *error, NSDictionary *dic) {
//        NSLog(@"[ChoiceCycleAppRequest] error message : %@", dic);
        failureBlock(response, error, dic);
    }];
    
}

-(NSMutableArray *) dicToArray:(NSDictionary *)dic{
    NSString *dataListStr = checkNull([dic objectForKey:@"data"]);
    
//    NSLog(@"ChoiceCycleAppRequest# packsListStr: %@", dataListStr);
    if(![StringUtils isBlankString:dataListStr]){
        NSMutableArray *dataArray = [self getData:[dic objectForKey:@"data"]];
        return dataArray;
    }
    return nil;
}

-(NSMutableArray *) getData:(NSArray *)datas{
    if(datas && [datas count] > 0){
        NSMutableArray *choiceitemArray = [NSMutableArray arrayWithCapacity:datas.count];
        for (int i = 0; i < [datas count]; i++) {
            ChoiceListItem *choiceitem = [[ChoiceListItem alloc] init];
            NSDictionary *dataDic = [datas objectAtIndex:i];
            NSString *choiceType = [NSString stringWithFormat:@"%@", [dataDic objectForKey:@"type"]];
            if([@"0" isEqualToString:choiceType]){
                [choiceitem setCellType:CellStyle_Cycle];
            }else if([@"1" isEqualToString:choiceType]){
                [choiceitem setCellType:CellStyle_Nomal];
            }else if([@"2" isEqualToString:choiceType]){
                [choiceitem setCellType:CellStyle_Other];
            }
            [choiceitem setTitle:[NSString stringWithFormat:@"%@", [dataDic objectForKey:@"title"]]];
            
            NSMutableArray *itemArray = [self getItems:[dataDic objectForKey:@"list"]];
            [choiceitem setAppInfoArray:itemArray];
            
            [choiceitemArray addObject:choiceitem];
        }
        return choiceitemArray;
    }else{
        return nil;
    }
    
}

-(NSMutableArray *) getItems:(NSArray *)lists{
    if(lists && [lists count] > 0){
        NSMutableArray *frameArray = [NSMutableArray arrayWithCapacity:lists.count];
        for (int i = 0; i < [lists count]; i++){
            NSDictionary *listDic = [lists objectAtIndex:i];
            NomalFrame *frame = [[NomalFrame alloc] init];
//            AppPacketInfo *packInfo = [[AppPacketInfo alloc] init];
//            [packInfo setLargeImageUrl:[NSString stringWithFormat:@"%@", [listDic objectForKey:@"largriconurl"]]];
//            [packInfo setSmallImageUrl:[NSString stringWithFormat:@"%@", [listDic objectForKey:@"smalliconurl"]]];
//            [packInfo setPacketName:[NSString stringWithFormat:@"%@", [listDic objectForKey:@"name"]]];
//            [packInfo setAppDownloadNum:[NSString stringWithFormat:@"%@", [listDic objectForKey:@"downloadnum"]]];
//            [packInfo setPacketSize:[NSString stringWithFormat:@"%@", [listDic objectForKey:@"packetsize"]]];
//            [packInfo setAppDescribe:[NSString stringWithFormat:@"%@", [listDic objectForKey:@"describe"]]];
//            [packInfo setDownloadUrl:[NSString stringWithFormat:@"%@", [listDic objectForKey:@"downloadurl"]]];
//            [packInfo setDescribeimageUrl:[NSString stringWithFormat:@"%@", [listDic objectForKey:@"describeurl"]]];
            
            AppPacketInfo *packInfo = [AppPacketInfo packWithDict:listDic];
            [frame setPacketInfo:packInfo];
            
            [frameArray addObject:frame];
        }
        return frameArray;
    }else{
        return nil;
    }
    
    
    
}

@end
