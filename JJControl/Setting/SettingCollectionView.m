//
//  SettingCollectionView.m
//  JJControl
//
//  Created by YvanWang on 2018/3/21.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "SettingCollectionView.h"
#import "SettingDataDelegate.h"
#import "SettingCollectionViewCell.h"
#import "SettingDataSource.h"
#import "InfoCollectionViewCell.h"
#import "SpanCollectionViewCell.h"


@interface SettingCollectionView(){
    SettingDataSource *_dataSource;
    BaseDataDelegate *_delegate;
}
@property (nonatomic, strong) NSMutableArray *array;
@end

@implementation SettingCollectionView

- (void)buildUI:(id)myDataSourceBlock withHeaderBlock:(id)headerBlock withFooterBlock:(id)footerBlock withDelegate:(id)myDelegateBlock{
    
    self.backgroundColor = [UIColor whiteColor];

    [self registerClass:[SettingCollectionViewCell class] forCellWithReuseIdentifier:settingIdentifier];
    [self registerClass:[SpanCollectionViewCell class] forCellWithReuseIdentifier:spanIdentifier];
    [self registerClass:[InfoCollectionViewCell class] forCellWithReuseIdentifier:infoIdentifier];

    _dataSource = [[SettingDataSource alloc] initWithItems:self.array cellIdentifier:settingIdentifier andCellBack:myDataSourceBlock];
    self.dataSource = _dataSource;
    
    _delegate = [[SettingDataDelegate alloc] initWithItems:self.array andCallBack:myDelegateBlock];
    self.delegate = _delegate;
}

- (void)bindCell:(id)cell withData:(id)data withIndexPath:(NSIndexPath *)indexPath{
    SettingCollectionViewCell *newCell = (SettingCollectionViewCell *)cell;
    
    [newCell setCellData:data];
}

- (void)chooseCell:(id)data{
    if(self.block){
        self.block();
    }
}

- (NSMutableArray *)array{
    //span为空格
    return [NSMutableArray arrayWithArray:@[@"信息",@"span", @"消息", @"摇一摇", @"span", @"设备", @"密码", @"通用", @"反馈"]];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
