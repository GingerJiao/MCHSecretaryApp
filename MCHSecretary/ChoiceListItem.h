//
//  ChoiceListItem.h
//  MCHSecretary
//
//  Created by 朱进 on 16/8/10.
//  Copyright © 2016年 朱进. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, CellStyle)
{
    CellStyle_Nomal,
    CellStyle_Cycle,
    CellStyle_Other
};

@interface ChoiceListItem : NSObject

@property (nonatomic, assign) int cellType;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, strong) NSMutableArray *appInfoArray;

//@property (nonatomic, assign) NSInteger itemNumber;

@property (nonatomic, strong) NSMutableArray *imageURLArray;

//@property (nonatomic, assign) int cellHeight;

@end
