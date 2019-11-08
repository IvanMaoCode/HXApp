//
//  UIView+Frame.h
//  weibo
//
//  Created by Kluth on 2019/9/7.
//  Copyright © 2019 Kluth. All rights reserved.
//

#import "UIKit/UIKit.h"

NS_ASSUME_NONNULL_BEGIN
/*
 */
@interface UIView (Frame)
@property CGFloat mjs_width;
@property CGFloat mjs_height;
@property CGFloat mjs_x;
@property CGFloat mjs_y;
@property CGFloat mjs_centerX;
@property CGFloat mjs_centerY;

+(instancetype)mjs_viewFromXib;
@end

NS_ASSUME_NONNULL_END
