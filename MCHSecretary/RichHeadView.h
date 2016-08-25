//
//  RichHeadView.h
//  MCHSecretary
//
//  Created by zhujin zhujin on 16/8/23.
//  Copyright © 2016年 朱进. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RichHeadView : UIView

//推荐

@property(nonatomic,assign)int num;

@property(nonatomic,retain)UIButton *textButton;

@property(nonatomic,retain)UILabel *specialLab;

@property(nonatomic,retain)UIButton *imageButton;

-(void)loadHeadViewForRecommandView;

//排行
@property(nonatomic,retain)UIButton *obveFirstBtn;

@property(nonatomic,retain)UIButton *obveSecondBtn;

@property(nonatomic,retain)UIButton *obveThirdBtn;

@property(nonatomic,retain)UIButton *obveFouthBtn;

-(void)loadHeadViewForRankingView;

//专题详情
@property(nonatomic,retain)UIImageView *imgView;

@property(nonatomic,retain)UILabel *titleLab;

@property(nonatomic,retain)UILabel *detailLab;

-(void)loadHeadViewForSpecialDetailView;

@end
