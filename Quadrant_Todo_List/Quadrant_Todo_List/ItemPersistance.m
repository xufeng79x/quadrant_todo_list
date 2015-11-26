//
//  ItemPersistance.m
//  Quadrant_Todo_List
//
//  Created by apple on 15/11/22.
//  Copyright © 2015年 apple. All rights reserved.
//

#import "ItemPersistance.h"
#import "ItemModel.h"
#import "DBManager.h"

@implementation ItemPersistance
+ (NSMutableArray *) getItemcontentByPriorty:(ITEMPRIORTY)priorty
{
    NSMutableArray *connent = [[NSMutableArray alloc] init];
    //  初始化表单内容
    if (ZYJJ == priorty)
    {
        [connent addObject:[[ItemModel alloc] initWithDefault:@"zyjj_1" And:ZYJJ]];
        [connent addObject:[[ItemModel alloc] initWithDefault:@"zyjj_2" And:ZYJJ]];
        [connent addObject:[[ItemModel alloc] initWithDefault:@"zyjj_3" And:ZYJJ]];
        [connent addObject:[[ItemModel alloc] initWithDefault:@"zyjj_4" And:ZYJJ]];
        [connent addObject:[[ItemModel alloc] initWithDefault:@"zyjj_5" And:ZYJJ]];
        [connent addObject:[[ItemModel alloc] initWithDefault:@"zyjj_6" And:ZYJJ]];
        [connent addObject:[[ItemModel alloc] initWithDefault:@"zyjj_7" And:ZYJJ]];
        [connent addObject:[[ItemModel alloc] initWithDefault:@"zyjj_8" And:ZYJJ]];
        [connent addObject:[[ItemModel alloc] initWithDefault:@"zyjj_9" And:ZYJJ]];
        [connent addObject:[[ItemModel alloc] initWithDefault:@"zyjj_10" And:ZYJJ]];
        [connent addObject:[[ItemModel alloc] initWithDefault:@"zyjj_11" And:ZYJJ]];
        [connent addObject:[[ItemModel alloc] initWithDefault:@"zyjj_12" And:ZYJJ]];
    }
    
    if (ZYBJJ == priorty)
    {
        [connent addObject:[[ItemModel alloc] initWithDefault:@"zybjj_1" And:ZYBJJ]];
        [connent addObject:[[ItemModel alloc] initWithDefault:@"zybjj_2" And:ZYBJJ]];
        [connent addObject:[[ItemModel alloc] initWithDefault:@"zybjj_3" And:ZYBJJ]];
        [connent addObject:[[ItemModel alloc] initWithDefault:@"zybjj_4" And:ZYBJJ]];
        [connent addObject:[[ItemModel alloc] initWithDefault:@"zybjj_5" And:ZYBJJ]];
        [connent addObject:[[ItemModel alloc] initWithDefault:@"zybjj_6" And:ZYBJJ]];
        [connent addObject:[[ItemModel alloc] initWithDefault:@"zybjj_7" And:ZYBJJ]];
        [connent addObject:[[ItemModel alloc] initWithDefault:@"zybjj_8" And:ZYBJJ]];
        [connent addObject:[[ItemModel alloc] initWithDefault:@"zybjj_9" And:ZYBJJ]];
        [connent addObject:[[ItemModel alloc] initWithDefault:@"zybjj_10" And:ZYBJJ]];
        [connent addObject:[[ItemModel alloc] initWithDefault:@"zybjj_11" And:ZYBJJ]];
        [connent addObject:[[ItemModel alloc] initWithDefault:@"zybjj_12" And:ZYBJJ]];
    }
    
    if (BZYJJ == priorty)
    {
        [connent addObject:[[ItemModel alloc] initWithDefault:@"bzyjj_1" And:BZYJJ]];
        [connent addObject:[[ItemModel alloc] initWithDefault:@"bzyjj_2" And:BZYJJ]];
        [connent addObject:[[ItemModel alloc] initWithDefault:@"bzyjj_3" And:BZYJJ]];
        [connent addObject:[[ItemModel alloc] initWithDefault:@"bzyjj_4" And:BZYJJ]];
        [connent addObject:[[ItemModel alloc] initWithDefault:@"bzyjj_5" And:BZYJJ]];
        [connent addObject:[[ItemModel alloc] initWithDefault:@"bzyjj_6" And:BZYJJ]];
        [connent addObject:[[ItemModel alloc] initWithDefault:@"bzyjj_7" And:BZYJJ]];
        [connent addObject:[[ItemModel alloc] initWithDefault:@"bzyjj_8" And:BZYJJ]];
        [connent addObject:[[ItemModel alloc] initWithDefault:@"bzyjj_9" And:BZYJJ]];
        [connent addObject:[[ItemModel alloc] initWithDefault:@"bzyjj_10" And:BZYJJ]];
        [connent addObject:[[ItemModel alloc] initWithDefault:@"bzyjj_11" And:BZYJJ]];
        [connent addObject:[[ItemModel alloc] initWithDefault:@"bzyjj_12" And:BZYJJ]];
    }
    
    if (BZYBJJ == priorty)
    {
        [connent addObject:[[ItemModel alloc] initWithDefault:@"bzybjj_1" And:BZYBJJ]];
        [connent addObject:[[ItemModel alloc] initWithDefault:@"bzybjj_2" And:BZYBJJ]];
        [connent addObject:[[ItemModel alloc] initWithDefault:@"bzybjj_3" And:BZYBJJ]];
        [connent addObject:[[ItemModel alloc] initWithDefault:@"bzybjj_4" And:BZYBJJ]];
        [connent addObject:[[ItemModel alloc] initWithDefault:@"bzybjj_5" And:BZYBJJ]];
        [connent addObject:[[ItemModel alloc] initWithDefault:@"bzybjj_6" And:BZYBJJ]];
        [connent addObject:[[ItemModel alloc] initWithDefault:@"bzybjj_7" And:BZYBJJ]];
        [connent addObject:[[ItemModel alloc] initWithDefault:@"bzybjj_8" And:BZYBJJ]];
        [connent addObject:[[ItemModel alloc] initWithDefault:@"bzybjj_9" And:BZYBJJ]];
        [connent addObject:[[ItemModel alloc] initWithDefault:@"bzybjj_10" And:BZYBJJ]];
        [connent addObject:[[ItemModel alloc] initWithDefault:@"bzybjj_11" And:BZYBJJ]];
        [connent addObject:[[ItemModel alloc] initWithDefault:@"bzybjj_12" And:BZYBJJ]];
    }

    return connent;
}



@end
