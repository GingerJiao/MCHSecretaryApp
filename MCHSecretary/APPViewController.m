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

@implementation APPViewController

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    
    [[self navigationController] setNavigationBarHidden:YES animated:YES];
    
    [super.navigationController setToolbarHidden:YES animated:TRUE];
}
- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self initSmallScrollView];
    
    _baseScrollView.contentSize = CGSizeMake(Width * 4, Heigh);
    
    //默认显示的“推荐”
    
    RecommandView *recommandView = [[RecommandView alloc]initWithFrame:CGRectMake(0,0, Width, Heigh)];
    
    recommandView.tag = 101;
    
    recommandView.backgroundColor = [UIColor cyanColor];
    
    [_baseScrollView addSubview:recommandView];

    // Do any additional setup after loading the view.
}

-(void)initSmallScrollView
{
    float row = (Width - ButtonWidth *4)/5;
    
    NSArray *titleArr = @[@"推荐",@"分类",@"排行",@"必备"];
    
    _backLab = [[UILabel alloc]init];
    
    _backLab.frame = CGRectMake(row, 5, 50, 40);
    
    _backLab.alpha = 0.5;
    
    _backLab.layer.borderColor = [UIColor clearColor].CGColor;
    
    _backLab.layer.cornerRadius = 10;
    
    _backLab.layer.borderWidth = 1;
    
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
        
        [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
        
        [_smallScrollView addSubview:button];
    }
}
-(void)buttonClicked:(UIButton *)clickedBtn
{
    UIView *vie;
    
    _backLab.frame = clickedBtn.frame;
    
    NSLog(@"==%ld",(long)clickedBtn.tag);
    
     //点击不同的选项，界面切换
    
    if (clickedBtn.tag == 11 )
    {
        [_baseScrollView setContentOffset:CGPointMake(0, 0)];
    }
    else if (clickedBtn.tag == 13)
    {
        vie = [self.view viewWithTag:103];
        
        if (!vie)
        {
            RankingView *rankingView = [[RankingView alloc]initWithFrame:CGRectMake(Width *2,0, Width, Heigh)];
            
            rankingView.tag = 103;
            
            [_baseScrollView addSubview:rankingView];
        }
        [_baseScrollView setContentOffset:CGPointMake(Width * 2, 0)];
    }
    else if (clickedBtn.tag == 14)
    {
        vie = [self.view viewWithTag:104];
        
        if (!vie)
        {
            NecessaryView *necessaryView = [[NecessaryView alloc]initWithFrame:CGRectMake(Width *3,0, Width, Heigh)];
            
            necessaryView.tag = 104;
            
            [_baseScrollView addSubview:necessaryView];
        }
        
        [_baseScrollView setContentOffset:CGPointMake(Width * 3, 0)];
    }
    else
    {
        vie = [self.view viewWithTag:102];
        
        if (!vie)
        {
            ClassifyView *classifyView = [[ClassifyView alloc]initWithFrame:CGRectMake(Width,0, Width, Heigh)];
            
            classifyView.tag = 102;
            
            [_baseScrollView addSubview:classifyView];
        }

         [_baseScrollView setContentOffset:CGPointMake(Width, 0)];
    }
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
