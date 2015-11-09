//
//  EditViewController.m
//  Quadrant_Todo_List
//
//  Created by apple on 15/10/25.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "EditViewController.h"
#import "ItemModel.h"
#import "Utils.h"

@interface EditViewController ()
// 当前的时间是开始时间选择还是结束时间选择
@property TIMESELECTOR currentTimeSelector;

@end

@implementation EditViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //如果是新创建
    if (nil == self.itemModel)
    {
        self.itemModel = [[ItemModel alloc] init];
    }
    
    [self printViewStyle];
}

-(void)printViewStyle
{
    // 设定输入框颜色
    UIColor *proColor = nil;
    if(self.itemModel.priority == ZYJJ)
    {
        proColor = self.zyjjb.backgroundColor;
    }
    else if (self.itemModel.priority == ZYBJJ)
    {
        proColor = self.zybjjb.backgroundColor;
    }
    else if (self.itemModel.priority == BZYJJ)
    {
        proColor = self.bzyjjb.backgroundColor;
    }
    else if (self.itemModel.priority == BZYBJJ)
    {
        proColor = self.bzybjjb.backgroundColor;
    }
    else{
        // do nothing
    }
    self.thing.backgroundColor = proColor;
    
    
    // 当传入内容不为空的时候设定传入内容（当用户点击加号增加项目的时候就不会设定内容）设定输入框内容
    if (self.itemModel.itemName.length != 0)
    {
        self.thing.text = self.itemModel.itemName;
    }
    
    
    // 设定开始时间和结束时间的内容
    [self.startTime setTitle: [self formatDate:self.itemModel.startTime] forState:UIControlStateNormal];
    [self.endTime setTitle: [self formatDate:self.itemModel.startTime] forState:UIControlStateNormal];
    
}

-(NSString *)formatDate:(NSDate *)date
{
    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    [format setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    return [format stringFromDate:date];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


- (IBAction)selectStartTime:(id)sender {
    self.currentTimeSelector = START;
    if (self.hiddenViewForDate.isHidden)
    {
        self.hiddenViewForDate.hidden = FALSE;
    }
}

- (IBAction)selectEndTime:(id)sender {
    self.currentTimeSelector = END;
    if (self.hiddenViewForDate.isHidden)
    {
        self.hiddenViewForDate.hidden = FALSE;
    }
    
    // 结束时间应该永远比开始时间要晚
    self.datePicker.minimumDate = self.itemModel.startTime;
    
}

//取消选定时间
- (IBAction)cancelTime:(id)sender {
    self.hiddenViewForDate.hidden = TRUE;
    self.startTime.backgroundColor = [UIColor clearColor];
    self.endTime.backgroundColor = [UIColor clearColor];
}

// 选定时间
- (IBAction)doneTime:(id)sender {
    self.hiddenViewForDate.hidden = TRUE;
    if (self.currentTimeSelector == START)
    {
        self.itemModel.startTime = self.datePicker.date;
        self.startTime.titleLabel.text = [self formatDate:self.itemModel.startTime];
    }
    else{
        self.itemModel.endTime = self.datePicker.date;
        self.endTime.titleLabel.text = [self formatDate:self.itemModel.endTime];
    }
}

// 用户设定项目紧急程度按钮事件
- (IBAction)selectZYJJ:(id)sender {
    self.itemModel.priority=ZYJJ;
    self.thing.backgroundColor = self.zyjjb.backgroundColor;
    
    // 隐藏时间选择器
    self.hiddenViewForDate.hidden = TRUE;
}

- (IBAction)selectZYBJJ:(id)sender {
    self.itemModel.priority=ZYBJJ;
    self.thing.backgroundColor = self.zybjjb.backgroundColor;
    
    // 隐藏时间选择器
    self.hiddenViewForDate.hidden = TRUE;
}

- (IBAction)selectBZYJJ:(id)sender {
    self.itemModel.priority=BZYJJ;
    self.thing.backgroundColor = self.bzyjjb.backgroundColor;
    
    // 隐藏时间选择器
    self.hiddenViewForDate.hidden = TRUE;
}

- (IBAction)selectBZYBJJ:(id)sender {
     self.itemModel.priority = BZYBJJ;
     self.thing.backgroundColor = self.bzybjjb.backgroundColor;
    
    // 隐藏时间选择器
    self.hiddenViewForDate.hidden = TRUE;
}

// 保存，在保存之前需要检查
- (IBAction)save:(id)sender {
    
    // 需要将输入框中的文字赋给对象
    self.itemModel.itemName=self.thing.text;
    // 检查输入项目是否符合要求
    NSString *message = [self.itemModel isInvaild];
    // 当没有错误返回值的时候说明可以数据有效
    if (message == nil || message.length == 0)
    {
        [self performSegueWithIdentifier:@"EditUnwindToIndex" sender:self];
    }
    else
    {
        [Utils showMessage:message];
        
    }
    
}

// cancel  按钮事件，回到前一个sence
- (IBAction)goToIndex:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
@end
