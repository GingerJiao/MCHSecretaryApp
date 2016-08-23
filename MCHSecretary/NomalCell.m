//
//  NomalCell.m
//  MCHSecretary
//
//  Created by 朱进 on 16/8/9.
//  Copyright © 2016年 朱进. All rights reserved.
//

#import "NomalCell.h"

#import "AppPacketInfo.h"
#import "NomalFrame.h"
#import "WebImage.h"

#define NameFont [UIFont systemFontOfSize:15]
#define MiddleFont [UIFont systemFontOfSize:10]
#define DescribeFont [UIFont systemFontOfSize:12]
#define LineColor [UIColor colorWithRed:230 / 255.0 green:230 / 255.0 blue:230 / 255.0 alpha:1.0]
#define MiddleTextColor [UIColor colorWithRed:150 / 255.0 green:150 / 255.0 blue:150 / 255.0 alpha:1.0]
#define DescribeColor [UIColor colorWithRed:50 / 255.0 green:50 / 255.0 blue:50 / 255.0 alpha:1.0]

@interface NomalCell(){
    NSInteger currentSection;
}

@property (nonatomic, weak) UIImageView * ivAppIcon;
@property (nonatomic, weak) UILabel * lblName;
@property (nonatomic, weak) UILabel * lblMiddle;
@property (nonatomic, weak) UILabel * lblDescribe;
@property (nonatomic, weak) UIButton * btnDownload;
@property (nonatomic, weak) UIButton * btnDownloadText;
@property (nonatomic, weak) UIView * lineview;

@end



@implementation NomalCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+(instancetype) cellWithTableView:(UITableView *)tableView{
    static NSString *identifer = @"nomallist";
    
    NomalCell *cell = [tableView dequeueReusableCellWithIdentifier:identifer];
    if(cell == nil){
        cell = [[NomalCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifer];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}

-(id) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        UIImageView *icon = [[UIImageView alloc] init];
        icon.layer.cornerRadius = 13;
        icon.layer.borderWidth = 0.5;
        icon.layer.borderColor = [LineColor CGColor];
        [self.contentView addSubview:icon];
        self.ivAppIcon = icon;
        
        UILabel *nameLabel = [[UILabel alloc] init];
        nameLabel.font = NameFont;
        nameLabel.textColor = [UIColor blackColor];
        nameLabel.numberOfLines = 1;
        [self.contentView addSubview:nameLabel];
        self.lblName = nameLabel;
        
        UILabel *middleLabel = [[UILabel alloc] init];
        middleLabel.font = MiddleFont;
        middleLabel.textColor = MiddleTextColor;
        middleLabel.numberOfLines = 1;
        [self.contentView addSubview:middleLabel];
        self.lblMiddle = middleLabel;
        
        UILabel *describeLabel = [[UILabel alloc] init];
        describeLabel.font = DescribeFont;
        describeLabel.textColor = DescribeColor;
        describeLabel.numberOfLines = 1;
        [self.contentView addSubview:describeLabel];
        self.lblDescribe = describeLabel;
        
        UIButton *btndown = [[UIButton alloc] init];
        [self.contentView addSubview:btndown];
        self.btnDownload = btndown;
        
        UIButton *btndowntext = [[UIButton alloc] init];
        [btndowntext setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        btndowntext.titleLabel.font = DescribeFont;
        btndowntext.titleLabel.numberOfLines = 1;
        btndowntext.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
        [self.contentView addSubview:btndowntext];
        self.btnDownloadText = btndowntext;
        
        UIView *line = [[UIView alloc] init];
        line.backgroundColor = LineColor;
        [self.contentView addSubview:line];
        self.lineview = line;
    }
    return self;
}

-(void) setNomalFrame:(NomalFrame *)nomalFrame section:(NSInteger)section pos:(NSInteger)index{
    _nomalFrame = nomalFrame;
    
    [self setSubViewData:section pos:index];
    [self setSubViewFrame];
}

-(void) setSubViewData:(NSInteger)section pos:(NSInteger)index{
    AppPacketInfo * packInfo = self.nomalFrame.packetInfo;
    currentSection = section;
    
    [self.ivAppIcon sd_setImageWithURL:[NSURL URLWithString:packInfo.smallImageUrl] placeholderImage:[UIImage imageNamed:@"tabbtn_choice_select"]];
    
    self.lblName.text = packInfo.packetName;
    
    NSString *packetDown = [NSString stringWithFormat:@"%@%@", packInfo.appDownloadNum, NSLocalizedString(@"AppDownNumber", @"")];
    NSString *packetSize = [NSString stringWithFormat:@"%@MB", packInfo.packetSize];
    self.lblMiddle.text = [NSString stringWithFormat:@"%@ · %@", packetDown, packetSize];
    
    self.lblDescribe.text = packInfo.appDescribe;
    
    [self.btnDownload setBackgroundImage:[UIImage imageNamed:@"choice_download"] forState:UIControlStateNormal];
    self.btnDownload.tag = index;
    [self.btnDownload addTarget:self action:@selector(downloadApp:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.btnDownloadText setTitle:NSLocalizedString(@"AppDownload", @"") forState:UIControlStateNormal];
}

-(void) setSubViewFrame{
    self.ivAppIcon.frame = self.nomalFrame.imageFrame;
    self.lblName.frame = self.nomalFrame.nameFrame;
    self.lblMiddle.frame = self.nomalFrame.middleFrame;
    self.lblDescribe.frame = self.nomalFrame.describeFrame;
    self.btnDownload.frame = self.nomalFrame.downloadFrame;
    self.btnDownloadText.frame = self.nomalFrame.downloadTextFrame;
    self.lineview.frame = self.nomalFrame.lineFrame;
}

-(void) downloadApp:(UIButton *)sender{
//    NSLog(@"%ld", (long)currentSection);
    NSInteger index = sender.tag;
    [_delegate startDownloadApp:currentSection index:index];
}










@end
