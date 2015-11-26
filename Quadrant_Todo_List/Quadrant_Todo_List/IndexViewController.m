//
//  ViewController.m
//  Quadrant_Todo_List
//
//  Created by apple on 15/10/20.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "IndexViewController.h"
#import "ItemModel.h"
#import "TableDataSourceAndDelegate.h"
#import "Constants.h"
#import "EditViewController.h"
#import "ItemPersistance.h"


/**
 * 首页代办事件查看页面
 */
@interface IndexViewController ()

// 四象限待完成事项
@property (nonatomic, copy) NSMutableArray *zyjjConnent;
@property (nonatomic, copy) NSMutableArray *zybjjConnent;
@property (nonatomic, copy) NSMutableArray *bzyjjConnent;
@property (nonatomic, copy) NSMutableArray *bzybjjConnent;

// 四象限表格的委派类
@property (nonatomic, strong) TableDataSourceAndDelegate *zyjjTableDataSourceAndDelegate;
@property (nonatomic, strong) TableDataSourceAndDelegate *zybjjTableDataSourceAndDelegate;
@property (nonatomic, strong) TableDataSourceAndDelegate *bzyjjTableDataSourceAndDelegate;
@property (nonatomic, strong) TableDataSourceAndDelegate *bzybjjTableDataSourceAndDelegate;

/**
 *  当前UI状态
 */
@property (nonatomic) INDEXUISTATUS currentUIStatus;

/**
 *  当前设备型号
 */
@property (nonatomic) DEVICETYPE deviceType;

@end

@implementation IndexViewController

/**
 *  画面初始化入口方法
 */
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 初始化内部数据
    [self initObjectData];
    
    // 初始化屏幕UI位置
    [self makeIndexUILayoutByStatus:self.currentUIStatus];
    
    // 初始化表达内容（测试用）
    [self initTableViewContent];
    
    // 初始化数据代理
    [self initTableSourceAndDelegate];
    
    
    float aFloat = -21.09f;
    NSLog(@"%f", aFloat);
    NSLog(@"%8.2f", aFloat);

}

/**
 *  初始化内部计算数据
 */
- (void) initObjectData
{

    // 初始化当前UI状态（此时表示四象限未发生变化）
    self.currentUIStatus = NONE_UI;
    
    // 计算出当前设备的型号
    UIScreen *screen = [UIScreen mainScreen];
          if ((int) screen.bounds.size.width == IPHONE_WIDTH)
          {
              self.deviceType = IPhone6;
          }
}

/**
 *  初始化表格数据源和委托
 */
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

/**
 *  初始化表达内容
 */
- (void)initTableViewContent
{
    //  初始化重要紧急项目表单内容
    if (nil == self.zyjjConnent)
    {
        self.zyjjConnent = [ItemPersistance getItemcontentByPriorty:ZYJJ];
    }
    
    // 初始化重要不紧急项目表达内容
    if (nil == self.zybjjConnent)
    {
        self.zybjjConnent = [ItemPersistance getItemcontentByPriorty:ZYBJJ];
    }
    
    // 初始化不重要但是紧急项目表单内容
    if (nil == self.bzyjjConnent)
    {
        self.bzyjjConnent = [ItemPersistance getItemcontentByPriorty:BZYJJ];
    }
    
    // 初始化不重要不紧急项目表单内容
    if (nil == self.bzybjjConnent)
    {
        self.bzybjjConnent = [ItemPersistance getItemcontentByPriorty:BZYBJJ];
    }
}

/**
 *  根据seque来获取目标controller
 *
 *  @param segue  segue seque类型
 *  @param sender <#sender description#>
 */
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
        return self.zyjjTableDataSourceAndDelegate;
    }
    else if (property == ZYBJJ)
    {
        return self.zybjjTableDataSourceAndDelegate;
    }
    else if (property == BZYJJ)
    {
        return self.bzyjjTableDataSourceAndDelegate;
    }
    else if (property == BZYBJJ)
    {
        return self.bzybjjTableDataSourceAndDelegate;
    }
    
    return nil;
}

