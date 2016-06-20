//
//  IHFMedicineInstructionsMgr.h
//  IHFmedicine
//
//  Created by ihefelocal001 on 16/5/26.
//  Copyright © 2016年 zhanghongwei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VIENetWork.h"


//药品分类
#import "IHFMedicIndexRequest.h"
#import "IHFMedicIndexRespond.h"

//药品列表，带有厂家信息
#import "IHFMedicSearchInstrRequest.h"
#import "IHFMedicSearchInstrRespond.h"


//修改 药品 说明书
#import "IHFModifyMedicInstrRequest.h"

//
#import "IHFMedicSearchRequest.h"
#import "IHFMedicSearchRespond.h"




@interface IHFMedicineInstructionsMgr : NSObject


+ (instancetype)sharedInstance;


//获取药品分类
- (void)medicIndex:(IHFMedicIndexRequest *)request success:(requestSuccessBlock)success failure:(requestFailureBlock)failure;

//药品列表，带有厂家信息，包含说明书
- (void)medicSearchInstruction:(IHFMedicSearchInstrRequest *)request success:(requestSuccessBlock)success failure:(requestFailureBlock)failure;

//修改 药品 说明书
- (void)modifyMedicInstruction:(IHFModifyMedicInstrRequest *)request success:(requestSuccessBlock)success failure:(requestFailureBlock)failure;

//药品 搜索
- (void)medicSearch:(IHFMedicSearchRequest *)request success:(requestSuccessBlock)success failure:(requestFailureBlock)failure;

@end















