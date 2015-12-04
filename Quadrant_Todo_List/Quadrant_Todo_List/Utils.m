//
//  Utils.m
//  Quadrant_Todo_List
//
//  Created by apple on 15/11/5.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "Utils.h"
#import "IndexViewController.h"

static int SCREEN_HEIGHT = 667;
static int SCREEN_WIDTH = 375;

@implementation Utils


/**
 *  淡化用提示框实现
 *
 *  @param message 提示信息
 */
+(void)showMessage:(NSString *)message
{
    UIWindow * window = [UIApplication sharedApplication].keyWindow;
    UIView *showview =  [[UIView alloc]init];
    showview.backgroundColor = [UIColor blackColor];
    showview.frame = CGRectMake(1, 1, 1, 1);
    showview.alpha = 1.0f;
    showview.layer.cornerRadius = 5.0f;
    showview.layer.masksToBounds = YES;
    [window addSubview:showview];
    
    UILabel *label = [[UILabel alloc]init];
    CGSize LabelSize = [message sizeWithFont:[UIFont systemFontOfSize:17] constrainedToSize:CGSizeMake(290, 9000)];
    label.frame = CGRectMake(10, 5, LabelSize.width, LabelSize.height);
    label.text = message;
    label.textColor = [UIColor whiteColor];
    label.textAlignment = 1;
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont boldSystemFontOfSize:15];
    [showview addSubview:label];
    showview.frame = CGRectMake((SCREEN_WIDTH - LabelSize.width)/2, SCREEN_HEIGHT - 100, LabelSize.width+20, LabelSize.height+10);
    [UIView animateWithDuration:1.5 animations:^{
        showview.alpha = 0;
    } completion:^(BOOL finished) {
        [showview removeFromSuperview];
    }];
}

+(NSDate *)stringToDate:(NSString *)dateStr withFormat:(NSString *)formator
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat : formator];
    
    return [formatter dateFromString:dateStr];
}


+(NSString *)dateToString:(NSDate *)date withFormat:(NSString *)formator
{
    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    [format setDateFormat:formator];
    return [format stringFromDate:date];
}






@end
