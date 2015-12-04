//
//  TimeTableTableViewController.m
//  Quadrant_Todo_List
//
//  Created by apple on 15/12/1.
//  Copyright © 2015年 apple. All rights reserved.
//

#import "TimeTableTableViewController.h"
#import "Utils.h"

@interface TimeTableTableViewController ()

@property (weak, nonatomic) IBOutlet UIDatePicker *startTimeDatePicker;
@property (weak, nonatomic) IBOutlet UIDatePicker *endTimeDatePicker;
@property (weak, nonatomic) IBOutlet UILabel *startTimeLab;
@property (weak, nonatomic) IBOutlet UILabel *endTimeLab;

- (IBAction)startDatepickerDidChange:(id)sender;
- (IBAction)endDatepickerDidChange:(id)sender;

@property (nonatomic) BOOL shouldShowStartDatepicker;
@property (nonatomic) BOOL shouldShowEndDatepicker;
- (IBAction)save:(id)sender;
- (IBAction)cancel:(id)sender;

@end

@implementation TimeTableTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 1. 做数据的初始化
    [self initData];
    
    // 2.初始化界面信息
    [self initUI];
}

/**
 *  内部数据初始化
 */
- (void) initData
{
    // 测试使用数据
    if (nil == self.itemModel) {
        self.itemModel = [[ItemModel alloc] init];
    }
    
    
    // 初始化日期选择器是否显示
    self.shouldShowStartDatepicker = YES;
    self.shouldShowEndDatepicker = NO;
}

/**
 *  初始化界面信息
 */
- (void) initUI
{
    // 设定时间选择器的初始化时间和时间标签的内容
    self.startTimeDatePicker.date = self.itemModel.startTime;
    self.endTimeDatePicker.date = self.itemModel.endTime;
    [self.startTimeLab setText:[Utils dateToString:self.startTimeDatePicker.date withFormat:@"yyyy-MM-dd HH:mm"]];
    [self.endTimeLab setText:[Utils dateToString:self.endTimeDatePicker.date withFormat:@"yyyy-MM-dd HH:mm"]];
    self.startTimeLab.textColor = [UIColor redColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 当用户选择的是开始时间所在的行的时候
    if (indexPath.section == 0)
    {
        [self toggleDatepicker:indexPath.row];
        
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
     if (indexPath.section == 0 && indexPath.row == 1 && !self.shouldShowStartDatepicker)
     {
         return 0;
     }
    else if (indexPath.section == 0 && indexPath.row == 3 && !self.shouldShowEndDatepicker)
    {
        return 0;
    }
    
     return [super tableView:tableView heightForRowAtIndexPath:indexPath];
}

/**
 *  需要将header的高度设置为最小
 *
 *  @param tableView <#tableView description#>
 *  @param section   <#section description#>
 *
 *  @return <#return value description#>
 */
- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0)
    {
        return 1.0f;
    }
    return 30.0f;
}


/**
 *  根据当前用户的点击行数来判断日期选择控件所在行是否需要显示或者隐藏
 *
 *  @param row 点击的行
 */
-(void) toggleDatepicker:(NSInteger)row
{
    
    if (0 == row) {
        self.shouldShowStartDatepicker = YES;
        self.shouldShowEndDatepicker = NO;
        self.startTimeLab.textColor = [UIColor redColor];
        self.endTimeLab.textColor = [UIColor blackColor];
    }
    else if (2 == row)
    {
        self.shouldShowStartDatepicker = NO;
        self.shouldShowEndDatepicker = YES;
        self.endTimeLab.textColor = [UIColor redColor];
        self.startTimeLab.textColor = [UIColor blackColor];
    }
    else
    {
        // do nothing
    }
    
    if (0 == row || 2 == row) {
        [self.tableView beginUpdates];
        [self.tableView endUpdates];
    }

}


/**
 *  空间滚动完毕后触发的事件
 *
 *  @param sender <#sender description#>
 */
- (IBAction)startDatepickerDidChange:(id)sender {
    self.startTimeLab.text = [Utils dateToString:self.startTimeDatePicker.date withFormat:@"yyyy-MM-dd HH:mm"];
    self.itemModel.startTime = self.startTimeDatePicker.date;
}

/**
 *  控件滚动完毕后触发的事件
 *
 *  @param sender <#sender description#>
 */
- (IBAction)endDatepickerDidChange:(id)sender {
    self.endTimeLab.text = [Utils dateToString:self.endTimeDatePicker.date withFormat:@"yyyy-MM-dd HH:mm"];
    self.itemModel.endTime = self.endTimeDatePicker.date;
}
/**
 *  时间设定完毕后，先做检查然后通过UIWind功能将数据返回
 *
 *  @param sender <#sender description#>
 */
- (IBAction)save:(id)sender {
    NSString *message = [self.itemModel isDateInvaild];
    if (nil == message)
    {
        [self performSegueWithIdentifier:@"doneForTimeSelect" sender:self];
    }
    else
    {
        [Utils showMessage:message];
    }
    
}

/**
 *  cancel事件，从导航栈中退出当前界面
 *
 *  @param sender <#sender description#>
 */
- (IBAction)cancel:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}


@end
