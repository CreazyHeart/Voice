//
//  IHFNetWorkMsgReason.h
//  IHFmedicine
//
//  Created by ihefelocal001 on 16/4/19.
//  Copyright © 2016年 zhanghongwei. All rights reserved.
//

#import "VIENetWorkModel.h"

@interface VIENetWorkMsgReason : VIENetWorkModel


//错误码
@property (nonatomic, copy) NSString *code;

//错误信息
@property (nonatomic, copy) NSString *message;



@end
