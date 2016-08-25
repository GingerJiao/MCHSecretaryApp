//
//  APPViewController.m
//  MCHSecretary
//
//  Created by zhujin zhujin on 16/8/23.
//  Copyright © 2016年 朱进. All rights reserved.
//

#import "APPViewController.h"

#import "RecommandView.h"

#import "RankingView.h"

#import "ClassifyView.h"

#import "NecessaryView.h"

@interface APPViewController ()

@end

#define Width self.view.frame.size.width

#define ButtonWidth 50

#define PointY _smallScrollView.frame.origin.y + _smallScrollView.frame.size.height

#define Heigh _baseScrollView.frame.size.height

#define row  (self.view.frame.size.width - 200)/5

@implementation APPViewController

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    
    [[self navigationController] setNavigationBarHidden:YES animated:YES];
    
    [super.navigationController setToolbarHidden:YES animated:TRUE];
}
- (void)viewDidLoad
{
    
    [super viewDidLoad];
    
    [self initSmallScrollView];
    
    _baseScrollView.contentSize = CGSizeMake(Width * 4, Heigh);
    
    _baseScrollView.delegate = self;
    
    _baseScrollView.pagingEnabled = YES;
    
    //默认显示的“推荐”
    
    RecommandView *recommandView = [[RecommandView alloc]initWithFrame:CGRectMake(0,0, Width, Heigh)];
    
    recommandView.tag = 101;
    
    recommandView.backgroundColor = [UIColor cyanColor];
    
    [_baseScrollView addSubview:recommandView];
    
    [self addView];

    // Do any additional setup after loading the view.
}

-(void)initSmallScrollView
{
    NSArray *titleArr = @[@"推荐",@"分类",@"排行",@"必备"];
    
    _backLab = [[UILabel alloc]init];
    
    _backLab.bounds = CGRectMake(0, 0, 50, 2);
    
    _backLab.alpha = 0.5;
    
    _backLab.backgroundColor = [UIColor blueColor];
    
    _backLab.clipsToBounds = YES;
    
    [self.smallScrollView addSubview:_backLab];
    
    for (int a = 0; a < 4; a++)
    {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [button setTitle:titleArr[a] forState:UIControlStateNormal];
        
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        button.frame = CGRectMake((row +(ButtonWidth + row) *a), 0, ButtonWidth, ButtonWidth);
        
        button.tag = a + 11;
        
        if (a == 0)
        {
            _backLab.center = CGPointMake(button.center.x, 49);
        }
        
        [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
        
        [_smallScrollView addSubview:button];
    }
}
-(void)buttonClicked:(UIButton *)clickedBtn
{
    [UIView beginAnimations:@"labelMove" context:nil];
    
    [UIView animateWithDuration:1 animations:^{
        
        _backLab.center = CGPointMake(clickedBtn.center.x, 49);
        
    }];
    
    [UIView commitAnimations];
    
     //点击不同的选项，界面切换
    
    [_baseScrollView setContentOffset:CGPointMake(Width *(clickedBtn.tag - 11), 0)];
    
    NSLog(@"111=====%f",_baseScrollView.contentOffset.x);
    
}
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSLog(@"====%f",scrollView.contentOffset.x);
    
    int a = scrollView.contentOffset.x/Width;
    
     _backLab.center = CGPointMake((row +(ButtonWidth + row) *a) + 25, 50);
}
-(void)addView
{
    ClassifyView *classifyView = [[ClassifyView alloc]initWithFrame:CGRectMake(Width,0, Width, Heigh)];
    
    classifyView.tag = 102;
    
    [_baseScrollView addSubview:classifyView];
    
    RankingView *rankingView = [[RankingView alloc]initWithFrame:CGRectMake(Width *2,0, Width, Heigh)];
    
    rankingView.tag = 103;
    
    [_baseScrollView addSubview:rankingView];
    
    NecessaryView *necessaryView = [[NecessaryView alloc]initWithFrame:CGRectMake(Width *3,0, Width, Heigh)];
    
    necessaryView.tag = 104;
    
    [_baseScrollView addSubview:necessaryView];
}
-(void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
