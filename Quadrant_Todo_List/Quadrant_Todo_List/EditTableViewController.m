//
//  EditTableViewController.m
//  Quadrant_Todo_List
//
//  Created by apple on 15/11/23.
//  Copyright © 2015年 apple. All rights reserved.
//

#import "EditTableViewController.h"
#import "Utils.h"
#import "TimeTableTableViewController.h"

CGRect proBtnFrameArr[4];
@interface EditTableViewController ()

@property (weak, nonatomic) IBOutlet UIBarButtonItem *save;
@property (strong,nonatomic) NSArray *proBtnArr;
@property (strong,nonatomic) NSArray *proBtnMegArr;

@end

@implementation EditTableViewController

/**
 *  页面生成入口方法
 */
- (void)viewDidLoad {
    [super viewDidLoad];
    [self initData];
    [self initUIData];
    
}

- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0)
    {
        return 1.0f;
    }
    return 30.0f;
}



/**
 *  内部计算数据初始化
 */
- (void) initData
{
    self.proBtnArr = @[self.zyjjBtn, self.zybjjBtn, self.bzyjjBtn, self.bzybjjBtn];
    self.proBtnMegArr = @[@"很重要-很紧急", @"很重要-不紧急", @"不重要-很紧急", @"不重要-不紧急"];
    proBtnFrameArr[0] = self.zyjjBtn.frame;
    proBtnFrameArr[1] = self.zybjjBtn.frame;
    proBtnFrameArr[2] = self.bzyjjBtn.frame;
    proBtnFrameArr[3] = self.bzybjjBtn.frame;
    
    // 如果发现当前数据为空 则说明当前状态为新增项目页面状态
    if (self.itemModel == nil)
    {
        // 新增项目时候没有id，id为nil
        self.itemModel = [[ItemModel alloc] init];
    }
}

/**
 *  界面效果根据数据初始化
 */
-(void) initUIData
{
    // 设定输入框
    [self setinputArea];
    
    // 设定级别选项框
    [self setProirtyButn];
    
    // 设定当前日期
    [self setTimeArea];

}

/**
 *  设定时间显示部分
 */
- (void) setTimeArea
{
    NSString *startNs = [Utils dateToString:self.itemModel.startTime withFormat:@"yyyy-MM-dd HH:mm"];
    NSString *endNs = [Utils dateToString:self.itemModel.endTime withFormat:@"yyyy-MM-dd HH:mm"];
    NSString *timeComb = [NSString stringWithFormat:@"%@ > %@",startNs, endNs];
    [self.timebtn setTitle:timeComb  forState:UIControlStateNormal];
}

/**
 *  设定输入框显示部分
 */
- (void) setinputArea
{
    self.inputLab.text = self.itemModel.itemName;
    self.inputLab.backgroundColor = [self.proBtnArr[self.itemModel.priority] backgroundColor];
}

/**
 *  设定优先级按钮显示部分
 */
- (void)setProirtyButn
{
    // 首先将所有的按钮恢复原状
    int i = 0;
    for(id btn in self.proBtnArr)
    {
        [[btn layer] setBorderWidth:0];
        
        [btn setFrame:proBtnFrameArr[i]];
        i++;
    }
    
    //设置指定按钮的边界的宽度和颜色
    CGColorSpaceRef colorSpaceRef = CGColorSpaceCreateDeviceRGB();
    CGColorRef color = CGColorCreate(colorSpaceRef, (CGFloat[]){1,0,0,1});
    [[self.proBtnArr[self.itemModel.priority] layer] setBorderColor:color];
    [[self.proBtnArr[self.itemModel.priority] layer] setBorderWidth:2];//设置边界的宽度
    
    CGRect frame;
    // 设定边框文字
    for (int i = self.itemModel.priority + 1; i< self.proBtnArr.count; i++)
    {
        frame = [self.proBtnArr[i] frame];
        frame.origin.x += self.infoLab.frame.size.width;
        [self.proBtnArr[i] setFrame:frame];
    }
    frame = self.infoLab.frame;
    frame.origin.x = [self.proBtnArr[self.itemModel.priority] frame].origin.x + [self.proBtnArr[self.itemModel.priority] frame].size.width + 5;
    self.infoLab.frame = frame;
    self.infoLab.text = self.proBtnMegArr[self.itemModel.priority];
}



/**
 *  重要紧急优先级按钮按下事件
 *
 *  @param sender <#sender description#>
 */
- (IBAction)zyjjClick:(id)sender {
    self.itemModel.priority = ZYJJ;
    [self setProirtyButn];
    self.inputLab.backgroundColor = [self.proBtnArr[self.itemModel.priority] backgroundColor];
}

/**
 *  重要不紧急按钮按下事件
 *
 *  @param sender <#sender description#>
 */
- (IBAction)zybjjClick:(id)sender {
    self.itemModel.priority = ZYBJJ;
    [self setProirtyButn];
    self.inputLab.backgroundColor = [self.proBtnArr[self.itemModel.priority] backgroundColor];
}

/**
 *  不重要紧急按钮按下事件
 *
 *  @param sender <#sender description#>
 */
- (IBAction)bzyjjClick:(id)sender {
    self.itemModel.priority = BZYJJ;
    [self setProirtyButn];
    self.inputLab.backgroundColor = [self.proBtnArr[self.itemModel.priority] backgroundColor];
}

/**
 *  不重要不紧急按钮按下事件
 *
 *  @param sender <#sender description#>
 */
- (IBAction)bzybjjClick:(id)sender {
    self.itemModel.priority = BZYBJJ;
    [self setProirtyButn];
    self.inputLab.backgroundColor = [self.proBtnArr[self.itemModel.priority] backgroundColor];
}

/**
 *  时间选择按钮按下事件
 *
 *  @param sender <#sender description#>
 */
- (IBAction)timeBtnClick:(id)sender {
    
}

/**
 *  seque 定向前的数据处理
 *
 *  @param segue  <#segue description#>
 *  @param sender <#sender description#>
 */
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
        // 时间选择seque定向
       if ([segue.identifier isEqualToString:@"DateSelecter"]) {
           TimeTableTableViewController *destViewController = segue.destinationViewController;
           destViewController.itemModel = self.itemModel;
    }
}

// 当在编辑sence点击保存的时候出发
- (IBAction)saveTime:(UIStoryboardSegue *)segue
{
    TimeTableTableViewController *source = [segue sourceViewController];
    ItemModel *item = source.itemModel;
    // 如果是nil则不做任何处理
    if (item == nil) {
        return;
    }
    
    self.itemModel.startTime = item.startTime;
    self.itemModel.endTime = item.endTime;
    
    [self setTimeArea];

}

@end
