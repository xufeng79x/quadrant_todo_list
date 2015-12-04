//
//  ItemModel.h
//  Quadrant_Todo_List
//
//  Created by apple on 15/10/26.
//  Copyright (c) 2015年 apple. All rights reserved.
//

// 定义待办事项的数据类型
#import <Foundation/Foundation.h>
#import "Constants.h"


@interface ItemModel : NSObject

@property NSString *id;

// item名称（内容）
@property NSString *itemName;

// 设定开始时间
@property NSDate *startTime;

// 设定结束时间
@property NSDate *endTime;

// 地点；后续接入地图使用
@property NSString *where;

// 任务优先级
@property ITEMPRIORTY priority;

// 原始的优先级，在用户编辑阶段可能改变优先级别，这时候需要删除原有数组内容
// 任务优先级
@property ITEMPRIORTY prePriority;

// 是否完成
@property BOOL isFinish;

// 自定义初始化方法
-(id) initWithDefault:(NSString *) content And:(ITEMPRIORTY) priorty;

// 通过数据库中查询到的数据进行构造
-(id) initWithDBResult:(NSDictionary *)rowDict;

// 重写初始化方法
-(id) init;

// 查看当前数据是否有效
-(NSString *) isInvaild;

// 查看当前日期是否符合规定
- (NSString *)isDateInvaild;

//查看优先级别是否已经被修改过
- (BOOL) isPropertyChanged;

// 将前优先级设定为当前优先级
- (void) balanceProperty;



@end
