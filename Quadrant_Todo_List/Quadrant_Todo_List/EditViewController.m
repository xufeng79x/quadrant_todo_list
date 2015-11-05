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
        proColor = [UIColor redColor];
    }
    else if (self.itemModel.priority == ZYBJJ)
    {
        proColor = [UIColor orangeColor];
    }
    else if (self.itemModel.priority == BZYJJ)
    {
        proColor = [UIColor yellowColor];
    }
    else if (self.itemModel.priority == BZYBJJ)
    {
        proColor = [UIColor greenColor];
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

// 用户设定项目紧急程度按钮事件
- (IBAction)selectZYJJ:(id)sender {
    self.itemModel.priority=ZYJJ;
    self.thing.backgroundColor = [UIColor redColor];
}

- (IBAction)selectZYBJJ:(id)sender {
    self.itemModel.priority=ZYBJJ;
    self.thing.backgroundColor = [UIColor orangeColor];
}

- (IBAction)selectBZYJJ:(id)sender {
    self.itemModel.priority=BZYJJ;
    self.thing.backgroundColor = [UIColor yellowColor];
}

- (IBAction)selectBZYBJJ:(id)sender {
     self.itemModel.priority=BZYBJJ;
     self.thing.backgroundColor = [UIColor greenColor];
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
    
    
    
    // tips给用户
    
}




// cancel  按钮事件，回到前一个sence
- (IBAction)goToIndex:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
@end
