//
//  ItemPersistance.h
//  Quadrant_Todo_List
//
//  Created by apple on 15/11/22.
//  Copyright © 2015年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Constants.h"

@interface ItemPersistance : NSObject
+ (NSMutableArray *) getItemcontentByPriorty:(ITEMPRIORTY)priorty;
+ (int) operatItem:(NSString *)query;
@end
