//
//  ItemModel.m
//  Quadrant_Todo_List
//
//  Created by apple on 15/10/26.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "ItemModel.h"
#import "Utils.h"

@implementation ItemModel

/**
 *  默认构造
 *
 *  @param content item内容
 *  @param priorty 优先级
 *
 *  @return item实例
 */
-(id) initWithDefault:(NSString *) content And:(ITEMPRIORTY) priorty
{
    self = [super init];
    if (self)
    {
        // id生成
        self.id = nil;
        self.itemName = content;
        self.startTime = [[NSDate alloc] init];
        self.endTime = [[NSDate alloc] init];
        self.where = @"sz";
        self.priority = priorty;
        // 初始化的时候两者保持一致
        self.prePriority = self.priority;
        self.isFinish = FALSE;
    }
    
    return self;
}

/**
 *  通过数据库中查询到的数据进行构造
 *
 *  @param rowDict 每一行数据的字典结构
 *
 *  @return 转换后的item实例
 */
-(id) initWithDBResult:(NSDictionary *)rowDict
{
    self = [super init];
    if (self)
    {
        // id生成
        self.id = [rowDict objectForKey:@"id"];
        
        // 内容
        self.itemName = [rowDict objectForKey:@"itemName"];
        
        // 开始时间
        self.startTime = [Utils stringToDate:[rowDict objectForKey:@"startTime"] withFormat:@"yyyy-MM-dd HH:mm:ss"];
        
        // 结束时间
        self.endTime = [Utils stringToDate:[rowDict objectForKey:@"endTime"] withFormat:@"yyyy-MM-dd HH:mm:ss"];
                        self.where = [rowDict objectForKey:@"address"];
        
        // 优先级
        self.priority = [[rowDict objectForKey:@"priorty"] intValue];
        
        // 初始化的时候两者保持一致
        self.prePriority = self.priority;
    }
    
    return self;
}

/**
 *  重写当前的init方法
 *
 *  @return <#return value description#>
 */
-(id) init
{
    return [self initWithDefault:@"" And:ZYJJ];
}

- (NSString *)isDateInvaild
{
    if (self.startTime == nil)
    {
        return @"please input the startTime!";
    }
    
    if (self.endTime == nil)
    {
        return @"please input the endTime!";
    }
    
    // 当开始时间晚于结束时间则报错
    if ([self.startTime compare:self.endTime] == NSOrderedDescending)
    {
        return @"The start time is later than end time!";
    }
    
    return nil;
}

/**
 *  检查当前数据是否有效
 *
 *  @return  nil：有效 非nil：具体错误信息
 */
-(NSString *) isInvaild
{
    if (self.itemName.length == 0)
    {
        return @"please input the item!";
    }
    
    return [self isDateInvaild];
    
}



/**
 *  查看优先级别是否已经被修改过
 *
 *  @return true:已经被修改  false：未被修改
 */
- (BOOL) isPropertyChanged
{
    return !(self.prePriority == self.priority);
    
}

/**
 *  将前优先级设定为当前优先级
 */
- (void) balanceProperty
{
    self.prePriority = self.priority;
}

@end
