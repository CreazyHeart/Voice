//
//  IHF_Tools.h
//  IHFmedicine
//
//  Created by ihefelocal001 on 16/3/15.
//  Copyright © 2016年 zhanghongwei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface VIE_Tools : NSObject


/*
 * 生成随机的UUID
 */
+ (NSString*)uuidString;

/*
 * 生成 8位 UUID
 */
+ (NSString*)uuid_8Point;

/*
 * 计算字符串的大小
 */
+ (CGSize)calculateStringSize:(NSString*)text font:(UIFont*)font maxSize:(CGSize)maxSize mode:(NSLineBreakMode)mode;

/*
 * 十六进制颜色值转换成UIColor对象
 */
+ (UIColor *)hexStringToColor:(NSString *)stringToConvert;

/*
 *  使用UIColor创建UIImage
 */
+ (UIImage *)createImageWithColor:(UIColor *)color;


@end































