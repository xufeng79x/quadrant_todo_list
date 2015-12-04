//
//  EditTableViewController.h
//  Quadrant_Todo_List
//
//  Created by apple on 15/11/23.
//  Copyright © 2015年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ItemModel.h"

/**
 *  项目设定controller
 */
@interface EditTableViewController : UITableViewController

/**
 *  接受来自index页面的项目数据
 */
@property (nonatomic,strong) ItemModel *itemModel;
@property (weak, nonatomic) IBOutlet UITextField *inputLab;
@property (weak, nonatomic) IBOutlet UIButton *zyjjBtn;
@property (weak, nonatomic) IBOutlet UIButton *zybjjBtn;
@property (weak, nonatomic) IBOutlet UIButton *bzyjjBtn;
@property (weak, nonatomic) IBOutlet UIButton *bzybjjBtn;
@property (weak, nonatomic) IBOutlet UILabel *infoLab;
@property (weak, nonatomic) IBOutlet UIButton *timebtn;
- (IBAction)zyjjClick:(id)sender;

- (IBAction)zybjjClick:(id)sender;

- (IBAction)bzyjjClick:(id)sender;

- (IBAction)bzybjjClick:(id)sender;


- (IBAction)timeBtnClick:(id)sender;

- (IBAction)save:(id)sender;

@end
