//
//  TableViewCell.m
//  GZBaseTableView
//
//  Created by aten07 on 2017/2/28.
//  Copyright © 2017年 GZT. All rights reserved.
//

#import "TableViewCell.h"
#import "UIViewController+GZAdd.h"

@implementation TableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        UIButton * btn =[UIButton new];
        [btn setBackgroundColor:[UIColor redColor]];
        [btn addTarget:self action:@selector(abc:) forControlEvents:UIControlEventTouchUpInside];
        self.btnss = btn;
        [self addSubview:btn];
        
    }
    return self;
}

-(CGFloat)modelCellOrHeight:(id)cellModel cellIndex:(NSIndexPath *)indexPath{
    self.btnss.frame =CGRectMake(100, 0, 100, 40);
    [self.btnss setTitle:cellModel forState:UIControlStateNormal];
    return 100;
}


- (void)abc:(UIButton *)sender{
    
    if ([self.delegate respondsToSelector:@selector(tableViweCellClick:model:)]) {
        [self.delegate tableViweCellClick:sender model:nil];
    }
    
}




@end
