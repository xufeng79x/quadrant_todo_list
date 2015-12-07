//
//  ZYJJTableDataSourceAndDelegate.h
//  Quadrant_Todo_List
//
//  Created by apple on 15/10/27.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "ItemModel.h"
#import "Constants.h"

@interface TableDataSourceAndDelegate : NSObject<UITableViewDataSource,UITableViewDelegate>
-(id)initWithData:(NSMutableArray *) sourceData AndType:(ITEMPRIORTY) tPriorty;
-(id)init;
-(ItemModel *)getSelectedItem;
-(void)deleteData:(ItemModel *)moodel;
-(void)addData:(ItemModel *)newModel;


@end


