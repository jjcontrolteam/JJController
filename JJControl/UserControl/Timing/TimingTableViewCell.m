//
//  TimingTableViewCell.m
//  JJControl
//
//  Created by YvanWang on 2018/4/7.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "TimingTableViewCell.h"
#import "AllTimingModel.h"

@interface TimingTableViewCell(){
    UILabel *_firstStateLabel, *_secondStateLabel;
    UILabel *_firstTimeLabel, *_secondTimeLabel;

    UISwitch *_enableSwitch;
    UILabel *_repeatTimeLabel;
}
@end

@implementation TimingTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        [self createSubviews];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)createSubviews{
    //第一行
    _firstStateLabel = [[UILabel alloc] init];
    _firstStateLabel.text = @"打开";
    [self.contentView addSubview:_firstStateLabel];
    [_firstStateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.contentView).offset(CELL_LEFT_MARGIN);
        make.left.mas_equalTo(self.contentView).offset(CELL_LEFT_MARGIN * 2);
        make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH / 4.0, 45));
    }];
    
    _firstTimeLabel = [[UILabel alloc] init];
    _firstTimeLabel.text = @"17:02";
    _firstTimeLabel.backgroundColor = [UIColor redColor];
    [self.contentView addSubview:_firstTimeLabel];
    [_firstTimeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_firstStateLabel);
        make.centerX.mas_equalTo(self.contentView).offset(-20);
        make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH / 4.0, 45));
    }];
    
    //第二行
    _secondStateLabel = [[UILabel alloc] init];
    _secondStateLabel.text = @"关闭";
    [self.contentView addSubview:_secondStateLabel];
    [_secondStateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_firstStateLabel);
        make.top.mas_equalTo(_firstStateLabel.mas_bottom).offset(CELL_INNER_MARGIN);
        make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH / 4.0, 45));
    }];
    
    _secondTimeLabel = [[UILabel alloc] init];
    _secondTimeLabel.text = @"17:07";
    _secondTimeLabel.backgroundColor = [UIColor blueColor];
    [self.contentView addSubview:_secondTimeLabel];
    [_secondTimeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_secondStateLabel);
        make.size.centerX.mas_equalTo(_firstTimeLabel);
    }];

    //次数
    _repeatTimeLabel = [[UILabel alloc]init];
    _repeatTimeLabel.text = @"单次";
    [self.contentView addSubview:_repeatTimeLabel];
    [_repeatTimeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_secondStateLabel);
        make.top.mas_equalTo(_secondStateLabel.mas_bottom).offset(CELL_INNER_MARGIN);
        make.bottom.mas_equalTo(self.contentView).offset(-CELL_BOTTOM_MARGIN);
        make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH - CELL_RIGHT_MARGIN, 45));
    }];

    _enableSwitch = [[UISwitch alloc] init];
    [self.contentView addSubview:_enableSwitch];
    [_enableSwitch addTarget:self action:@selector(switchChanged:) forControlEvents:UIControlEventValueChanged];
    [_enableSwitch mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.contentView).offset(-CELL_RIGHT_MARGIN);
        make.centerY.mas_equalTo(self.contentView);
        make.size.mas_equalTo(CGSizeMake(60, 30));
    }];
}

- (void)setData:(AllTimingModel *)data{
    
}

- (void)switchChanged:(UISwitch *)swith{
    self.data.isEnable = swith.isOn;
}

@end
