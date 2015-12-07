//
//  Utils.h
//  Quadrant_Todo_List
//
//  Created by apple on 15/11/5.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Constants.h"

/**
 *  助手类，提供各种工具方法
 */
@interface Utils : NSObject

/**
 *  TIP信息展示
 *
 *  @param message 需要展示的信息
 */
+(void)showMessage:(NSString *)message;

/**
 *  日期转字符串
 *
 *  @param date 日期
 *
 *  @return 日期字符串
 */
+(NSString *)dateToString:(NSDate *)date withFormat:(NSString *)formator;

/**
 *  字符串转日期
 *
 *  @param dateStr  字符串
 *  @param formator 格式化信息
 *
 *  @return 转换后的日期
 */
+(NSDate *)stringToDate:(NSString *)dateStr withFormat:(NSString *)formator;
@end
