//
//  WBViewController.m
//  CollectionView
//
//  Created by aten07 on 2016/12/12.
//  Copyright © 2016年 aten07. All rights reserved.
//

#import "WBViewController.h"
#import "TableViewCell.h"
#import "KMCGeigerCounter.h"
#import "GZTableViewCell.h"

@interface WBViewController ()
{
    NSMutableArray * arr;
    NSArray * array;
}
@end

@implementation WBViewController


- (void)viewDidLoad {
    [super viewDidLoad];
 
    
    
    #if TARGET_IPHONE_SIMULATOR
        [KMCGeigerCounter sharedGeigerCounter].enabled = YES;
    #endif
    
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
    
    
    NSDictionary * dic =@{array2:CELLSTR(TableViewCell)};
    
    array =@[CELLSTR(TableViewCell),CELLSTR(GZTableViewCell),CELLSTR(TableViewCell)];
    
//    [self addTableView:self.view.bounds dicCellModel:dic];
    [self addTableView:self.view.bounds multipleCellOnModel:@{arr:array}];
    
    
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"刷新" style:UIBarButtonItemStyleDone target:self action:@selector(shuxin:)];
}




-(void)dealloc{
    NSLog(@"释放");
}

-(void)tableViweCellClick:(id)sender model:(id)cellModel{
    NSLog(@"%@___%@",sender,cellModel);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
  
}

- (void)shuxin:(id)sender {
    NSMutableArray * array3 = [NSMutableArray array];
    for (int ae =100; ae < 170; ae++) {
        [array3 addObject:[NSString stringWithFormat:@"%d",ae]];
        
    }
    [arr replaceObjectAtIndex:1 withObject:array3];
    [self refreshHeaderMultipleModel:@{arr:array}];
//    [self refreshFooterModel:@{array3:CELLSTR(TableViewCell)}];
    NSDictionary * dic =@{array3:CELLSTR(TableViewCell)};
//    [self refreshHeaderModel:dic];
    
    
    
    
}

@end
