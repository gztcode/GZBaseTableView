//
//  SingleViewController.m
//  GZBaseTableView
//
//  Created by aten07 on 2017/2/28.
//  Copyright © 2017年 GZT. All rights reserved.
//

#import "SingleViewController.h"
#import "UIViewController+GZAdd.h"
#import "TableViewCell.h"
@interface SingleViewController ()

@end

@implementation SingleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSMutableArray * array2 = [NSMutableArray array];
    for (int ae =0; ae < 30; ae++) {
        [array2 addObject:[NSString stringWithFormat:@"%d",ae]];
        
    }
    NSDictionary * dic =@{array2:CELLSTR(TableViewCell)};
    //单个cell 的使用方法
    [self addTableView:self.view.frame dicCellModel:dic];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)dealloc{
    NSLog(@"%@",self.gztableView);
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
