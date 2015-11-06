//
//  ViewController.m
//  Quadrant_Todo_List
//
//  Created by apple on 15/10/20.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "ViewController.h"
#import "ItemModel.h"
#import "TableDataSourceAndDelegate.h"
#import "Constants.h"
#import "EditViewController.h"

@interface ViewController ()
// 导航栏
@property IBOutlet UINavigationItem *navItem;
@property NSDate *interCurrentDate;

@property NSMutableArray *zyjjConnent;
@property NSMutableArray *zybjjConnent;
@property NSMutableArray *bzyjjConnent;
@property NSMutableArray *bzybjjConnent;

@property TableDataSourceAndDelegate *zyjjTableDataSourceAndDelegate;
@property TableDataSourceAndDelegate *zybjjTableDataSourceAndDelegate;
@property TableDataSourceAndDelegate *bzyjjTableDataSourceAndDelegate;
@property TableDataSourceAndDelegate *bzybjjTableDataSourceAndDelegate;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initTableFacade];
    // 初始化表达内容（测试用）
    [self initTableViewConnent];
    [self initTableSourceAndDelegate];

}

// 初始化table的一些外观
- (void)initTableFacade
{
    // 将分割线去掉
    [self.zyjj setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [self.zybjj setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [self.bzybjj setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [self.bzybjj setSeparatorStyle:UITableViewCellSeparatorStyleNone];
}


// 初始化表单数据源和委派
- (void)initTableSourceAndDelegate
{
    // 重要紧急
    self.zyjjTableDataSourceAndDelegate = [[TableDataSourceAndDelegate alloc] initWithData:self.zyjjConnent AndType:ZYJJ];
    self.zyjj.dataSource = self.zyjjTableDataSourceAndDelegate;
    self.zyjj.delegate = self.zyjjTableDataSourceAndDelegate;
    
    // 重要不紧急
    self.zybjjTableDataSourceAndDelegate = [[TableDataSourceAndDelegate alloc] initWithData:self.zybjjConnent AndType:ZYBJJ];
    self.zybjj.dataSource = self.zybjjTableDataSourceAndDelegate;
    self.zybjj.delegate = self.zybjjTableDataSourceAndDelegate;
    
    //  不重要紧急
    self.bzyjjTableDataSourceAndDelegate = [[TableDataSourceAndDelegate alloc] initWithData:self.bzyjjConnent AndType:BZYJJ];
    self.bzyjj.dataSource = self.bzyjjTableDataSourceAndDelegate;
    self.bzyjj.delegate = self.bzyjjTableDataSourceAndDelegate;
    
    // 不重要不紧急
    self.bzybjjTableDataSourceAndDelegate = [[TableDataSourceAndDelegate alloc] initWithData:self.bzybjjConnent AndType:BZYBJJ];
    self.bzybjj.dataSource = self.bzybjjTableDataSourceAndDelegate;
    self.bzybjj.delegate = self.bzybjjTableDataSourceAndDelegate;
}

// 初始化表达内容
- (void)initTableViewConnent
{
    //  初始化表单内容
    if (nil == self.zyjjConnent)
    {
        self.zyjjConnent = [[NSMutableArray alloc] init];
        [self.zyjjConnent addObject:[[ItemModel alloc] initWithDefault:@"zyjj_1" And:ZYJJ]];
        [self.zyjjConnent addObject:[[ItemModel alloc] initWithDefault:@"zyjj_2" And:ZYJJ]];
        [self.zyjjConnent addObject:[[ItemModel alloc] initWithDefault:@"zyjj_3" And:ZYJJ]];
        [self.zyjjConnent addObject:[[ItemModel alloc] initWithDefault:@"zyjj_4" And:ZYJJ]];
        [self.zyjjConnent addObject:[[ItemModel alloc] initWithDefault:@"zyjj_5" And:ZYJJ]];
        [self.zyjjConnent addObject:[[ItemModel alloc] initWithDefault:@"zyjj_6" And:ZYJJ]];
        [self.zyjjConnent addObject:[[ItemModel alloc] initWithDefault:@"zyjj_7" And:ZYJJ]];
        [self.zyjjConnent addObject:[[ItemModel alloc] initWithDefault:@"zyjj_8" And:ZYJJ]];
        [self.zyjjConnent addObject:[[ItemModel alloc] initWithDefault:@"zyjj_9" And:ZYJJ]];
        [self.zyjjConnent addObject:[[ItemModel alloc] initWithDefault:@"zyjj_10" And:ZYJJ]];
        [self.zyjjConnent addObject:[[ItemModel alloc] initWithDefault:@"zyjj_11" And:ZYJJ]];
        [self.zyjjConnent addObject:[[ItemModel alloc] initWithDefault:@"zyjj_12" And:ZYJJ]];
    }
    
    if (nil == self.zybjjConnent)
    {
        self.zybjjConnent = [[NSMutableArray alloc] init];
        [self.zybjjConnent addObject:[[ItemModel alloc] initWithDefault:@"zybjj_1" And:ZYBJJ]];
        [self.zybjjConnent addObject:[[ItemModel alloc] initWithDefault:@"zybjj_2" And:ZYBJJ]];
        [self.zybjjConnent addObject:[[ItemModel alloc] initWithDefault:@"zybjj_3" And:ZYBJJ]];
        [self.zybjjConnent addObject:[[ItemModel alloc] initWithDefault:@"zybjj_4" And:ZYBJJ]];
        [self.zybjjConnent addObject:[[ItemModel alloc] initWithDefault:@"zybjj_5" And:ZYBJJ]];
        [self.zybjjConnent addObject:[[ItemModel alloc] initWithDefault:@"zybjj_6" And:ZYBJJ]];
        [self.zybjjConnent addObject:[[ItemModel alloc] initWithDefault:@"zybjj_7" And:ZYBJJ]];
        [self.zybjjConnent addObject:[[ItemModel alloc] initWithDefault:@"zybjj_8" And:ZYBJJ]];
        [self.zybjjConnent addObject:[[ItemModel alloc] initWithDefault:@"zybjj_9" And:ZYBJJ]];
        [self.zybjjConnent addObject:[[ItemModel alloc] initWithDefault:@"zybjj_10" And:ZYBJJ]];
        [self.zybjjConnent addObject:[[ItemModel alloc] initWithDefault:@"zybjj_11" And:ZYBJJ]];
        [self.zybjjConnent addObject:[[ItemModel alloc] initWithDefault:@"zybjj_12" And:ZYBJJ]];
    }
    
    if (nil == self.bzyjjConnent)
    {
        self.bzyjjConnent = [[NSMutableArray alloc] init ];
        [self.bzyjjConnent addObject:[[ItemModel alloc] initWithDefault:@"bzyjj_1" And:BZYJJ]];
        [self.bzyjjConnent addObject:[[ItemModel alloc] initWithDefault:@"bzyjj_2" And:BZYJJ]];
        [self.bzyjjConnent addObject:[[ItemModel alloc] initWithDefault:@"bzyjj_3" And:BZYJJ]];
        [self.bzyjjConnent addObject:[[ItemModel alloc] initWithDefault:@"bzyjj_4" And:BZYJJ]];
        [self.bzyjjConnent addObject:[[ItemModel alloc] initWithDefault:@"bzyjj_5" And:BZYJJ]];
        [self.bzyjjConnent addObject:[[ItemModel alloc] initWithDefault:@"bzyjj_6" And:BZYJJ]];
        [self.bzyjjConnent addObject:[[ItemModel alloc] initWithDefault:@"bzyjj_7" And:BZYJJ]];
        [self.bzyjjConnent addObject:[[ItemModel alloc] initWithDefault:@"bzyjj_8" And:BZYJJ]];
        [self.bzyjjConnent addObject:[[ItemModel alloc] initWithDefault:@"bzyjj_9" And:BZYJJ]];
        [self.bzyjjConnent addObject:[[ItemModel alloc] initWithDefault:@"bzyjj_10" And:BZYJJ]];
        [self.bzyjjConnent addObject:[[ItemModel alloc] initWithDefault:@"bzyjj_11" And:BZYJJ]];
        [self.bzyjjConnent addObject:[[ItemModel alloc] initWithDefault:@"bzyjj_12" And:BZYJJ]];
    }
    
    if (nil == self.bzybjjConnent)
    {
        self.bzybjjConnent = [[NSMutableArray alloc] init];
        [self.bzybjjConnent addObject:[[ItemModel alloc] initWithDefault:@"bzybjj_1" And:BZYBJJ]];
        [self.bzybjjConnent addObject:[[ItemModel alloc] initWithDefault:@"bzybjj_2" And:BZYBJJ]];
        [self.bzybjjConnent addObject:[[ItemModel alloc] initWithDefault:@"bzybjj_3" And:BZYBJJ]];
        [self.bzybjjConnent addObject:[[ItemModel alloc] initWithDefault:@"bzybjj_4" And:BZYBJJ]];
        [self.bzybjjConnent addObject:[[ItemModel alloc] initWithDefault:@"bzybjj_5" And:BZYBJJ]];
        [self.bzybjjConnent addObject:[[ItemModel alloc] initWithDefault:@"bzybjj_6" And:BZYBJJ]];
        [self.bzybjjConnent addObject:[[ItemModel alloc] initWithDefault:@"bzybjj_7" And:BZYBJJ]];
        [self.bzybjjConnent addObject:[[ItemModel alloc] initWithDefault:@"bzybjj_8" And:BZYBJJ]];
        [self.bzybjjConnent addObject:[[ItemModel alloc] initWithDefault:@"bzybjj_9" And:BZYBJJ]];
        [self.bzybjjConnent addObject:[[ItemModel alloc] initWithDefault:@"bzybjj_10" And:BZYBJJ]];
        [self.bzybjjConnent addObject:[[ItemModel alloc] initWithDefault:@"bzybjj_11" And:BZYBJJ]];
        [self.bzybjjConnent addObject:[[ItemModel alloc] initWithDefault:@"bzybjj_12" And:BZYBJJ]];
    }
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



// 根据seque来获取目标controller
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    ItemModel *itemModel = nil;
    TableDataSourceAndDelegate *tempSd = nil;
    EditViewController *destViewController = segue.destinationViewController;
    if ([segue.identifier isEqualToString:@"showSeque_zyjj"]) {
        tempSd = self.zyjjTableDataSourceAndDelegate;
    }
    else if([segue.identifier isEqualToString:@"showSeque_zybjj"])
    {
        tempSd = self.zybjjTableDataSourceAndDelegate;
    }
    else if([segue.identifier isEqualToString:@"showSeque_bzyjj"])
    {
        tempSd = self.bzyjjTableDataSourceAndDelegate;
    }
    else if([segue.identifier isEqualToString:@"showSeque_bzybjj"])
    {
        tempSd = self.bzybjjTableDataSourceAndDelegate;
    }
    
    if (tempSd)
    {
        //  获取当前的用户选择的项目
        itemModel = [tempSd getSelectedItem];
        //  设定当前用户选择的项目
        destViewController.itemModel = itemModel;
    }
}

// 当在编辑sence点击保存的时候出发
- (IBAction)saveOrChangeItem:(UIStoryboardSegue *)segue
{
    EditViewController *source = [segue sourceViewController];
    ItemModel *item = source.itemModel;
    // 如果是nil则不做任何处理
    if (item == nil) {
        return;
    }
    
    // 首先删除原有优先级中此项目的table内容
    TableDataSourceAndDelegate *preTdd = [self getTableDataSourceAndDelegateByProperty:item.prePriority];
    TableDataSourceAndDelegate *nowTdd = [self getTableDataSourceAndDelegateByProperty:item.priority];
    
    // 1.需要删除前状态委派对象数据
    [preTdd deleteData:item];
    
    // 2. 将item加入现状态的委派对象中
    [nowTdd addData:item];
    
    
}

// 根据优先级获取对象的委派类
- (TableDataSourceAndDelegate *) getTableDataSourceAndDelegateByProperty:(ITEMPRIORTY) property
{
    if (property == ZYJJ)
    {
        return  self.zyjjTableDataSourceAndDelegate;
    }
    else if (property == ZYBJJ)
    {
        return  self.zybjjTableDataSourceAndDelegate;
    }
    else if (property == BZYJJ)
    {
        return  self.bzyjjTableDataSourceAndDelegate;
    }
    else if (property == BZYBJJ)
    {
        return  self.bzybjjTableDataSourceAndDelegate;
    }
    
    return nil;
}

@end
