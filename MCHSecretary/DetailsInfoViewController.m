//
//  DetailsInfoViewController.m
//  MCHSecretary
//
//  Created by 朱进 on 16/8/13.
//  Copyright © 2016年 朱进. All rights reserved.
//

#import "DetailsInfoViewController.h"

#import "DetailInfoRequest.h"

#import "WebImage.h"
#import "StringUtils.h"

#define kScreenWidth [[UIScreen mainScreen] bounds].size.width

#define GetColor(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
#define LineColor GetColor(230,230,230,1.0)
#define TextColor GetColor(102,102,102,1.0)

#define GetFont(s) [UIFont systemFontOfSize:s]
#define TitleFont GetFont(18)
#define ContentTextSize 13
#define TextFont GetFont(ContentTextSize)

@interface DetailsInfoViewController (){
    DetailSegmentView *detailSegmentView;
    
    float segmentTopY;
    BOOL segmentIsShow;
    
    AppPacketInfo *info;
    
    DetailDescribeView *descView;
    DetailCommentView *commentView;
}

@end

@implementation DetailsInfoViewController

@synthesize appSmallIcon, appName, appStarValue, appCommentNum, appDownAndSize, detailScrollView, infoView, segmentView;
//@synthesize lblDescribe, lblVerision, lblUpdateRecord, txtDescribe, txtVerision, txtUpdateList;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initView];
    
    [self initNavigationView];
    
    [self initData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) viewWillAppear:(BOOL)animated {
    [[self navigationController] setNavigationBarHidden:NO animated:YES];
    [super.navigationController setToolbarHidden:NO animated:YES];
    [super viewWillAppear:animated];
}

-(void) initView{
    segmentTopY = 1000;
    segmentIsShow = NO;
    
    CGFloat segmentY = CGRectGetMaxY(infoView.frame) - 40;
    segmentTopY = segmentY;
    
    detailScrollView.delegate = self;
    
    appSmallIcon.layer.cornerRadius = 15;
    appSmallIcon.layer.masksToBounds = YES;
    
    detailSegmentView = [[DetailSegmentView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 39)];
    detailSegmentView.delegate = self;
    segmentView.delegate = self;
    
}

- (void)initNavigationView {
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
    self.navigationController.navigationBar.translucent = NO;
//    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"m_nav64"] forBarMetrics:UIBarMetricsDefault];
    
    self.navigationItem.title = NSLocalizedString(@"DetailsTitle", @"");
    self.navigationController.navigationBar.titleTextAttributes = @{NSFontAttributeName:[UIFont systemFontOfSize:18.0]};
//    self.navigationItem.titleView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"m_hot60"]];
    
    //添加多个按钮
    UIButton *leftImage = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftImage setFrame:CGRectMake(0, 0, 16, 25)];
    [leftImage setImage:[UIImage imageNamed:@"viewback.png"] forState:UIControlStateNormal];
    [leftImage addTarget:self action:@selector(btnBack:) forControlEvents:UIControlEventTouchUpInside];
    leftImage.imageEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 0);
    UIBarButtonItem *leftButtonImage = [[UIBarButtonItem alloc] initWithCustomView:leftImage];
    
    UIButton *leftText = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftText setFrame:CGRectMake(0, 0, 32, 25)];
    [leftText addTarget:self action:@selector(btnBack:) forControlEvents:UIControlEventTouchUpInside];
    [leftText setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [leftText setTitle:NSLocalizedString(@"BackText", @"") forState:UIControlStateNormal];
    leftText.titleEdgeInsets = UIEdgeInsetsMake(0, -25, 0, 0);
    leftText.titleLabel.font = [UIFont systemFontOfSize:16];
    UIBarButtonItem *leftButtonText = [[UIBarButtonItem alloc] initWithCustomView:leftText];
    
    NSArray* array = @[leftButtonImage,leftButtonText];
    self.navigationItem.leftBarButtonItems = array;
    
    //定制返回按钮,这两个要一起用,为啥这么用，苹果言语不详
//    self.navigationController.navigationBar.backIndicatorImage = [UIImage imageNamed:@"m_ios"];
//    self.navigationController.navigationBar.backIndicatorTransitionMaskImage = [UIImage imageNamed:@"m_ios"];
    
    UIBarButtonItem *btn4 = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
//    UIBarButtonItem *btn3 = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItem target:self action:nil];
    
//    CGFloat downloadW = kScreenWidth - 100;
    UIButton *btnDownload = [UIButton buttonWithType:UIButtonTypeCustom];
    btnDownload.layer.cornerRadius = 5;
    [btnDownload setFrame:CGRectMake(0, 0, kScreenWidth - 100, 25)];
    [btnDownload addTarget:self action:@selector(btnBack:) forControlEvents:UIControlEventTouchUpInside];
    [btnDownload setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btnDownload setTitle:NSLocalizedString(@"AppDetailDownload", @"") forState:UIControlStateNormal];
//    btnDownload.titleEdgeInsets = UIEdgeInsetsMake(0, 50, 0, 0);
    [btnDownload setBackgroundColor:[UIColor blueColor]];
    btnDownload.titleLabel.font = [UIFont systemFontOfSize:13];
    UIBarButtonItem *barbtnDownload = [[UIBarButtonItem alloc] initWithCustomView:btnDownload];
    
    UIButton *btnStar = [UIButton buttonWithType:UIButtonTypeCustom];
    [btnStar setFrame:CGRectMake(0, 0, 25, 25)];
    [btnStar setImage:[UIImage imageNamed:@"love"] forState:UIControlStateNormal];
    [btnStar addTarget:self action:@selector(btnBack:) forControlEvents:UIControlEventTouchUpInside];
//    btnStar.imageEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 0);
    UIBarButtonItem *barbtnStar = [[UIBarButtonItem alloc] initWithCustomView:btnStar];
    
    
    NSArray *toolArray = [[NSArray alloc]initWithObjects:btn4, barbtnDownload, barbtnStar, nil];
    self.toolbarItems = toolArray;
    
}

