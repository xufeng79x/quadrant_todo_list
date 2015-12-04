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
/**
 *  根据优先级取得对应的item数据
 *
 *  @param tPriorty 优先级
 *
 *  @return 当前优先级下的所有未完成item
 */
+ (NSMutableArray *) getItemcontentByPriorty:(ITEMPRIORTY)tPriorty
{
    // 查询语句
    NSString *query =[NSString stringWithFormat: @"select * from ItemModel where priority = %d", tPriorty ];
    
    // 数据库客户端操作-打开
    DBManager *dbm = [[DBManager alloc] initWithDatabaseFilename:@"quadrant.sql"];
    
    // 数据库客户端操作-查询
    NSArray  *result = [dbm loadDataFromDB:query];
    ItemModel *loopItem = nil;
    
    // 每行既是一个item，将其转化为具体的对象
    NSMutableArray *resultArray = [[NSMutableArray alloc] init];
    for (NSDictionary *rowDict in result)
    {
        loopItem = [[ItemModel alloc] initWithDBResult:rowDict];
        [resultArray addObject:loopItem];
    }

    return resultArray;
}



@end
