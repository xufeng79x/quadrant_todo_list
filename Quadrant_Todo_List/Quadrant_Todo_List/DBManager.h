//
//  DBManager.h
//  SQLite3DBSample
//
//  Created by apple on 15/11/24.
//  Copyright © 2015年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DBManager : NSObject

@property (nonatomic) int affectedRows;

@property (nonatomic) long long lastInsertedRowID;


-(instancetype)initWithDatabaseFilename:(NSString *)dbFilename;

-(NSArray *)loadDataFromDB:(NSString *)query;

-(void)executeQuery:(NSString *)query;
@end