-(void) initData{
    info = nil;
    
    [[[DetailInfoRequest alloc] init] getAppInfo:^(AppPacketInfo *appinfo) {
        info = appinfo;
//        NSLog(@"%@", appinfo.describeImages);
        [self initAppInfo];
        
        [self initAppDetail];
    } failure:^(NSURLResponse *response, NSError *error, NSDictionary *dic) {
        
    }];
}

-(void) initAppInfo{
    if(nil == info){
        return;
    }
    [appSmallIcon sd_setImageWithURL:[NSURL URLWithString:info.smallImageUrl] placeholderImage:nil];
    [appName setText:info.packetName];
    CGSize nameSize = [StringUtils sizeWithString:info.packetName font:[UIFont systemFontOfSize:18] maxSize:CGSizeMake([[UIScreen mainScreen] bounds].size.width - 160, 42)];
    CGRect nameRect = appName.frame;
    nameRect.size = nameSize;
    appName.frame = nameRect;
    
    [appStarValue setScorePercent:info.starAverage];
    NSString *commnetStr = [NSString stringWithFormat:@"(%@%@)", info.commentNumber, NSLocalizedString(@"AppComment", @"")];
    [appCommentNum setText:commnetStr];
    
    NSString *packetDown = [NSString stringWithFormat:@"%@%@", info.appDownloadNum, NSLocalizedString(@"AppDownNumber", @"")];
    NSString *packetSize = [NSString stringWithFormat:@"%@MB", info.packetSize];
    [appDownAndSize setText:[NSString stringWithFormat:@"%@ · %@", packetSize, packetDown]];
}

-(void)initAppDetail{
    if(nil == info){
        return;
    }
    if(descView && [descView isHidden]){
        [descView setHidden:NO];
        return;
    }
    
    CGFloat ivScrollY = CGRectGetMaxY(infoView.frame);
    
    descView = [[DetailDescribeView alloc] initWithFrame:CGRectMake(0, ivScrollY, kScreenWidth, 500) appInfo:info];
    [detailScrollView addSubview:descView];
    
    CGFloat descConH = CGRectGetMaxY(descView.frame);
    detailScrollView.contentSize = CGSizeMake(kScreenWidth, descConH);
}

-(void) changeSegmentItem:(NSInteger)index{
//    NSLog(@"changeSegmentItem:%ld", (long)index);
    if(detailSegmentView){
        [detailSegmentView setSelectSegement:index];
    }
    if(segmentView){
        [segmentView setSelectSegement:index];
    }
    
    if(descView){
        [descView setHidden:YES];
    }
    if(commentView){
        [commentView setHidden:YES];
    }

    if(index == 0){
        [self initAppDetail];
    }else if(index == 1){
//        NSLog(@"2-initCommentView");
        [self initCommentView];
    }else if(index == 2){
        NSLog(@"init tuijian");
        
    }
    
}

-(void) initCommentView{
    if(nil == info){
        return;
    }
    if(commentView && [commentView isHidden]){
        [commentView setHidden:NO];
        return;
    }
    
    CGFloat ivScrollY = CGRectGetMaxY(infoView.frame);
    commentView = [[DetailCommentView alloc] initWithFrame:CGRectMake(0, ivScrollY, kScreenWidth, 500)];
    [detailScrollView addSubview:commentView];
    
    CGFloat descConH = CGRectGetMaxY(commentView.frame);
    detailScrollView.contentSize = CGSizeMake(kScreenWidth, descConH);
}

-(void) btnBack:(UIBarButtonItem *)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    //    NSLog(@"%f", scrollView.contentOffset.y);
    if(detailSegmentView){
        if (scrollView.contentOffset.y <= segmentTopY && scrollView.contentOffset.y >= 0) {
            if(segmentIsShow){
                segmentIsShow = NO;
                [detailSegmentView removeFromSuperview];
            }
        } else if (scrollView.contentOffset.y >= segmentTopY) {
            if(!segmentIsShow){
                segmentIsShow = YES;
                [self.view addSubview:detailSegmentView];
            }
        }
    }
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
