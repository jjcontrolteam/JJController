//
//  PickerViewController.m
//  JJControl
//
//  Created by YvanWang on 2018/4/6.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "PickerViewController.h"

@interface PickerViewController ()<UITableViewDelegate, UITableViewDataSource>{
    NSString *_title;
    NSString *_selectItem;
    NSArray *_array;
}
@property (nonatomic, strong) NSMutableArray *selectArray;
@end

@implementation PickerViewController

- (instancetype)initWithTitle:(NSString *)title selectItem:(NSString *)selectItem
                        array:(NSArray *)array{
    if(self = [super init]){
        _title = title;
        _selectItem = selectItem;
        _array = array;
        _pickerViewType = PickerViewTypeSingle;
        _selectArray = [[NSMutableArray alloc] initWithCapacity:_array.count];
        for (NSInteger i = 0; i < _array.count; i++) {
            if(_array[i] == selectItem){
                _selectArray[i] = @YES;
            }else{
                _selectArray[i] = @NO;
            }
        }
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = _title;
    self.view.backgroundColor = [UIColor grayColor];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStyleDone target:self action:@selector(cancel)];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"确定" style:UIBarButtonItemStyleDone target:self action:@selector(ensure)];
    
    UITableView *tableView = [[UITableView alloc] init];
    tableView.dataSource = self;
    tableView.delegate = self;
    tableView.rowHeight = 45;
    tableView.backgroundColor = [UIColor redColor];
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellIdentifier];
    [self.view addSubview:tableView];
    
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self.view);
        make.top.equalTo(@(self.navigationItem.titleView.frame.size.height));
        make.bottom.mas_equalTo(self.view);
    }];
}

- (void)ensure{
    NSMutableArray *sectionArray = [[NSMutableArray alloc] init];
    [self.selectArray enumerateObjectsUsingBlock:^(NSNumber *boolNumber, NSUInteger idx, BOOL * _Nonnull stop) {
        if([boolNumber boolValue])
        [sectionArray addObject:@(idx)];
    }];
    
    if(self.selectionBlock){
        self.selectionBlock(sectionArray);
    }
    [self cancel];
}

- (void)cancel{

    [self dismissViewControllerAnimated:YES completion:nil];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _array.count;
}

static NSString *cellIdentifier = @"cellIdentifier";
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    for (UIView *view in cell.contentView.subviews) {
        [view removeFromSuperview];
    }
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 0, 200, 45)];
    titleLabel.text = _array[indexPath.row];
    titleLabel.textColor = [UIColor blackColor];
    [cell.contentView addSubview:titleLabel];

    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - 100, 10, 25, 25)];
    [cell.contentView addSubview:imageView];

    if([[_selectArray objectAtIndex:indexPath.row] boolValue]){
        imageView.image = [UIImage imageNamed:@"JJControlResource.bundle/bind.png"];
    }else{
        imageView.image = nil;
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if(self.pickerViewType == PickerViewTypeSingle){
        for (NSInteger i = 0; i < _array.count; i++) {
            if(i == indexPath.row){
                _selectArray[i] = @YES;
            }else{
                _selectArray[i] = @NO;
            }
        }
    }else{
        if([_selectArray[indexPath.row] boolValue]){
            _selectArray[indexPath.row] = @NO;
        }else{
            _selectArray[indexPath.row] = @YES;
        }
    }
    [tableView reloadData];
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
