//
//  DetailSegmentView.h
//  MCHSecretary
//
//  Created by 朱进 on 16/8/15.
//  Copyright © 2016年 朱进. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DetailSegmentDeleget <NSObject>

-(void) changeSegmentItem:(NSInteger)index;

@end

@interface DetailSegmentView : UIView

@property (nonatomic, assign) id<DetailSegmentDeleget> delegate;


-(void) setSelectSegement:(NSInteger)index;

@end
