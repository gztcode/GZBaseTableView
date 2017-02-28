//
//  XibTableViewCell.m
//  GZBaseTableView
//
//  Created by aten07 on 2017/2/28.
//  Copyright © 2017年 GZT. All rights reserved.
//

#import "XibTableViewCell.h"

@implementation XibTableViewCell
//返回高度 0 为默认
-(CGFloat)modelCellOrHeight:(id)cellModel cellIndex:(NSIndexPath *)indexPath{
    self.labeltext.text = cellModel;
    return 0;
}
//使用Xib必须要写这个方法
-(void)awakeFromNib{
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
