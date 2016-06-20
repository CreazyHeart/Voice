//
//  VIEViewControllerMgr.m
//  Voice
//
//  Created by 户善新 on 16/6/15.
//  Copyright © 2016年 户善新. All rights reserved.
//

#import "VIEViewControllerMgr.h"
#import "VIELoginViewController.h"

@interface VIEViewControllerMgr ()


@property (nonatomic, strong) VIELoginViewController *loginViewContrl;



@end


@implementation VIEViewControllerMgr


+ (VIEViewControllerMgr *)sharedInstance
{
    static VIEViewControllerMgr *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[VIEViewControllerMgr alloc] init];
    });
    return instance;
}

//创建根试图
- (UIViewController*)creatRootViewControl
{
    self.loginViewContrl = [[VIELoginViewController alloc] init];
    self.mainNavController = [[UINavigationController alloc] initWithRootViewController:self.loginViewContrl];
    //不带有自带的滑动返回
    self.mainNavController.navigationBarHidden = YES;
    //带有自带的滑动返回
//    self.mainNavController.navigationBar.hidden = YES;
    
    
    return self.mainNavController;
}

@end
