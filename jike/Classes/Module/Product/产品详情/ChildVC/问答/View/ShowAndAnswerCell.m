//
//  ShowAndAnswerCell.m
//  jike
//
//  Created by 上海荣豫资产 on 2018/5/25.
//  Copyright © 2018年 陶庭兴. All rights reserved.
//

#import "ShowAndAnswerCell.h"

@interface ShowAndAnswerCell()

@property (nonatomic, strong) UILabel   *questionLab;
@property (nonatomic, strong) UILabel   *anserLab;
@property (nonatomic, strong) UIButton   *askBtn;

@end
@implementation ShowAndAnswerCell

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

#pragma mark--设置UI
- (void)setLocationUI{
    
    UILabel *label1 = [[UILabel alloc]init];
    label1.textColor = whiteColor();
    label1.text = @"问";
    label1.backgroundColor = HexColor(@"EEB251");
    label1.layer.cornerRadius = 3;
    label1.layer.masksToBounds = YES;
    label1.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:label1];
    
    [label1 mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.top.left.equalTo(self.contentView).offset(20);
        make.width.height.mas_equalTo(35);
        
    }];
    
    [self.contentView addSubview:self.questionLab];
    [self.questionLab mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.top.equalTo(label1).offset(10);
        make.left.equalTo(label1.mas_right).offset(10);
        make.right.equalTo(self.contentView).offset(-10);
        make.height.lessThanOrEqualTo(@40);
        
    }];
    
    UILabel *label2 = [[UILabel alloc]init];
    label2.textColor = whiteColor();
    label2.text = @"答";
    label2.backgroundColor = greenColor();
    label2.layer.cornerRadius = 3;
    label2.layer.masksToBounds = YES;
    label2.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:label2];
    
    [label2 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.contentView).offset(20);
        make.top.equalTo(self.questionLab.mas_bottom).offset(6);
        make.width.height.mas_equalTo(35);
        
    }];
    
    [self.contentView addSubview:self.anserLab];
    [self.anserLab mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.top.equalTo(label2).offset(10);
        make.left.equalTo(label2.mas_right).offset(10);
        make.right.equalTo(self.contentView).offset(-10);
        
    }];
    
    [self.contentView addSubview:self.askBtn];
    [self.askBtn mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.equalTo(self.anserLab);
        make.top.equalTo(self.anserLab.mas_bottom).offset(20);
        make.height.mas_equalTo(20);
        make.bottom.equalTo(self.contentView).offset(-20);
        
    }];
    
}


#pragma mark---懒加载
- (UILabel *)questionLab{
    
    if (!_questionLab) {
        _questionLab = [[UILabel alloc]init];
        _questionLab.text = @"美团机器人怎么送外卖美团机器人怎么送外卖美团机器人怎么送外卖美团机器人怎么送外卖美团机器人怎么送外卖美团机器人怎么送外卖美团机器人怎么送外卖?";
        _questionLab.numberOfLines = 0;
        _questionLab.font = Font16();
        _questionLab.textColor = UIColor.blackColor;
        
    }
    return _questionLab;
    
}

- (UILabel *)anserLab{
    
    if (!_anserLab) {
        _anserLab = [[UILabel alloc]init];
        _anserLab.textColor= UIColor.grayColor;
        _anserLab.text = @"按照官方的说法，分数水电费水电费胜多负少打法是否打算打发斯蒂芬是否是是的发送到发士大夫撒飞洒发阿斯顿发顺丰阿斯蒂芬阿萨德法师打发斯蒂芬阿士大夫撒地方是打发斯蒂芬阿斯蒂芬阿萨德";
        _anserLab.numberOfLines = 0;
    }
    return _anserLab;
}

- (UIButton *)askBtn{
    
    if (!_askBtn) {
        _askBtn = [[UIButton alloc]init];
        [_askBtn setTitle:@"我要回答>" forState:UIControlStateNormal];
        [_askBtn setTitleColor:greenColor() forState:UIControlStateNormal];
        
    }
    return _askBtn;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
