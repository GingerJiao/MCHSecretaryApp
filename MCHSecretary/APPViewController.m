//
//  APPViewController.m
//  MCHSecretary
//
//  Created by zhujin zhujin on 16/8/23.
//  Copyright © 2016年 朱进. All rights reserved.
//

#import "APPViewController.h"

#import "RecommandView.h"


@interface APPViewController ()

@end

#define Width self.view.frame.size.width

#define ButtonWidth 50

#define PointY _smallScrollView.frame.origin.y + _smallScrollView.frame.size.height

#define Heigh self.view.frame.size.height - PointY

@implementation APPViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initSmallScrollView];
    
    RecommandView *recommandView = [[RecommandView alloc]initWithFrame:CGRectMake(0, PointY, Width, Heigh)];
    
    
    [self.view addSubview:recommandView];
    
    // Do any additional setup after loading the view.
}

-(void)initSmallScrollView
{
    float row = (Width - ButtonWidth *4)/5;
    
    NSArray *titleArr = @[@"推荐",@"分类",@"排行",@"必备"];
    
    _backLab = [[UILabel alloc]init];
    
    _backLab.frame = CGRectMake(row, 0, 50, 50);
    
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
    _backLab.frame = clickedBtn.frame;
    
    NSLog(@"==%ld",(long)clickedBtn.tag);
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
