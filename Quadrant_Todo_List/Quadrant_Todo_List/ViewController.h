//
//  ViewController.h
//  Quadrant_Todo_List
//
//  Created by apple on 15/10/20.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *currentDate;
@property (weak, nonatomic) IBOutlet UIImageView *userInfoMage;
@property (weak, nonatomic) IBOutlet UITableView *zyjj;

@property (weak, nonatomic) IBOutlet UITableView *zybjj;
@property (weak, nonatomic) IBOutlet UITableView *bzyjj;
@property (weak, nonatomic) IBOutlet UITableView *bzybjj;
- (IBAction)add:(id)sender;
@property (weak, nonatomic) IBOutlet UINavigationBar *mybar;
@property (weak, nonatomic) IBOutlet UIImageView *mybarimage;

@end

