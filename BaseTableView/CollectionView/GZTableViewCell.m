//
//  GZTableViewCell.m
//  GZTableView
//
//  Created by aten07 on 2017/2/16.
//  Copyright © 2017年 aten07. All rights reserved.
//

#import "GZTableViewCell.h"
#import "UIViewController+GZAdd.h"

@implementation GZTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(CGFloat)modelCellOrHeight:(id)cellModel cellIndex:(NSIndexPath *)indexPath{
    self.labeltext.text = cellModel;
    return 0;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
