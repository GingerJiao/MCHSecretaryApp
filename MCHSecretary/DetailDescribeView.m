//
//  DetailDescribeView.m
//  MCHSecretary
//
//  Created by 朱进 on 16/8/19.
//  Copyright © 2016年 朱进. All rights reserved.
//

#import "DetailDescribeView.h"

#import "WebImage.h"
#import "StringUtils.h"

#import "AppPacketInfo.h"

#define kScreenWidth [[UIScreen mainScreen] bounds].size.width

#define GetColor(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
#define LineColor GetColor(230,230,230,1.0)
#define TextColor GetColor(102,102,102,1.0)

#define GetFont(s) [UIFont systemFontOfSize:s]
#define TitleFont GetFont(18)
#define ContentTextSize 13
#define TextFont GetFont(ContentTextSize)

@implementation DetailDescribeView

-(instancetype) initWithFrame:(CGRect)frame{
    if(self = [super initWithFrame:frame]){
        [self initSubView];
    }
    return self;
}

-(instancetype) initWithFrame:(CGRect)frame appInfo:(AppPacketInfo *)info{
    if(self = [super initWithFrame:frame]){
        [self initAppDetail:info];
    }
    return self;
}

-(void) initSubView{
    
}

-(void)initAppDetail:(AppPacketInfo *)info{
    CGFloat ivScrollY = 0;
    UIScrollView *imageScroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, ivScrollY, kScreenWidth, 304)];
    imageScroll.backgroundColor = [UIColor clearColor];
    imageScroll.scrollEnabled = YES;
    imageScroll.showsHorizontalScrollIndicator = NO;
    imageScroll.showsVerticalScrollIndicator = NO;
    //    imageScroll.bounces = YES;
    
    NSString *imageUrls = info.describeImages;
    NSArray *array = [imageUrls componentsSeparatedByString:@","];
    CGFloat contentW = 0;
    for (int i = 0; i < array.count; i++) {
        //        NSLog(@"image url(%d):%@", i, [array objectAtIndex:i]);
        UIImageView *ivDesc = [[UIImageView alloc] initWithFrame:CGRectMake(10 + (10 + 160) * i, 10, 160, 284)];
        [ivDesc sd_setImageWithURL:array[i] placeholderImage:nil];
        contentW = CGRectGetMaxX(ivDesc.frame) + 10;
        [imageScroll addSubview:ivDesc];
    }
    CGSize scrollSize = CGSizeMake(contentW, 304);
    imageScroll.contentSize = scrollSize;
    [self addSubview:imageScroll];
    //    NSLog(@"contentSize :%@", NSStringFromCGSize(imageScroll.contentSize));
    //    NSLog(@"frame.size :%@", NSStringFromCGSize(imageScroll.frame.size));
    
    
    CGFloat sLineY = CGRectGetMaxY(imageScroll.frame);
    UIView *scrollLine = [[UIView alloc] initWithFrame:CGRectMake(0, sLineY, kScreenWidth, 1)];
    [scrollLine setBackgroundColor:LineColor];
    [self addSubview:scrollLine];
    
    [self addDescribeView:info position:CGRectGetMaxY(scrollLine.frame) + 15 extend:YES];
    
}

