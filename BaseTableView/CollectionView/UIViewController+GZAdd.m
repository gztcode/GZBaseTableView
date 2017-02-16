//
//  UIViewController+GZAdd.m
//  CollectionView
//
//  Created by aten07 on 2016/12/13.
//  Copyright © 2016年 aten07. All rights reserved.
//

#import "UIViewController+GZAdd.h"
#import <objc/runtime.h>

@implementation UITableViewCell (GZAdd)

-(CGFloat)modelCellOrHeight:(id)cellModel cellIndex:(NSIndexPath *)indexPath{
    return 0;
}

-(void)setDelegate:(id<UITableViewCellDelegate>)delegate{
    objc_setAssociatedObject(self, @selector(delegate), delegate, OBJC_ASSOCIATION_ASSIGN);
}

-(id<UITableViewCellDelegate>)delegate{
    return objc_getAssociatedObject(self, _cmd);
}

@end
@interface GZTabeleView : UIView<UITableViewDataSource,UITableViewDelegate,UITableViewCellDelegate>
{
    float _cellHeight;
}
@property(nonatomic,strong) UITableView * tableView;
@property(nonatomic,strong) NSMutableArray * cellNameArray;
@property(nonatomic,strong) NSMutableArray * modelArray;
@end

@implementation GZTabeleView

-(UITableView *)tableView{
    if (_tableView == nil) {
        _tableView =[UITableView new];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView =[UIView new];
        [self addSubview:_tableView];
    }
    return _tableView;
}

-(NSMutableArray *)cellNameArray{
    if (_cellNameArray == nil) {
        _cellNameArray =[NSMutableArray arrayWithCapacity:0];
    }
    return _cellNameArray;
}

-(NSMutableArray *)modelArray{
    if (_modelArray == nil) {
        _modelArray =[NSMutableArray arrayWithCapacity:0];
    }
    return _modelArray;
}

- (instancetype)initWithFrame:(CGRect)frame dicCellModel:(NSDictionary *)dic
{
    self = [super initWithFrame:frame];
    if (self) {
        self.tableView.frame = frame;
        WeakSelf;
        [dic enumerateKeysAndObjectsUsingBlock:^(NSArray * keyCellName, NSString * obj, BOOL * _Nonnull stop) {
            [self whetherClassHave:obj];
            [keyCellName enumerateObjectsUsingBlock:^(id  _Nonnull model, NSUInteger idx, BOOL * _Nonnull stop) {
                [weakSelf.modelArray addObject:model];
                [weakSelf.cellNameArray addObject:obj];
            }];
        }];
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame multipleCell:(NSArray *)cell multipleModel:(NSArray *)model{
    self = [super initWithFrame:frame];
    if (self) {
        self.tableView.frame = frame;
        WeakSelf;
        [model.firstObject enumerateObjectsUsingBlock:^(NSArray * objarray, NSUInteger idxmodel, BOOL * _Nonnull stop) {
            [self whetherClassHave:cell.firstObject[idxmodel]];
            [objarray enumerateObjectsUsingBlock:^(NSObject * obj, NSUInteger idx, BOOL * _Nonnull stop) {
                [weakSelf.modelArray addObject:obj];
                [weakSelf.cellNameArray addObject:cell.firstObject[idxmodel]];
            }];
        }];
    }
    return self;
}
- (void)whetherClassHave:(NSString *)className;
{
    WeakSelf;
    unsigned int count;
    Method *methods = class_copyMethodList(NSClassFromString(className), &count);
    for (int i = 0; i < count; i++)
    {
        Method method = methods[i];
        SEL selector = method_getName(method);
        NSString *name = NSStringFromSelector(selector);
        if ([name rangeOfString:@"Nib"].location != NSNotFound){
            [weakSelf.tableView registerNib:[UINib nibWithNibName:className bundle:nil] forCellReuseIdentifier:className];
            return;
        }
    }
    [weakSelf.tableView registerClass:NSClassFromString(className) forCellReuseIdentifier:className];
    
}

#pragma mark --TableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.modelArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
     UITableViewCell * cell =[tableView dequeueReusableCellWithIdentifier:self.cellNameArray[indexPath.row] forIndexPath:indexPath];
    _cellHeight =[cell modelCellOrHeight:self.modelArray[indexPath.row] cellIndex:indexPath];
    cell.delegate = [self viewController:self];
    return cell;
}

- (id )viewController:(UIView *)view {
    UIResponder* nextResponder = [view nextResponder];
    if ([[view nextResponder] isKindOfClass:[UIViewController class]]) {
        return (UIViewController*)nextResponder;
    }
    
    return nil;
}

#pragma mark --TableViewDelegate
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return _cellHeight == 0 ? 44 :_cellHeight;
}

