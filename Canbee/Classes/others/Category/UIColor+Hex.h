//
//  UIColor+Hex.h
//  Canbee
//
//  Created by Kluth on 2019/10/30.
//  Copyright © 2019 yu_jing_shan. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (Hex)
//默认alpha为1
+(UIColor *)colorWithHexString:(NSString *)color;
//从十六进制字符串获取颜色
//color支持:@"#123456"、@“0X123456"、@“123456”三种格式
+(UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;
@end

NS_ASSUME_NONNULL_END