//内容简介
-(void)addDescribeView:(AppPacketInfo*)info position:(CGFloat)posY extend:(BOOL)isextend{
    
    UIImageView *ivPoint = [[UIImageView alloc] initWithFrame:CGRectMake(5, posY + 7, 5, 5)];
    [ivPoint setImage:[UIImage imageNamed:@"signpoint.png"]];
    [self addSubview:ivPoint];
    
    UILabel *lblDescribe = [[UILabel alloc] init];
    [lblDescribe setFrame:CGRectMake(15, posY, 100, 20)];
    [lblDescribe setFont:TitleFont];
    [lblDescribe setTextColor:[UIColor blackColor]];
    [lblDescribe setNumberOfLines:1];
    [lblDescribe setText:NSLocalizedString(@"ContentDescribe", @"")];
    
    UILabel *txtDescribe = [[UILabel alloc] init];
    if(isextend){
        [txtDescribe setNumberOfLines:0];
        CGSize descMax = [StringUtils sizeWithString:info.contentDescribe font:TextFont maxSize:CGSizeMake(kScreenWidth - 30, 0)];
        [txtDescribe setFrame:CGRectMake(15, posY + 30, descMax.width, descMax.height)];
    }else{
        [txtDescribe setNumberOfLines:2];
        [txtDescribe setFrame:CGRectMake(15, posY + 30, kScreenWidth - 30, ContentTextSize * 2)];
    }
    [txtDescribe setFont:TextFont];
    [txtDescribe setTextColor:TextColor];
    [txtDescribe setText:info.contentDescribe];
    [self addSubview:lblDescribe];
    [self addSubview:txtDescribe];
    
    CGFloat sLineY = CGRectGetMaxY(txtDescribe.frame) + 10;
    UIView *scrollLine = [[UIView alloc] initWithFrame:CGRectMake(0, sLineY, kScreenWidth, 1)];
    [scrollLine setBackgroundColor:LineColor];
    [self addSubview:scrollLine];
    
    [self addUpdateRecordView:info position:CGRectGetMaxY(scrollLine.frame) + 15 extend:YES];
}
//更新日志
-(void)addUpdateRecordView:(AppPacketInfo*)info position:(CGFloat)posY extend:(BOOL)isextend{
    UIImageView *ivPoint = [[UIImageView alloc] initWithFrame:CGRectMake(5, posY + 7, 5, 5)];
    [ivPoint setImage:[UIImage imageNamed:@"signpoint.png"]];
    [self addSubview:ivPoint];
    
    UILabel *lblUpdateRecord = [[UILabel alloc] init];
    [lblUpdateRecord setFrame:CGRectMake(15, posY, 100, 20)];
    [lblUpdateRecord setFont:TitleFont];
    [lblUpdateRecord setTextColor:[UIColor blackColor]];
    [lblUpdateRecord setNumberOfLines:1];
    [lblUpdateRecord setText:NSLocalizedString(@"UpdateLogs", @"")];
    
    UILabel *txtUpdateList = [[UILabel alloc] init];
    if(isextend){
        [txtUpdateList setNumberOfLines:0];
        CGSize descMax = [StringUtils sizeWithString:info.updateLogs font:TextFont maxSize:CGSizeMake(kScreenWidth - 30, 0)];
        [txtUpdateList setFrame:CGRectMake(15, posY + 30, descMax.width, descMax.height)];
    }else{
        [txtUpdateList setNumberOfLines:2];
        [txtUpdateList setFrame:CGRectMake(15, posY + 30, kScreenWidth - 30, ContentTextSize * 2)];
    }
    [txtUpdateList setFont:TextFont];
    [txtUpdateList setTextColor:TextColor];
    [txtUpdateList setText:info.updateLogs];
    [self addSubview:lblUpdateRecord];
    [self addSubview:txtUpdateList];
    
    CGFloat sLineY = CGRectGetMaxY(txtUpdateList.frame) + 10;
    UIView *scrollLine = [[UIView alloc] initWithFrame:CGRectMake(0, sLineY, kScreenWidth, 1)];
    [scrollLine setBackgroundColor:LineColor];
    [self addSubview:scrollLine];
    
    [self addVerisionView:info position:CGRectGetMaxY(scrollLine.frame) + 15 extend:YES];
}
//版本信息
-(void)addVerisionView:(AppPacketInfo*)info position:(CGFloat)posY extend:(BOOL)isextend{
    UIImageView *ivPoint = [[UIImageView alloc] initWithFrame:CGRectMake(5, posY + 7, 5, 5)];
    [ivPoint setImage:[UIImage imageNamed:@"signpoint.png"]];
    [self addSubview:ivPoint];
    
    UILabel *lblVerision = [[UILabel alloc] init];
    [lblVerision setFrame:CGRectMake(15, posY, 100, 20)];
    [lblVerision setFont:TitleFont];
    [lblVerision setTextColor:[UIColor blackColor]];
    [lblVerision setNumberOfLines:1];
    [lblVerision setText:NSLocalizedString(@"VersionInfo", @"")];
    [self addSubview:lblVerision];
    
    float padding = 15;
    CGFloat titleConW = ContentTextSize * 4;
    CGFloat txtX = 15 + titleConW + 15;
    CGFloat TxtConW = kScreenWidth - txtX - 15;
    //版本信息
    UILabel *lblVersionNum = [[UILabel alloc] initWithFrame:CGRectMake(15, posY + 30, titleConW, ContentTextSize)];
    [lblVersionNum setFont:TextFont];
    [lblVersionNum setTextColor:TextColor];
    [lblVersionNum setText:NSLocalizedString(@"VersionNumber", @"")];
    [lblVersionNum setNumberOfLines:1];
    [lblVersionNum setTextAlignment:NSTextAlignmentRight];
    [self addSubview:lblVersionNum];
    
    UILabel *lblVersionNumTxt = [[UILabel alloc] initWithFrame:CGRectMake(txtX, posY + 30, TxtConW, ContentTextSize)];
    [lblVersionNumTxt setFont:TextFont];
    [lblVersionNumTxt setTextColor:TextColor];
    [lblVersionNumTxt setText:info.versionInfo];
    [lblVersionNumTxt setNumberOfLines:1];
    [lblVersionNumTxt setTextAlignment:NSTextAlignmentLeft];
    [self addSubview:lblVersionNumTxt];
    
    //应用包大小
    CGFloat sizeY = CGRectGetMaxY(lblVersionNum.frame) + padding;
    UILabel *lblSize = [[UILabel alloc] initWithFrame:CGRectMake(15, sizeY, titleConW, ContentTextSize)];
    [lblSize setFont:TextFont];
    [lblSize setTextColor:TextColor];
    [lblSize setText:NSLocalizedString(@"AppSize", @"")];
    [lblSize setNumberOfLines:1];
    [lblSize setTextAlignment:NSTextAlignmentRight];
    [self addSubview:lblSize];
    
    UILabel *lblSizeTxt = [[UILabel alloc] initWithFrame:CGRectMake(txtX, sizeY, TxtConW, ContentTextSize)];
    [lblSizeTxt setFont:TextFont];
    [lblSizeTxt setTextColor:TextColor];
    [lblSizeTxt setText:[NSString stringWithFormat:@"%@MB", info.packetSize]];
    [lblSizeTxt setNumberOfLines:1];
    [lblSizeTxt setTextAlignment:NSTextAlignmentLeft];
    [self addSubview:lblSizeTxt];
    
    //更新时间
    CGFloat upDataY = CGRectGetMaxY(lblSize.frame) + padding;
    UILabel *lblUpdateData = [[UILabel alloc] initWithFrame:CGRectMake(15, upDataY, titleConW, ContentTextSize)];
    [lblUpdateData setFont:TextFont];
    [lblUpdateData setTextColor:TextColor];
    [lblUpdateData setText:NSLocalizedString(@"AppUpdateData", @"")];
    [lblUpdateData setNumberOfLines:1];
    [lblUpdateData setTextAlignment:NSTextAlignmentRight];
    [self addSubview:lblUpdateData];
    
    UILabel *lblUpdateDataTxt = [[UILabel alloc] initWithFrame:CGRectMake(txtX, upDataY, TxtConW, ContentTextSize)];
    [lblUpdateDataTxt setFont:TextFont];
    [lblUpdateDataTxt setTextColor:TextColor];
    [lblUpdateDataTxt setText:info.updateData];
    [lblUpdateDataTxt setNumberOfLines:1];
    [lblUpdateDataTxt setTextAlignment:NSTextAlignmentLeft];
    [self addSubview:lblUpdateDataTxt];
    
    //应用类型
    CGFloat typeY = CGRectGetMaxY(lblUpdateData.frame) + padding;
    UILabel *lblType = [[UILabel alloc] initWithFrame:CGRectMake(15, typeY, titleConW, ContentTextSize)];
    [lblType setFont:TextFont];
    [lblType setTextColor:TextColor];
    [lblType setText:NSLocalizedString(@"AppType", @"")];
    [lblType setNumberOfLines:1];
    [lblType setTextAlignment:NSTextAlignmentRight];
    [self addSubview:lblType];
    
    UILabel *lblTypeTxt = [[UILabel alloc] initWithFrame:CGRectMake(txtX, typeY, TxtConW, ContentTextSize)];
    [lblTypeTxt setFont:TextFont];
    [lblTypeTxt setTextColor:TextColor];
    [lblTypeTxt setText:info.appType];
    [lblTypeTxt setNumberOfLines:1];
    [lblTypeTxt setTextAlignment:NSTextAlignmentLeft];
    [self addSubview:lblTypeTxt];
    
    //语言
    CGFloat languageY = CGRectGetMaxY(lblType.frame) + padding;
    UILabel *lblLanguage = [[UILabel alloc] initWithFrame:CGRectMake(15, languageY, titleConW, ContentTextSize)];
    [lblLanguage setFont:TextFont];
    [lblLanguage setTextColor:TextColor];
    [lblLanguage setText:NSLocalizedString(@"AppLanguage", @"")];
    [lblLanguage setNumberOfLines:1];
    [lblLanguage setTextAlignment:NSTextAlignmentRight];
    [self addSubview:lblLanguage];
    
    UILabel *lblLanguageTxt = [[UILabel alloc] initWithFrame:CGRectMake(txtX, languageY, TxtConW, ContentTextSize)];
    [lblLanguageTxt setFont:TextFont];
    [lblLanguageTxt setTextColor:TextColor];
    [lblLanguageTxt setText:info.language];
    [lblLanguageTxt setNumberOfLines:1];
    [lblLanguageTxt setTextAlignment:NSTextAlignmentLeft];
    [self addSubview:lblLanguageTxt];
    
    //开发商
    CGFloat developY = CGRectGetMaxY(lblLanguage.frame) + padding;
    UILabel *lblDevelop = [[UILabel alloc] initWithFrame:CGRectMake(15, developY, titleConW, ContentTextSize)];
    [lblDevelop setFont:TextFont];
    [lblDevelop setTextColor:TextColor];
    [lblDevelop setText:NSLocalizedString(@"AppDeveloper", @"")];
    [lblDevelop setNumberOfLines:1];
    [lblDevelop setTextAlignment:NSTextAlignmentRight];
    [self addSubview:lblDevelop];
    
    UILabel *lblDevelopTxt = [[UILabel alloc] initWithFrame:CGRectMake(txtX, developY, TxtConW, ContentTextSize)];
    [lblDevelopTxt setFont:TextFont];
    [lblDevelopTxt setTextColor:TextColor];
    [lblDevelopTxt setText:info.developCompany];
    [lblDevelopTxt setNumberOfLines:1];
    [lblDevelopTxt setTextAlignment:NSTextAlignmentLeft];
    [self addSubview:lblDevelopTxt];
    
    //兼容性
    CGFloat compatibleY = CGRectGetMaxY(lblDevelop.frame) + padding;
    UILabel *lblCompatible = [[UILabel alloc] initWithFrame:CGRectMake(15, compatibleY, titleConW, ContentTextSize)];
    [lblCompatible setFont:TextFont];
    [lblCompatible setTextColor:TextColor];
    [lblCompatible setText:NSLocalizedString(@"AppCompatible", @"")];
    [lblCompatible setNumberOfLines:1];
    [lblCompatible setTextAlignment:NSTextAlignmentRight];
    [self addSubview:lblCompatible];
    
    UILabel *lblCompatibleTxt = [[UILabel alloc] init];
    CGSize s = [StringUtils sizeWithString:info.compatible font:TextFont maxSize:CGSizeMake(TxtConW, 0)];
    [lblCompatibleTxt setFrame:CGRectMake(txtX, compatibleY, s.width, s.height)];
    [lblCompatibleTxt setFont:TextFont];
    [lblCompatibleTxt setTextColor:TextColor];
    [lblCompatibleTxt setText:info.compatible];
    [lblCompatibleTxt setNumberOfLines:0];
    [lblCompatibleTxt setTextAlignment:NSTextAlignmentLeft];
    [self addSubview:lblCompatibleTxt];
    
    //    NSLog(@"%@", NSStringFromCGRect(txtVerision.frame));
    CGFloat detailY = CGRectGetMaxY(lblCompatibleTxt.frame);
    CGRect r = self.frame;
    r.size.height = detailY;
    [self setFrame:r];
    //    NSLog(@"%f", detailY);
//    detailScrollView.contentSize = CGSizeMake(kScreenWidth, detailY);
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