#pragma mark --refresh
-(void)refreshHeaderModel:(NSDictionary *)dic{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [self.modelArray removeAllObjects];
        [self.cellNameArray removeAllObjects];
        [dic enumerateKeysAndObjectsUsingBlock:^(NSArray * keyCellName, NSString * obj, BOOL * _Nonnull stop) {
            [keyCellName enumerateObjectsUsingBlock:^(id  _Nonnull model, NSUInteger idx, BOOL * _Nonnull stop) {
                [self.modelArray addObject:model];
                [self.cellNameArray addObject:obj];
            }];
        }];
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
        });
    });
}

-(void)refreshHeaderMultipleModel:(NSArray *)cell Model:(NSArray*)model{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [self.modelArray removeAllObjects];
        [self.cellNameArray removeAllObjects];
        [model.firstObject enumerateObjectsUsingBlock:^(NSArray * objarray, NSUInteger idxmodel, BOOL * _Nonnull stop) {
            [objarray enumerateObjectsUsingBlock:^(NSObject * obj, NSUInteger idx, BOOL * _Nonnull stop) {
                [self.modelArray addObject:obj];
                [self.cellNameArray addObject:cell.firstObject[idxmodel]];
            }];
        }];
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
        });
    });
}

-(void)refreshFooterModel:(NSDictionary *)dic{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [dic enumerateKeysAndObjectsUsingBlock:^(NSArray * keyCellName, NSString * obj, BOOL * _Nonnull stop) {
            [keyCellName enumerateObjectsUsingBlock:^(id  _Nonnull model, NSUInteger idx, BOOL * _Nonnull stop) {
                [self.modelArray addObject:model];
                [self.cellNameArray addObject:obj];
            }];
        }];
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
        });
    });
}

@end


@implementation UIViewController (GZAdd)

GZTabeleView * _tableView;

-(void)addTableView:(CGRect)rect dicCellModel:(NSDictionary *)dic{
    if (dic != nil) {
       _tableView =[[GZTabeleView alloc] initWithFrame:rect dicCellModel:dic];
        self.view = _tableView;
        self.tableView = _tableView.tableView;
    }
}

-(void)addTableView:(CGRect)rect multipleCellOnModel:(NSDictionary *)dic{
    if ([dic.allKeys[0]count] == [dic.allValues[0]count]) {
       _tableView =[[GZTabeleView alloc] initWithFrame:rect multipleCell:dic.allValues multipleModel:dic.allKeys];
        self.view = _tableView;
        self.tableView = _tableView.tableView;
    }else{
        NSLog(@"请检查key<NSArray *>.count 是否等于 Value.count");
    }
}

- (void)refreshHeaderModel:(NSDictionary *)dic{
    if (dic != nil) {
        [_tableView refreshHeaderModel:dic];
    }
}

- (void)refreshHeaderMultipleModel:(NSDictionary *)dic{
     if ([dic.allKeys[0]count] == [dic.allValues[0]count]) {
         [_tableView refreshHeaderMultipleModel:dic.allValues Model:dic.allKeys];
     }
}

-(void)refreshFooterModel:(NSDictionary *)dic{
    if (dic != nil) {
        [_tableView refreshFooterModel:dic];
    }
}

-(void)setTableView:(UITableView *)tableView{
    objc_setAssociatedObject(self, @selector(tableView), tableView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UITableView *)tableView{
    return objc_getAssociatedObject(self,_cmd);
}

-(void)tableViweCellClick:(id)sender model:(id)cellModel{
    //实现响应代理，用户自定义时，需自己实现
}
@end
