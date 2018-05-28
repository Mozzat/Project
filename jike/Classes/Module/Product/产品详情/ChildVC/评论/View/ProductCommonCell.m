//
//  ProductCommonCell.m
//  jike
//
//  Created by 上海荣豫资产 on 2018/5/25.
//  Copyright © 2018年 陶庭兴. All rights reserved.
//

#import "ProductCommonCell.h"
#import "XHStarRateView.h"

@interface ProductCommonCell()

@property (nonatomic, strong) UIButton *headBtn ;
@property (nonatomic, strong) UILabel  *realNameLab;
@property (nonatomic, strong) UILabel  *statusLab;
@property (nonatomic, strong) UIButton  *moreBtn;
@property (nonatomic, strong) UILabel  *timeLab;
@property (nonatomic, strong) UIButton *praiseBtn;
@property (nonatomic, strong) UILabel  *contetnLab;
@property (nonatomic, strong) UILabel  *countLab;
@property (nonatomic, strong) XHStarRateView *startView;

@end
@implementation ProductCommonCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self setLocationUI];
    }
    return self;
}

- (void)setLocationUI{
    
    [self.contentView addSubview:self.headBtn];
    [self.contentView addSubview:self.realNameLab];
    [self.contentView addSubview:self.statusLab];
    [self.contentView addSubview:self.moreBtn];
    [self.contentView addSubview:self.startView];
    [self.contentView addSubview:self.contetnLab];
    [self.contentView addSubview:self.timeLab];
    [self.contentView addSubview:self.praiseBtn];
    [self.contentView addSubview:self.countLab];
    
    [self.headBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.top.equalTo(self.contentView).offset(20);
        make.width.height.mas_equalTo(35);
        
    }];
    
    [self.realNameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.equalTo(self.headBtn);
        make.left.equalTo(self.headBtn.mas_right).offset(10);
        
    }];
    
    [self.moreBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.equalTo(self.headBtn);
        make.right.equalTo(self.contentView).offset(-20);
        make.width.height.mas_equalTo(20);
        
    }];
    
    [self.statusLab mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.equalTo(self.headBtn);
        make.right.equalTo(self.startView.mas_left).offset(-10);
        make.height.mas_equalTo(20);
        make.width.mas_equalTo(35);
        
    }];
    
    [self.contetnLab mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.top.equalTo(self.headBtn.mas_bottom).offset(20);
        make.left.equalTo(self.contentView).offset(20);
        make.right.equalTo(self.contentView).offset(-20);
        
    }];
    
    [self.timeLab mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.top.equalTo(self.contetnLab.mas_bottom).offset(20);
        make.left.equalTo(self.contentView).offset(20);
        make.bottom.equalTo(self.contentView).offset(-20);
        
    }];
    
    [self.countLab mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.centerY.equalTo(self.timeLab);
        make.right.equalTo(self.contentView).offset(-20);
        
    }];
    
    [self.praiseBtn mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.centerY.equalTo(self.countLab);
        make.width.height.mas_equalTo(20);
        make.right.equalTo(self.countLab.mas_left).offset(-10);
        
    }];
    
    UIView *line = [[UIView alloc]init];
    line.backgroundColor = UIColor.lightGrayColor;
    [self.contentView addSubview:line];
    
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.equalTo(self.contentView).offset(10);
        make.right.equalTo(self.contentView).offset(-10);
        make.bottom.equalTo(self.contentView);
        make.height.mas_equalTo(0.5);
        
    }];
    
}

#pragma mark---懒加载
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

- (UILabel *)statusLab{
    
    if (!_statusLab) {
        _statusLab = [[UILabel alloc]init];
        _statusLab.text = @"用过";
        [_statusLab rounded:4 width:0.5 color:UIColor.blackColor];
        _statusLab.textColor = UIColor.blackColor;
        _statusLab.textAlignment = NSTextAlignmentCenter;
        _statusLab.font = Font12();
    }
    
    return _statusLab;
    
}

- (UIButton *)moreBtn{
    
    if (!_moreBtn) {
        _moreBtn = [[UIButton alloc]init];
        _moreBtn.backgroundColor = UIColor.grayColor;
        
    }
    return _moreBtn;
    
}
- (UILabel *)contetnLab{
    
    if (!_contetnLab) {
        _contetnLab = [[UILabel alloc]init];
        _contetnLab.numberOfLines = 0;
        _contetnLab.font = Font15();
        _contetnLab.text = @"选择自己的路就走下去吧选择自己的路就走下去吧选择自己的路就走下去吧选择自己的路就走下去吧选择自己的路就走下去吧选择自己的路就走下去吧选择自己的路就走下去吧";
        
    }
    return _contetnLab;
}

- (UILabel *)timeLab{
    
    if (!_timeLab) {
        _timeLab = [[UILabel alloc]init];
        _timeLab.textColor = UIColor.lightGrayColor;
        _timeLab.text = @"2018-04-08";
    }
    return _timeLab;
}

- (UIButton *)praiseBtn{
    
    if (!_praiseBtn) {
        _praiseBtn = [[UIButton alloc]init];
        _praiseBtn.backgroundColor = UIColor.grayColor;
        
    }
    
    return _praiseBtn;
}

- (UILabel *)countLab{
    
    if (!_countLab) {
        _countLab = [[UILabel alloc]init];
        _countLab.textColor = UIColor.lightGrayColor;
        _countLab.font = Font14();
        _countLab.text = @"7.3k";
    }
    return _countLab;
}

- (XHStarRateView *)startView{
    
    if (!_startView) {
        _startView =  [[XHStarRateView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - 20 - 20 - 10 - 80, 30, 80, 15) numberOfStars:5 rateStyle:HalfStar isAnination:YES finish:^(CGFloat currentScore) {
            
        }];
        _startView.currentScore = 4.0;
        _startView.userInteractionEnabled = 0;
    }
    
    return _startView;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
