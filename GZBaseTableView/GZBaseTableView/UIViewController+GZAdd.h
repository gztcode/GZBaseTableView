//
//  UIViewController+GZAdd.h
//  CollectionView
//
//  Created by aten07 on 2016/12/13.
//  Copyright © 2016年 aten07. All rights reserved.
//

#import <UIKit/UIKit.h>

#define CELLSTR(Cell) NSStringFromClass([Cell class])
#define WeakSelf __weak typeof(self) weakSelf = self;
@protocol UITableViewCellDelegate <NSObject>
@optional
/**
 事件的代理方法

 @param sender 响应者
 @param cellModel 当前cell的Model
 */
-(void)tableViweCellClick:(id)sender model:(id)cellModel;

@end

@interface UITableViewCell (GZAdd)

/**
 做数据传输，必须实现！返回0为默认高度
 
 @param cellModel Model
 @return 高度
 */
-(CGFloat)modelCellOrHeight:(id)cellModel cellIndex:(NSIndexPath *)indexPath;

@property (nonatomic, weak) id<UITableViewCellDelegate> delegate;

@end
@interface GZTabeleView : UIView<UITableViewDataSource,UITableViewDelegate,UITableViewCellDelegate>
@property(nonatomic,strong,readonly) UITableView * tableView;
@property(nonatomic,strong,readonly) NSMutableArray * cellNameArray;
@property(nonatomic,strong,readonly) NSMutableArray * modelArray;

@end

@interface UIViewController (GZAdd)<UITableViewCellDelegate>

@property (nonatomic, strong) GZTabeleView *gztableView;

/**
 应用于单一的cell对Model__数据为Key，cell为Value
 @param rect fremo
 @param dic key（Model）
 */
-(void)addTableView:(CGRect)rect dicCellModel:(NSDictionary *)dic;

/**
 应用于多个cell对应多个Model__以Model数组为Key Cell数组为Value.
 */
- (void)addTableView:(CGRect)rect multipleCellOnModel:(NSDictionary *)dic;



/**
 单表刷新__数据为Key，cell为Value
 @param dic 得到的数据
 */
- (void)refreshHeaderModel:(NSDictionary *)dic;
/**
 多Cell刷新__以Model数组为Key Cell数组为Value.
 @param dic 数据
 */
- (void)refreshHeaderMultipleModel:(NSDictionary *)dic;


/**
 上拉刷新__以Model数组为Key 最后一个Cell为Value.
 @param dic 数据
 */
- (void)refreshFooterModel:(NSDictionary *)dic;


@end
