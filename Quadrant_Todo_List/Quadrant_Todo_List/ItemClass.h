//
//  ItemClass.h
//  Quadrant_Todo_List
//
//  Created by apple on 15/11/10.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

// 区别当前任务的组别
@interface ItemClass : NSObject

// 组id
@property NSString * id;

// 组名
@property NSString *name;

// 组logo
@property NSString *logo;

// 组描述
@property NSString *desc;
@end
