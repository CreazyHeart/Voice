//
//  VIEViewControllerMgr.h
//  Voice
//
//  Created by 户善新 on 16/6/15.
//  Copyright © 2016年 户善新. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface VIEViewControllerMgr : NSObject

//导航控制器
@property (nonatomic, strong) UINavigationController *mainNavController;


+ (VIEViewControllerMgr*)sharedInstance;
- (UIViewController*)creatRootViewControl;


@end
