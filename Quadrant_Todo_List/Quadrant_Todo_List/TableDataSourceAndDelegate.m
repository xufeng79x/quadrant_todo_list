//
//  ZYJJTableDataSourceAndDelegate.m
//  Quadrant_Todo_List
//
//  Created by apple on 15/10/27.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "TableDataSourceAndDelegate.h"
#import "EditViewController.h"

@interface TableDataSourceAndDelegate()
    @property NSMutableArray *data;
    @property NSInteger selectIndex;
    @property ITEMPRIORTY priorty;
    @property UITableView *tv;
@end

@implementation TableDataSourceAndDelegate

// 重构初始化方法
-(id)initWithData:(NSMutableArray *) sourceData AndType:(ITEMPRIORTY) tPriorty
{
    self = [super init];
    if (self)
    {
        NSMutableArray *tempSourceData = sourceData;
        if (nil == tempSourceData)
        {
            tempSourceData = [[NSMutableArray alloc] init];
        }
        self.data = tempSourceData;
        self.priorty = tPriorty;
    }

    return self;
    
}

// 初始化方法
-(id)init
{
    return [self initWithData:nil AndType:ZYJJ];
}

// 邮件
- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath{
    return @"完成";
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.data removeObjectAtIndex:indexPath.row];
    [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath]
                     withRowAnimation:UITableViewRowAnimationAutomatic];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return  30;
}
// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    self.tv = tableView;
    return  self.data.count;
}
// Customize the appearance of table view cells. #pragma mark UITableView data source methods
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"TableCell";
    UITableViewCell *cell = (UITableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    cell.textLabel.text=[[self.data objectAtIndex:indexPath.row] itemName];
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    // 将cell的颜色设置为无，达到和storyborad中设置的tableview背景色一致的效果
    cell.backgroundColor = [ UIColor clearColor ];
    
    return cell;
}

#pragma mark - Table view delegate

- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.selectIndex = indexPath.row;
    return indexPath;
}

-(ItemModel *)getSelectedItem
{
    return [self.data objectAtIndex:self.selectIndex];
}


// 删除数据
-(void)deleteData:(ItemModel *)newModel
{
    if (nil == newModel)
    {
        return;
    }
    ItemModel * temp = nil;
    
    
    for (ItemModel * model in self.data)
    {
        if ([model.id isEqualToString:newModel.id])
        {
            temp = model;
            break;
        }
    }
    
    if (temp)
    {
        [self.data removeObject:temp];
        [self.tv reloadData];
    }
}


// 增加数据
-(void)addData:(ItemModel *)newModel
{
    if (nil == newModel)
    {
        return;
    }
    
    // 增加数据之前需要做统一优先级处理
    [newModel balanceProperty];
    [self.data addObject:newModel];
    [self.tv reloadData];
    
    
}


@end
