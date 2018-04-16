//
//  LinkageTipsReusableView.m
//  JJControl
//
//  Created by admin on 2018/4/15.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "LinkageTipsReusableView.h"

@implementation LinkageTipsReusableView
- (instancetype)initWithFrame:(CGRect)frame{
    if(self = [super initWithFrame:frame]){
        [self setBackgroundColor:[UIColor whiteColor]];
        UILabel *tmplbName =[[UILabel alloc]initWithFrame:CGRectMake(CELL_INNER_MARGIN, 2, self.frame.size.width-2*CELL_INNER_MARGIN, 66)];
        [self addSubview:tmplbName];
        [tmplbName setTextAlignment:NSTextAlignmentLeft];
        [tmplbName setFont:[UIFont systemFontOfSize:14]];
        [tmplbName setTextColor:[UIColor blackColor]];
        self.lbName=tmplbName;
        _lbName.lineBreakMode = NSLineBreakByWordWrapping;
        _lbName.numberOfLines=0;
       /* [_lbName mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(@2);
            make.height.mas_equalTo(@66);
            make.left.mas_equalTo(@CELL_INNER_MARGIN);
        }];*/
        
    }
    return self;
}
- (void)setData:(NSDictionary *)data{
    
     [_lbName setText:[data valueForKey:@"name"]];
}
@end
