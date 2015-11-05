//
//  EditViewController.h
//  Quadrant_Todo_List
//
//  Created by apple on 15/10/25.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ItemModel.h"

@interface EditViewController : UIViewController
// 接受来自主view的数据用于显示
@property ItemModel *itemModel;
@property (weak, nonatomic) IBOutlet UITextField *thing;
@property (weak, nonatomic) IBOutlet UIButton *startTime;

@property (weak, nonatomic) IBOutlet UIButton *endTime;
- (IBAction)selectZYJJ:(id)sender;
- (IBAction)selectZYBJJ:(id)sender;
- (IBAction)selectBZYJJ:(id)sender;
- (IBAction)selectBZYBJJ:(id)sender;

- (IBAction)save:(id)sender;


- (IBAction)goToIndex:(id)sender;

@end
