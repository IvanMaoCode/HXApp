//
//  HXTabBar.m
//  Canbee
//
//  Created by Kluth on 2019/11/2.
//  Copyright © 2019 yu_jing_shan. All rights reserved.
//

#import "HXTabBar.h"
@interface HXTabBar()
@property(nonatomic,weak) UIButton *plusButton;
//上一次的点击按钮
@property(nonatomic,weak) UIControl *previousClickedTabBarButton;
@end

@implementation HXTabBar


- (void)layoutSubviews{
	[super layoutSubviews];
	//跳转tabBarButton
	NSLog(@"%@",self.subviews);
	
	NSInteger count = self.items.count;
	//CGFloat btnW = self.bounds.size.width / (count + 1);
	CGFloat btnW = self.mjs_width / (count);
	CGFloat btnH = self.mjs_height;
	CGFloat x = 0;
	int i = 0;
	//苹果私有类
	//遍历子控件 调整布局
	for(UIView *tabBarButton in self.subviews){
		if([tabBarButton isKindOfClass:NSClassFromString(@"UITabBarButton")]){
			//默认值previousClickedTabBarButton为最前面的b按钮
//			if(i == 0 && self.previousClickedTabBarButton == nil){
//				self.previousClickedTabBarButton = tabBarButton;
//			}
//			if(i == 2){
//				i += 1;
//			}
//			x = i * btnW;
//			tabBarButton.frame = CGRectMake(x, 0, btnW, btnH);
//			i++;
//			//NSLog(@"%@",tabBarButton);
//			//监听点击
//			[tabBarButton addTarget:self action:@selector(tabBarButtonClick:) forControlEvents:UIControlEventTouchUpInside];
	//
			x = i *btnW;
			tabBarButton.frame = CGRectMake(x, 0, btnW,btnH);
			i++;
		}
	}
	//调整发布按钮的位置
//	self.plusButton.center = CGPointMake(self.mjs_width * 0.5, self.mjs_height * 0.5);
}

-(void)tabBarButtonClick:(UIControl *)tarBarButton{
	if(self.previousClickedTabBarButton == tarBarButton){
		
		//发出通知
		[[NSNotificationCenter defaultCenter] postNotificationName:@"notice" object:nil];
	}
	self.previousClickedTabBarButton = tarBarButton;
}
@end
