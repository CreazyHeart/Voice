//
//  IHF_Macros.h
//  IHFnurse
//
//  Created by ihefelocal001 on 16/3/6.
//  Copyright © 2016年 zhanghongwei. All rights reserved.
//

/*
 * 定义和当前项目相关的宏
 */

#ifndef IHF_Macros_h
#define IHF_Macros_h

#import "SQLiteVersion.h"

/// Document dir
#define APP_PATH_DOCUMENT	 [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"]

/// 本地主数据库完整路径
#define LOCAL_MAIN_DB_PATH   [APP_PATH_DOCUMENT stringByAppendingPathComponent:LOCAL_MAIN_DB_NAME]


//企业id
#define Enterprise_id       @"shfk"

//子系统类型
#define Subsys_type         @"mobile_pharmacy"








#endif /* IHF_Macros_h */














