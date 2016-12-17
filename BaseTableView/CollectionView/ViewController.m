//
//  ViewController.m
//  CollectionView
//
//  Created by aten07 on 2016/12/9.
//  Copyright © 2016年 aten07. All rights reserved.
//

#import "ViewController.h"
#import "WBViewController.h"
#import "TableViewCell.h"
#import "UIViewController+GZAdd.h"

@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"tableView" style:UIBarButtonItemStyleDone target:self action:@selector(weiboTwo:)];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


- (UIViewController*)viewController:(UIView *)view {
        UIResponder* nextResponder = [view nextResponder];
        if ([[view nextResponder] isKindOfClass:[UIViewController class]]) {
            return (UIViewController*)nextResponder;
        }
    
    return nil;
}

- (void)weiboTwo:(id)sender{
   
	[self.navigationController pushViewController:[WBViewController new] animated:YES];
}

@end
