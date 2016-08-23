//
//  CycleScrollCell.m
//  MCHSecretary
//
//  Created by 朱进 on 16/8/10.
//  Copyright © 2016年 朱进. All rights reserved.
//

#import "CycleScrollCell.h"
#import "NomalFrame.h"
#import "AppPacketInfo.h"


@interface CycleScrollCell(){
    
}

@property (nonatomic, weak) CycleScrollerView *cycleScrollView;

@end

@implementation CycleScrollCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+(instancetype) cellWithTableView:(UITableView *)tableView{
    static NSString *identifer = @"cyclescroll";
    
    CycleScrollCell *cell = [tableView dequeueReusableCellWithIdentifier:identifer];
    if(cell == nil){
        cell = [[CycleScrollCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifer];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}

-(id) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        
        CycleScrollerView *cycleView = [[CycleScrollerView alloc] initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width + 5, 100)];
        [self.contentView addSubview:cycleView];
        self.cycleScrollView = cycleView;
        
        
    }
    return self;
}

-(void) setScrollViewDelegate:(id<CycleScrollItemDelegate>)delegate{
    if(self.cycleScrollView && delegate){
        self.cycleScrollView.delegate = delegate;
    }
}

-(void) setScrollFrame:(NSMutableArray *)urlArray{
//    self.cycleScrollView.frame = CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, 70);
    NSMutableArray *urlArrays =  [NSMutableArray arrayWithCapacity:urlArray.count];
    for (NSInteger i = 0; i < urlArray.count; i++) {
        NomalFrame *frame = urlArray[i];
        
        [urlArrays addObject:frame.packetInfo.describeimageUrl];
    }
    
    [self.cycleScrollView setImageArray:urlArrays];
}

@end
