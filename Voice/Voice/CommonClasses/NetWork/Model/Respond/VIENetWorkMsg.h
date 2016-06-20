//
//  IHFNetWorkMsg.h
//  IHFnurse
//
//  Created by ihefelocal001 on 16/3/5.
//  Copyright © 2016年 zhanghongwei. All rights reserved.
//

#import "VIENetWorkModel.h"
#import "VIENetWorkMsgReason.h"


/*
 * 网络请求，标记网络是否调用成功，或者失败的信息
 */
@interface VIENetWorkMsg : VIENetWorkModel


//状态码
@property (nonatomic, assign) NSInteger status;


//原因
@property (nonatomic, strong) NSMutableArray *reasons;





@end
