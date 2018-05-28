//
//  ProductAppraisalCell.m
//  jike
//
//  Created by 上海荣豫资产 on 2018/5/25.
//  Copyright © 2018年 陶庭兴. All rights reserved.
//

#import "ProductAppraisalCell.h"
#import "XHStarRateView.h"
#import "UIButton+ImageTitleSpacing.h"

@interface ProductAppraisalCell()<XHStarRateViewDelegate>

@property (nonatomic, strong) UIButton *headBtn ;
@property (nonatomic, strong) UILabel  *realNameLab;
@property (nonatomic, strong) UILabel  *moreBtn;
@property (nonatomic, strong) UIImageView   *middleImageView;
@property (nonatomic, strong) UILabel  *titleLab;
@property (nonatomic, strong) UILabel  *scoreLab;
@property (nonatomic, strong) UILabel  *subTitleLab;
@property (nonatomic, strong) UILabel  *timeLab;
@property (nonatomic, strong) UIButton *viewBtn;
@property (nonatomic, strong) UIButton   *commentBtn;

@end

@implementation ProductAppraisalCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self setLocationUI];
    }
    return self;
}

#pragma mark---设置UI
- (void)setLocationUI{
    
    [self.contentView addSubview:self.headBtn];
    [self.contentView addSubview:self.realNameLab];
    [self.contentView addSubview:self.middleImageView] ;
    [self.contentView addSubview:self.titleLab];
    [self.contentView addSubview:self.subTitleLab];
    [self.contentView addSubview:self.scoreLab];
    [self.contentView addSubview:self.timeLab];
    [self.contentView addSubview:self.viewBtn];
    [self.contentView addSubview:self.commentBtn];
    
    [self.headBtn mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.top.equalTo(self.contentView).offset(20);
        make.width.height.mas_equalTo(35);
        
    }];
    
    [self.realNameLab mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.centerY.equalTo(self.headBtn);
        make.left.equalTo(self.headBtn.mas_right).offset(10);
        
    }];
    
    [self.middleImageView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.top.equalTo(self.headBtn.mas_bottom).offset(15);
        make.left.equalTo(self.contentView).offset(20);
        make.right.equalTo(self.contentView).offset(-20);
        make.height.mas_equalTo(183);
        
    }];
    
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.middleImageView.mas_bottom).offset(15);
        make.left.equalTo(self.middleImageView);
        
    }];
    
    [self.subTitleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.titleLab.mas_bottom).offset(10);
        make.left.equalTo(self.titleLab);
        
    }];
    
    [self.timeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.bottom.equalTo(self.contentView).offset(-20);
        make.left.equalTo(self.subTitleLab);
        
    }];
    
    [self.commentBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.equalTo(self.timeLab);
        make.right.equalTo(self.contentView).offset(-20);
        make.width.mas_equalTo(50);
        make.height.mas_equalTo(20);
        
    }];
    
    [self.viewBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.equalTo(self.timeLab);
        make.right.equalTo(self.commentBtn.mas_left).offset(-10);
        make.width.mas_equalTo(50);
        make.height.mas_equalTo(20);
        
    }];
    
    UIView *line = [[UIView alloc]init];
    line.backgroundColor = HexColor(@"dcdcdc");
    [self.contentView addSubview:line];
    
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.height.mas_equalTo(0.5);
        make.left.bottom.right.equalTo(self.contentView);
        
    }];
    
    XHStarRateView *starRateView = [[XHStarRateView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - 80 - 20, 270, 80, 15)];
    starRateView.isAnimation = YES;
    starRateView.rateStyle = IncompleteStar;
    starRateView.tag = 1;
    starRateView.delegate = self;
    starRateView.currentScore = 4.0;
    [self.contentView addSubview:starRateView];
    
    [self.scoreLab mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.right.equalTo(starRateView.mas_left).offset(-10);
        make.centerY.equalTo(self.titleLab);
        
    }];
    
}

#pragma mark--懒加载
- (UIButton *)headBtn{
    
    if (!_headBtn) {
        _headBtn = [[UIButton alloc]init];
        _headBtn.layer.cornerRadius = 35/2.0;
        _headBtn.layer.masksToBounds = YES;
        _headBtn.backgroundColor = UIColor.lightGrayColor;
        
    }
    return _headBtn;
}

- (UILabel *)realNameLab{
    
    if (!_realNameLab) {
        _realNameLab = [[UILabel alloc]init];
        _realNameLab.font = Font16();
        _realNameLab.text = @"史蒂芬 · 陶";
        _realNameLab.textColor = UIColor.blackColor;
        
    }
    return _realNameLab;
}

- (UIImageView *)middleImageView{
    
    if (!_middleImageView) {
        _middleImageView = [[UIImageView alloc]init];
        _middleImageView.image = [UIImage imageNamed:@"markus-spiske-516263-unsplash"];
        _middleImageView.contentMode = UIViewContentModeScaleAspectFill;
        _middleImageView.clipsToBounds = YES;
        
        _middleImageView.layer.cornerRadius = 5;
        _middleImageView.layer.masksToBounds = YES;
    }
    
    return _middleImageView;
    
}

- (UILabel *)titleLab{
    
    if (!_titleLab) {
        _titleLab = [[UILabel alloc]init];
        _titleLab.textColor = UIColor.blackColor;
        _titleLab.font = Font18();
        _titleLab.text = @"AIRBOT问世";
        
    }
    return _titleLab;
}

- (UILabel *)subTitleLab{
    
    if (!_subTitleLab) {
        _subTitleLab = [[UILabel alloc]init];
        _subTitleLab.textColor = UIColor.grayColor;
        _subTitleLab.text = @"全球首个空气净化机器人";
        _subTitleLab.font = Font16();
    }
    return _subTitleLab;
}

- (UILabel *)scoreLab{
    
    if (!_scoreLab) {
        _scoreLab = [[UILabel alloc]init];
        _scoreLab.textColor = greenColor();
        _scoreLab.text = @"8.0";
        _scoreLab.font = Font26();
        
    }
    return _scoreLab;
}

- (UILabel *)timeLab{
    
    if (!_timeLab) {
        _timeLab = [[UILabel alloc]init];
        _timeLab.text = @"3分钟前 · 8分钟阅读";
        _timeLab.font = Font14();
        _timeLab.textColor = UIColor.grayColor;
        
    }
    return _timeLab;

}

- (UIButton *)viewBtn{
    
    if (!_viewBtn) {
        _viewBtn = [[UIButton alloc]init];
        [_viewBtn layoutButtonWithEdgeInsetsStyle:MKButtonEdgeInsetsStyleLeft imageTitleSpace:5];
        [_viewBtn setTitle:@"7.9k" forState:UIControlStateNormal];
        [_viewBtn setTitleColor:UIColor.grayColor forState:UIControlStateNormal];
        _viewBtn.titleLabel.font = Font12();
        
    }
    return _viewBtn;
    
}

- (UIButton *)commentBtn{
    
    if (!_commentBtn) {
        _commentBtn = [[UIButton alloc]init];
        [_commentBtn layoutButtonWithEdgeInsetsStyle:MKButtonEdgeInsetsStyleLeft imageTitleSpace:5];
        [_commentBtn setTitle:@"196" forState:UIControlStateNormal];
        [_commentBtn setTitleColor:UIColor.grayColor forState:UIControlStateNormal];
        _commentBtn.titleLabel.font = Font12();
    }
    return _commentBtn;
}

-(void)starRateView:(XHStarRateView *)starRateView currentScore:(CGFloat)currentScore{
    NSLog(@"%d----  %f",0,currentScore);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
