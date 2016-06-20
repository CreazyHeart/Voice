//
//  VIENetWorkModel.h
//  Voice
//
//  Created by 户善新 on 16/6/15.
//  Copyright © 2016年 户善新. All rights reserved.
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
