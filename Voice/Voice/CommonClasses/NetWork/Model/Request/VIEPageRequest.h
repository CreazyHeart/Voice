//
//  IHFPageRequest.h
//  IHFnurse
//
//  Created by ihefelocal001 on 16/3/5.
//  Copyright © 2016年 zhanghongwei. All rights reserved.
//

#import "VIEUserIdRequest.h"


/*
 * 网络请求，分页请求数据
 */

@interface VIEPageRequest : VIEUserIdRequest

//每页请求的数量
@property (nonatomic, assign) NSInteger pageSize;

//请求的第几页
@property (nonatomic, assign) NSInteger pageIndex;


@end
