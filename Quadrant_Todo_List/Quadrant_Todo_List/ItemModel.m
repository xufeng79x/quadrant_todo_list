//
//  ItemModel.m
//  Quadrant_Todo_List
//
//  Created by apple on 15/10/26.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "ItemModel.h"

@implementation ItemModel

-(id) initWithDefault:(NSString *) content And:(ITEMPRIORTY) priorty
{
    self = [super init];
    if (self)
    {
        // id生成
        self.id = [[NSUUID UUID] UUIDString];
        self.itemName = content;
        self.startTime = [[NSDate alloc] init];
        self.endTime = [[NSDate alloc] init];
        self.priority = priorty;
        // 初始化的时候两者保持一致
        self.prePriority = self.priority;
        self.isFinish = FALSE;
    }
    
    return self;
}

-(id) init
{
    return [self initWithDefault:@"" And:ZYJJ];
}

// 检查当前数据是否有效
-(NSString *) isInvaild
{
    if (self.itemName.length == 0)
    {
        return @"please input the item!";
    }
    
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


//查看优先级别是否已经被修改过
- (BOOL) isPropertyChanged
{
    return !(self.prePriority == self.priority);
    
}

// 将前优先级设定为当前优先级
- (void) balanceProperty
{
    self.prePriority = self.priority;
}

@end
