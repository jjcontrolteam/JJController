//
//  IconSelectionViewController.m
//  JJControl
//
//  Created by YvanWang on 2018/4/7.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "IconSelectionViewController.h"

@interface IconSelectionViewController ()<UITableViewDelegate, UITableViewDataSource>{
    DeviceModel *_deviceModel;
}
@property (nonatomic, strong) UITextField *textFieldName;
@end

@implementation IconSelectionViewController

- (instancetype)initWithModel:(DeviceModel *)deviceModel{
    if(self = [super init]){
        _deviceModel = deviceModel;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"图标选择";
    
    self.view.backgroundColor = [UIColor redColor];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"确定" style:UIBarButtonItemStyleDone target:self action:@selector(ensureTapped)];
    
    UITableView *myTableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    myTableView.backgroundColor = [UIColor whiteColor];
    myTableView.estimatedRowHeight = 100;
    myTableView.delegate = self;
    myTableView.dataSource = self;
    [myTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:identifier];
    [self.view addSubview:myTableView];
    
    [self.textFieldName resignFirstResponder];
}

- (void)ensureTapped{
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if(section == 0)
        return @"图标";
    else
        return @"名称";
}

static NSString *identifier = @"Identifier";
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    
    for(UIView *view in cell.contentView.subviews){
        [view removeFromSuperview];
    }
    if(indexPath.section == 0){
        //图标切换
        UIImageView *imgViewOrigin = [[UIImageView alloc] init];
        imgViewOrigin.translatesAutoresizingMaskIntoConstraints = NO;
        imgViewOrigin.backgroundColor = [UIColor redColor];
        imgViewOrigin.image = [UIImage imageNamed:_deviceModel.pic];
        [cell.contentView addSubview:imgViewOrigin];
        
        [imgViewOrigin mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(cell.contentView).offset(CELL_TOP_MARGIN);
            make.bottom.mas_equalTo(cell.contentView).offset(-CELL_BOTTOM_MARGIN);
            make.left.mas_equalTo(cell.contentView).offset(4 * CELL_LEFT_MARGIN);
            make.width.height.equalTo(@100);
        }];
        
        UIImageView *imgViewNew = [[UIImageView alloc] init];
        imgViewNew.translatesAutoresizingMaskIntoConstraints = NO;
        imgViewNew.backgroundColor = [UIColor blueColor];
        [cell.contentView addSubview:imgViewNew];
        
        [imgViewNew mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(imgViewOrigin);
            make.top.bottom.mas_equalTo(imgViewOrigin);
            make.right.mas_equalTo(cell.contentView).offset(- 4 * CELL_RIGHT_MARGIN);
        }];
        
    }else{
        //名称更改
        [cell.contentView addSubview:self.textFieldName];
        self.textFieldName.text =_deviceModel.title;

        NSString *notice = @"设备名称补课增加房间名前缀，系统可自动归类生成。如“空调”√ “客厅空调X“";
        CGSize noticeSize = [notice boundingRectWithSize:CGSizeMake(SCREEN_WIDTH / 4.0 * 3, CGFLOAT_MAX) options:NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15.0f]} context:nil].size;
        UILabel *lbNotice = [[UILabel alloc] init];
        lbNotice.translatesAutoresizingMaskIntoConstraints = NO;
        lbNotice.font = [UIFont systemFontOfSize:15.0f];
        lbNotice.text = notice;
        lbNotice.numberOfLines = 0;
        [cell.contentView addSubview:lbNotice];
        
        [self.textFieldName mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(cell.contentView);
            make.left.mas_equalTo(cell.contentView).offset(2 * CELL_LEFT_MARGIN);
            make.right.mas_equalTo(cell.contentView).offset(-CELL_RIGHT_MARGIN);
            make.height.equalTo(@50);
        }];
        
        [lbNotice mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.textFieldName.mas_bottom);
            make.bottom.mas_equalTo(cell.contentView).offset(-CELL_BOTTOM_MARGIN);
            make.left.mas_equalTo(self.textFieldName);
            make.size.equalTo(@(noticeSize));
        }];
    }
    return cell;
}

- (UITextField *)textFieldName{
    if(!_textFieldName){
        _textFieldName = [[UITextField alloc] init];
        _textFieldName.translatesAutoresizingMaskIntoConstraints = NO;
        _textFieldName.placeholder = @"请输入姓名";
        _textFieldName.textColor = [UIColor blackColor];
    }
    return _textFieldName;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
