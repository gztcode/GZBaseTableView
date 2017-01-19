# GZBaseTableView
最简洁的代码来实现basa的TableView。
### 简单的介绍一下
只需要在UIViewController的子类中导入 "UIViewController+GZAdd.h"
头文件既可以一句话生成tableView

```
[self addTableView:self.view.bounds dicCellModel:@{@[model]:CELLSTR(UITableViewCell)}];
```
这是一个自定义一个cell的TableView
@{@[model]:CELLSTR(UITableViewCell)}\<br>

@[model] ->指的是存放数据的数组，数组的icon代表cell的个数

CELLSTR(UITableViewCell) -> 自定义cell的类名



```
[self addTableView:self.view.bounds dicCellModel:@{@[model]:@[cellName]}];
```

这是一个自定义多个cell的TableView

@[model] -> 指存放数组(Model)的数组

@[cellName] -> 存放cell名字的数组



##这只是一个Demo具体使用请抽离UIViewController+GZAdd类

