//
//  ViewController.h
//  Quadrant_Todo_List
//
//  Created by apple on 15/10/20.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IndexViewController : UIViewController

@property (weak, nonatomic) IBOutlet UINavigationItem *navBar;

/**
 *  各个按钮事件
 *
 */
- (IBAction)expandZyjjArea:(id)sender;
- (IBAction)expandZybjjArea:(id)sender;
- (IBAction)expandBzyjjArea:(id)sender;
- (IBAction)expandBzybjjArea:(id)sender;


/**
 *  各个按钮view
 */
@property (weak, nonatomic) IBOutlet UIButton *zyjjBt;
@property (weak, nonatomic) IBOutlet UIButton *zybjjBt;
@property (weak, nonatomic) IBOutlet UIButton *bzyjjBt;
@property (weak, nonatomic) IBOutlet UIButton *bzybjjBt;


/**
 *  各个tableview
 */

@property (weak, nonatomic) IBOutlet UITableView *zyjj;
@property (weak, nonatomic) IBOutlet UITableView *zybjj;
@property (weak, nonatomic) IBOutlet UITableView *bzyjj;
@property (weak, nonatomic) IBOutlet UITableView *bzybjj;

/**
 *  返回按钮，让UI恢复到初始状态
 */
@property (weak, nonatomic) IBOutlet UIButton *returnBtn;
- (IBAction)returndefaultUI:(id)sender;

@end

