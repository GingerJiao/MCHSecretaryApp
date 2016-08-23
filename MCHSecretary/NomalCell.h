//
//  NomalCell.h
//  MCHSecretary
//
//  Created by 朱进 on 16/8/9.
//  Copyright © 2016年 朱进. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DownloadAppDelegate <NSObject>

-(void) startDownloadApp:(NSInteger)section index:(NSInteger)index;

@end

@class NomalFrame;

@interface NomalCell : UITableViewCell

@property (nonatomic, strong) NomalFrame *nomalFrame;

+(instancetype) cellWithTableView:(UITableView *)tableView;

@property (nonatomic, weak) id<DownloadAppDelegate> delegate;

-(void) setNomalFrame:(NomalFrame *)nomalFrame section:(NSInteger)section pos:(NSInteger)index;

@end
