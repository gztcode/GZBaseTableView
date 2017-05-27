# GZBaseTableView
最简洁的代码来实现basa的TableView。
### 简单的介绍一下
只需要在UIViewController的子类中导入 "UIViewController+GZAdd.h"
头文件既可以一句话生成tableView

```
[self addTableView:self.view.bounds dicCellModel:@{@[model]:CELLSTR(UITableViewCell)}];
```
这是一个自定义一个cell的TableView
@{@[model]:CELLSTR(UITableViewCell)}

@[model] ->指的是存放数据的数组，数组的icon代表cell的个数

CELLSTR(UITableViewCell) -> 自定义cell的类名(支持Nib)



```
[self addTableView:self.view.bounds multipleCellOnModel:@{arr:array}];
```

这是一个自定义多个cell的TableView

arr -> 指存放数组(Model)的数组

array -> 存放cell名字的数组


安装
==============

### CocoaPods

1. 在 Podfile 中添加 `pod 'GZBaseTableView'`。
2. 执行 `pod install` 或 `pod update`。
3. 导入 \<GZBaseTableView/UIViewController+GZAdd.h\>。

### 手动安装

1. 下载 GZBaseTableView 文件夹内的所有内容。
2. 将 YYModel 内的源文件添加(拖放)到你的工程。
3. 导入 `UIViewController+GZAdd.h`。

系统要求
==============
该项目最低支持 `iOS 8.0` 和 `Xcode 7.0`。

许可证
==============
GZBaseTableView 使用 MIT 许可证，详情见 LICENSE 文件。


##这只是一个Demo具体使用请抽离UIViewController+GZAdd类

