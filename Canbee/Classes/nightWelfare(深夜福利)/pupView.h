//
//  pupView.h
//  用户登录
//
//  Created by Kluth on 2019/11/7.
//  Copyright © 2019 yu_jing_shan. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface pupView : UIView
/**
 自己选择显示在那个view展示从底部向上弹出的UIView（包含遮罩）
 @param view self.view OR [UIApplication sharedApplication].keyWindow
 */
-(void)coutomshowInView:(UIView *)view;
/**
 展示从底部向上弹出的UIView（包含遮罩）
 */
-(void)showInView;
/**
 移除从底部向上弹出的UIView（包含遮罩）
 */
-(void)dismissView;
@end

NS_ASSUME_NONNULL_END
