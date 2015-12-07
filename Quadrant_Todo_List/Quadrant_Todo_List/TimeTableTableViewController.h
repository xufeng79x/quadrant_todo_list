//
//  TimeTableTableViewController.h
//  Quadrant_Todo_List
//
//  Created by apple on 15/12/1.
//  Copyright © 2015年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ItemModel.h"

/**
 *  开始时间与结束时间选择界面
 */
@interface TimeTableTableViewController : UITableViewController

/**
 *  传递用结构变量
 */
@property(strong, nonatomic) ItemModel *itemModel;
@end
