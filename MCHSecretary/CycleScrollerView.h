//
//  CycleScrollerView.h
//  MCHSecretary
//
//  Created by 朱进 on 16/8/10.
//  Copyright © 2016年 朱进. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WebImage.h"

@protocol CycleScrollItemDelegate <NSObject>

-(void) clickItem:(NSInteger)selectedIndex;

@end

@interface CycleScrollerView : UIView<UIScrollViewDelegate>

-(void) setImageArray:(NSMutableArray *)array;

@property (nonatomic, weak) id<CycleScrollItemDelegate> delegate;

@end
