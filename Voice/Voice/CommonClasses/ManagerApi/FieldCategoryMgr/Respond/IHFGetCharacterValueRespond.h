//
//  IHFGetCharacterValueRespond.h
//  IHFmedicine
//
//  Created by ihefe on 16/5/6.
//  Copyright © 2016年 zhanghongwei. All rights reserved.
//

#import "VIENetWorkModel.h"

@interface IHFGetCharacterValueRespond : VIENetWorkModel
/**
 *  代号
 */
@property (copy, nonatomic) NSString *f_code;

/**
 *  值
 */
@property (copy, nonatomic) NSString *f_value;

/**
 *  数据说明
 */
@property (copy, nonatomic) NSString *flag;


@property (strong, nonatomic) NSMutableArray *infos;



@end