/**
 *  查询点击项目的时候触发画面重画还是跳转进入编辑页面
 *
 *  @param identifier <#identifier description#>
 *  @param sender     <#sender description#>
 *
 *  @return <#return value description#>
 */
- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender
{
    
    // 当选中某个列表内容的时候哦首先要查看当前列表是否处于最大化，
    // 如果不是最大化的话就先将列表最大化
    
    if ([identifier isEqualToString:@"zyjj_seque"])
    {
        if (ZYJJ_UI == self.currentUIStatus)
        {
            return YES;
        }
        else
        {
            [self makeIndexUILayoutByStatus:ZYJJ_UI];
            return NO;
        }
    }
    else if ([identifier isEqualToString:@"zybjj_seque"])
    {
        if (ZYBJJ_UI == self.currentUIStatus)
        {
            return YES;
        }
        else
        {
            [self makeIndexUILayoutByStatus:ZYBJJ_UI];
            return NO;
        }
    }
    else if ([identifier isEqualToString:@"bzyjj_seque"])
    {
        if (BZYJJ_UI == self.currentUIStatus)
        {
            return YES;
        }
        else
        {
            [self makeIndexUILayoutByStatus:BZYJJ_UI];
            return NO;
        }
    }
    else if ([identifier isEqualToString:@"bzybjj_seque"])
    {
        if (BZYBJJ_UI == self.currentUIStatus)
        {
            return YES;
        }
        else
        {
            [self makeIndexUILayoutByStatus:BZYBJJ_UI];
            return NO;
        }
    }
    else
    {
        return YES;
    }
    
    return NO;
}

/**
 *  扩大重要紧急区域
 *
 *  @param sender <#sender description#>
 */
- (IBAction)expandZyjjArea:(id)sender {

    [self makeIndexUILayoutByStatus:ZYJJ_UI];
}

- (IBAction)expandZybjjArea:(id)sender
{
    [self makeIndexUILayoutByStatus:ZYBJJ_UI];
}

- (IBAction)expandBzyjjArea:(id)sender
{
    [self makeIndexUILayoutByStatus:BZYJJ_UI];
}
- (IBAction)expandBzybjjArea:(id)sender
{
     [self makeIndexUILayoutByStatus:BZYBJJ_UI];
}



/**
 *  重画UI
 *
 *  @param indexController 当前controller
 *  @param status          当前UI状态
 */
