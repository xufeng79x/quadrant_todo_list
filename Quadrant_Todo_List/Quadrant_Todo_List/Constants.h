//
//  Constants.h
//  Quadrant_Todo_List
//
//  Created by apple on 15/10/29.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#ifndef Quadrant_Todo_List_Constants_h
#define Quadrant_Todo_List_Constants_h

#define IPHONE6_WIDTH 375

/**
 紧急程度定义
 */
typedef enum {
    ZYJJ,
    ZYBJJ,
    BZYJJ,
    BZYBJJ
} ITEMPRIORTY;


/**
 定义当前主页UI处于何种状态
 ZYJJ_UI：重要紧急tabe处于最大化状态
 ...以此类推
 */
typedef enum {
    NONE_UI,
    ZYJJ_UI,
    ZYBJJ_UI,
    BZYJJ_UI,
    BZYBJJ_UI
} INDEXUISTATUS;

/**
 事件事件空间选择标记
 */
typedef enum {
    START,
    END
} TIMESELECTOR;

typedef enum
{
    IPhone4,
    IPHone5,
    IPhone6
}DEVICETYPE;




#endif
