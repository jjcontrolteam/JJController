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
#import "BaseDataSource.h"

@interface SettingCollectionView(){
    BaseDataSource *_dataSource;
    BaseDataDelegate *_delegate;
}

@end

static NSString *identifier = @"SettingCollectionViewCell";


@implementation SettingCollectionView

- (void)buildUI:(id)myDataSourceBlock withHeaderBlock:(id)headerBlock withFooterBlock:(id)footerBlock withDelegate:(id)myDelegateBlock{
    [self setBackgroundColor:[UIColor redColor]];
    [self registerClass:[SettingCollectionViewCell class] forCellWithReuseIdentifier:identifier];
    
    NSMutableArray *array = [[NSMutableArray alloc] init];

    _dataSource = [[BaseDataSource alloc] initWithItems:@[@"信息", @"消息", @"摇一摇", @"设备", @"密码", @"通用", @"反馈"] cellIdentifier:identifier  andCellBack:myDataSourceBlock];
    self.dataSource = _dataSource;
    
    _delegate = [[SettingDataDelegate alloc] initWithItems:@[@"信息", @"消息", @"摇一摇", @"设备", @"密码", @"通用", @"反馈"] andCallBack:myDelegateBlock];
    self.delegate = _delegate;
}

-(void)bindCell:(id)cell withData:(id)data withIndexPath:(NSIndexPath *)indexPath{
    SettingCollectionViewCell *newCell = (SettingCollectionViewCell *)cell;
    [newCell setData:data];
}

- (void)chooseCell:(id)data{
    if(self.block){
        self.block();
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