-(void)makeIndexUILayoutByStatus:(INDEXUISTATUS)status
{
    // 后续可以根据不同屏幕尺寸在动态判断
    if(self.deviceType == IPhone6)
    {
        // 更新当前UI状态
        self.currentUIStatus = status;
        
        // 根据UI跳转状态来重绘UI
        switch (status) {
            case NONE_UI:
                self.returnBtn.hidden = TRUE;
                
                self.zyjjBt.frame = CGRectMake(0, 64, 187, 31);
                self.zyjj.frame = CGRectMake(0, 95, 187, 270);
                self.zyjjBt.titleLabel.hidden = NO;
                self.zyjj.hidden = FALSE;
                
                self.zybjjBt.frame = CGRectMake(188, 64, 187, 31);
                self.zybjj.frame = CGRectMake(188, 95, 187, 270);
                self.zybjjBt.titleLabel.hidden = NO;
                self.zybjj.hidden = FALSE;
                
                self.bzyjjBt.frame = CGRectMake(0, 366, 187, 31);
                self.bzyjj.frame = CGRectMake(0, 397, 187, 270);
                self.bzyjjBt.titleLabel.hidden = NO;
                self.bzyjj.hidden = FALSE;
                
                self.bzybjjBt.frame = CGRectMake(188, 366, 187, 31);
                self.bzybjj.frame = CGRectMake(188, 397, 187, 270);
                self.bzybjjBt.titleLabel.hidden = NO;
                self.bzybjj.hidden = FALSE;
                
                break;
                
            case ZYJJ_UI:
                self.returnBtn.hidden = FALSE;
                
                
                self.zyjjBt.frame = CGRectMake(0, 64, 337, 31);
                self.zyjj.frame = CGRectMake(0, 95, 337, 540);
                self.zyjjBt.titleLabel.hidden = NO;
                self.zyjj.hidden = FALSE;
                
                self.zybjjBt.frame = CGRectMake(338, 64, 37, 571);
                self.zybjjBt.titleLabel.hidden=YES;
                self.zybjj.hidden = TRUE;
                
                self.bzyjjBt.frame = CGRectMake(0, 636, 337, 31);
                self.bzyjjBt.titleLabel.hidden=YES;
                self.bzyjj.hidden = TRUE;
                
                self.bzybjjBt.frame = CGRectMake(338, 636, 37, 31);
                self.bzybjjBt.titleLabel.hidden=YES;
                self.bzybjj.hidden = TRUE;
                break;
                
            case ZYBJJ_UI:
                self.returnBtn.hidden = FALSE;
                
                
                self.zyjjBt.frame = CGRectMake(0, 64, 37, 571);
                self.zyjjBt.titleLabel.hidden = YES;
                self.zyjj.hidden = TRUE;
                
                self.zybjjBt.frame = CGRectMake(38, 64, 337, 31);
                self.zybjj.frame = CGRectMake(38, 95, 337, 540);
                self.zybjjBt.titleLabel.hidden = NO;
                self.zybjj.hidden = FALSE;
                
                self.bzyjjBt.frame = CGRectMake(0, 636, 37, 31);
                self.bzyjjBt.titleLabel.hidden = YES;
                self.bzyjj.hidden = TRUE;
                
                self.bzybjjBt.frame = CGRectMake(38, 636, 337, 31);
                self.bzybjjBt.titleLabel.hidden = YES;
                self.bzybjj.hidden = TRUE;
                break;
                
            case BZYJJ_UI:
                self.returnBtn.hidden = FALSE;
                
                
                self.zyjjBt.frame = CGRectMake(0, 64, 337, 31);
                self.zyjjBt.titleLabel.hidden = YES;
                self.zyjj.hidden = TRUE;
                
                self.zybjjBt.frame = CGRectMake(338, 64, 37, 31);
                self.zybjjBt.titleLabel.hidden = YES;
                self.zybjj.hidden = TRUE;
                
                self.bzyjjBt.frame = CGRectMake(0, 96, 337, 31);
                self.bzyjj.frame = CGRectMake(0, 127, 337, 540);
                self.bzyjjBt.titleLabel.hidden = NO;
                self.bzyjj.hidden = FALSE;
                
                self.bzybjjBt.frame = CGRectMake(338, 96, 37, 571);
                self.bzybjjBt.titleLabel.hidden = YES;
                self.bzybjj.hidden = TRUE;
                break;
                
            case BZYBJJ_UI:
                self.returnBtn.hidden = FALSE;
                //此处为特殊处理，让返回按钮浮现在最上层以接受点击事件
                [self.view bringSubviewToFront:self.returnBtn];
                
                self.zyjjBt.frame = CGRectMake(0, 64, 37, 31);
                self.zyjjBt.titleLabel.hidden = YES;
                self.zyjj.hidden = TRUE;
                
                self.zybjjBt.frame = CGRectMake(38, 64, 337, 31);
                self.zybjjBt.titleLabel.hidden = YES;
                self.zybjj.hidden = TRUE;
                
                self.bzyjjBt.frame = CGRectMake(0, 96, 37, 571);
                self.bzyjjBt.titleLabel.hidden = YES;
                self.bzyjj.hidden = TRUE;
                
                self.bzybjjBt.frame = CGRectMake(38, 96, 337, 31);
                self.bzybjj.frame = CGRectMake(38, 127, 337, 540);
                self.bzybjjBt.titleLabel.hidden = NO;
                self.bzybjj.hidden = FALSE;
                break;
                
            default:
                break;
        }
        
    }
}
- (IBAction)returndefaultUI:(id)sender {
    [self makeIndexUILayoutByStatus:NONE_UI];
}
@end
