//
//  IHF_errorCode.h
//  IHFmedicine
//
//  Created by ihefelocal001 on 16/3/15.
//  Copyright © 2016年 zhanghongwei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VIE_ErrorCode : NSObject



+ (void)showErrorMsg:(NSString*)errorCode message:(NSString*)message;


+ (NSString*)paraErrorCode:(NSString*)errorCode message:(NSString*)message;


@end
