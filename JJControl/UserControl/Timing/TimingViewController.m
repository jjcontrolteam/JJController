//
//  TimingViewController.m
//  JJControl
//
//  Created by YvanWang on 2018/4/7.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "TimingViewController.h"
#import "TimingTableViewCell.h"
#import "AllTimingModel.h"
#import "EditTimingViewController.h"

@interface TimingViewController ()<UITableViewDelegate, UITableViewDataSource>{

}

@property (nonatomic, strong)   NSMutableArray *timingItems;

@end

@implementation TimingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title =@"定时";
    self.view.backgroundColor = [UIColor redColor];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"增加" style:UIBarButtonItemStyleDone target:self action:@selector(addButtonTapped)];
    
    UITableView *myTableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    myTableView.backgroundColor = [UIColor whiteColor];
    myTableView.estimatedRowHeight = 100;
    myTableView.delegate = self;
    myTableView.dataSource = self;
    [myTableView registerClass:[TimingTableViewCell class] forCellReuseIdentifier:identifier];
    [self.view addSubview:myTableView];
    
}

static NSString *identifier = @"TimingTableViewCell";
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.timingItems.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TimingTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [cell setData:[self.timingItems objectAtIndex:indexPath.row]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    EditTimingViewController * editTimingVC =[[EditTimingViewController alloc] init];
    editTimingVC.timingType = TimingTypeEdit;
    [self.navigationController pushViewController:editTimingVC animated:YES];
    
}

- (void)addButtonTapped{
    EditTimingViewController * editTimingVC =[[EditTimingViewController alloc] init];
    editTimingVC.timingType = TimingTypeAdd;
    [self.navigationController pushViewController:editTimingVC animated:YES];
}

- (NSMutableArray *)timingItems{
    if(!_timingItems){
        _timingItems = [[NSMutableArray alloc] init];
        AllTimingModel *firstAllTimingModel = [[AllTimingModel alloc] init];
        AllTimingModel *secondAllTimingModel = [[AllTimingModel alloc] init];
        [_timingItems addObject:firstAllTimingModel];
        [_timingItems addObject:secondAllTimingModel];
    }
    return _timingItems;
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
