//
//  ChoiceListItem.m
//  MCHSecretary
//
//  Created by 朱进 on 16/8/10.
//  Copyright © 2016年 朱进. All rights reserved.
//

#import "ChoiceListItem.h"

@implementation ChoiceListItem

-(id) init{
    if(self = [super init]){
        _cellType = -1;
        _title = @"";
//        _itemNumber = 0;
        _appInfoArray = [[NSMutableArray alloc] init];
        _imageURLArray = [[NSMutableArray alloc] init];
//        _cellHeight = 50;
    }
    return self;
}

//-(void) setAppInfoArray:(NSMutableArray *)appInfoArray{
//    _appInfoArray = appInfoArray;
//}

//-(NSInteger) itemNumber{
//    if(!_appInfoArray){
//        return 0;
//    }
//    return _appInfoArray.count;
//}
@end
