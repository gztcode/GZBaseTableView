//
//  ViewController.m
//  GZBaseTableView
//
//  Created by aten07 on 2017/2/28.
//  Copyright © 2017年 GZT. All rights reserved.
//

#import "ViewController.h"
#import "UIViewController+GZAdd.h"
#import "XibTableViewCell.h"
#import "TableViewCell.h"

@interface ViewController ()
#warning 在不是使用Xib文件时要删除awakeFromNib方法
@end


@implementation ViewController{
    NSMutableArray * arr;
    NSArray * array;
    NSDictionary * dic;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    NSMutableArray * array1 = [NSMutableArray array];
    for (int ae =0; ae < 20; ae++) {
        [array1 addObject:[NSString stringWithFormat:@"%d",ae]];
    }
    NSMutableArray * array2 = [NSMutableArray array];
    for (int ae =0; ae < 30; ae++) {
        [array2 addObject:[NSString stringWithFormat:@"%d",ae]];
        
    }
    
    NSMutableArray * array3 = [NSMutableArray array];
    for (int ae =40; ae < 100; ae++) {
        [array3 addObject:[NSString stringWithFormat:@"%d",ae]];
        
    }
    
    
    arr =[NSMutableArray arrayWithCapacity:0];
    [arr addObject:array1];
    [arr addObject:array2];
    [arr addObject:array3];
    
    
    dic =@{array2:CELLSTR(TableViewCell)};
    
    array =@[CELLSTR(TableViewCell),CELLSTR(XibTableViewCell),CELLSTR(TableViewCell)];
    
    //多个cell
    [self addTableView:self.view.frame multipleCellOnModel:@{arr:array}];
    
   
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end
