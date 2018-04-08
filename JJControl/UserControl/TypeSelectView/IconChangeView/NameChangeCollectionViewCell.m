//
//  NameChangeCollectionViewCell.m
//  JJControl
//
//  Created by admin on 08/04/2018.
//  Copyright © 2018 admin. All rights reserved.
//

#import "NameChangeCollectionViewCell.h"
#import "DeviceModel.h"

@interface NameChangeCollectionViewCell (){
    UITextField *_textFieldName;
 }

@end

@implementation NameChangeCollectionViewCell
 
- (instancetype)initWithFrame:(CGRect)frame{
    if(self = [super initWithFrame:frame]){
        [self createSubviews];
    }
    return self;
}

- (void)createSubviews{
    self.backgroundColor = [UIColor whiteColor];
    _textFieldName = [[UITextField alloc] init];
    _textFieldName.translatesAutoresizingMaskIntoConstraints = NO;
    _textFieldName.placeholder = @"请输入姓名";
    _textFieldName.textColor = [UIColor blackColor];
    [self.contentView addSubview:_textFieldName];
    
    //换行 无需计算高度
//    lbNotice.preferredMaxLayoutWidth = SCREEN_WIDTH - 4 * CELL_LEFT_MARGIN;
//    [lbNotice setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisVertical];
//
    NSString *notice = @"设备名称补课增加房间名前缀，系统可自动归类生成。\n如“空调”√ “客厅空调X“";
    UILabel *lbNotice = [[UILabel alloc] init];
    lbNotice.preferredMaxLayoutWidth = SCREEN_WIDTH - 4 * CELL_LEFT_MARGIN;
    [lbNotice setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisVertical];
    lbNotice.translatesAutoresizingMaskIntoConstraints = NO;
    lbNotice.font = [UIFont systemFontOfSize:16.0f];
    lbNotice.text = notice;
    lbNotice.numberOfLines = 0;
    [self.contentView addSubview:lbNotice];

    [_textFieldName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.contentView).offset(CELL_TOP_MARGIN);
        make.height.mas_equalTo(@50);
        make.left.mas_equalTo(self.contentView).offset(2 * CELL_LEFT_MARGIN);
        make.width.mas_equalTo(SCREEN_WIDTH - 4 * CELL_LEFT_MARGIN);
    }];

    [lbNotice mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_textFieldName.mas_bottom).offset(CELL_INNER_MARGIN);
        make.bottom.mas_equalTo(self.contentView).offset(-CELL_BOTTOM_MARGIN);
        make.left.mas_equalTo(_textFieldName);
    }];
}

- (void)setCellData:(DeviceModel *)cellData{
    _textFieldName.text = cellData.title;
}
@end
