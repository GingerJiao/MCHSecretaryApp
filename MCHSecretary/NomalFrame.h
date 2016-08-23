//
//  NomalFrame.h
//  MCHSecretary
//
//  Created by 朱进 on 16/8/9.
//  Copyright © 2016年 朱进. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class AppPacketInfo;

@interface NomalFrame : NSObject

@property (nonatomic, strong) AppPacketInfo *packetInfo;

@property (nonatomic, assign) CGRect imageFrame;

@property (nonatomic, assign) CGRect nameFrame;

@property (nonatomic, assign) CGRect middleFrame;

@property (nonatomic, assign) CGRect describeFrame;

@property (nonatomic, assign) CGRect downloadFrame;

@property (nonatomic, assign) CGRect downloadTextFrame;

@property (nonatomic, assign) CGRect lineFrame;

@property (nonatomic, assign) CGFloat cellHeight;

@end
