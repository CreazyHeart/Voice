//
//  IHFNetWorkRequest.h
//  IHFnurse
//
//  Created by ihefelocal001 on 16/3/5.
//  Copyright © 2016年 zhanghongwei. All rights reserved.
//

#import "VIENetWorkModel.h"
#import "VIENetWorkMacros.h"




/*
 * 整个项目中所有 网络请求ModeL类的基类
 */
@interface VIENetWorkRequest : VIENetWorkModel


//接口地址
@property (nonatomic, copy) NSString *requestWebApi;

//请求方式 GET or POST
@property (nonatomic, copy) NSString *requestType;

//请求 token
@property (nonatomic, copy) NSString *access_token;

/*
//手机类型
@property (nonatomic, copy) NSString *phoneType;

//是否正在加载（yes:正在加载 ）
@property (nonatomic, assign) BOOL isLoading;
*/


//过滤后 的参数
- (NSMutableDictionary*)dicParamsIgnoredKeys;


@end

































