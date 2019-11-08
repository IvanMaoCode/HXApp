//
//  pupView.m
//  用户登录
//
//  Created by Kluth on 2019/11/7.
//  Copyright © 2019 yu_jing_shan. All rights reserved.
//

#import "pupView.h"

#define MJSSreenH [UIScreen mainScreen].bounds.size.height
#define MJSSreenW [UIScreen mainScreen].bounds.size.width
#define MJSColor(r,g,b) [UIColor colorWithRed:r/256.0 green:g/256.0 blue:b/256.0 alpha:1];
@interface pupView()
{
	UIView * yjlview;
}

@end
@implementation pupView

-(instancetype)initWithFrame:(CGRect)frame{
	if (self == [super initWithFrame:frame]) {
		[self initview];
	}
	return self;
}

-(void)initview{
	
	self.frame = CGRectMake(0, 0,MJSSreenW , MJSSreenH);
	self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.4];
	self.userInteractionEnabled = YES;
	[self addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissView)]];
	if (yjlview == nil) {
		yjlview = [[UIView alloc]initWithFrame:CGRectMake(0, MJSSreenH, MJSSreenW, MJSSreenH)];
		yjlview.backgroundColor =  MJSColor(42, 62, 80);
		[self addSubview:yjlview];
		
		UIButton *btn1 = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, MJSSreenW/4, MJSSreenW/4)];
		[btn1 setImage:[UIImage imageNamed:@"placeholder"] forState:UIControlStateNormal];
		btn1.backgroundColor = MJSColor(0, 62, 80);
		[btn1 addTarget:self action:@selector(btn1) forControlEvents:UIControlEventTouchUpInside];
		[self->yjlview addSubview:btn1];
		
		UIButton *btn2 = [[UIButton alloc] initWithFrame:CGRectMake(MJSSreenW/4, 0, MJSSreenW/4, MJSSreenW/4)];
		[btn2 setImage:[UIImage imageNamed:@"placeholder"] forState:UIControlStateNormal];
		btn2.backgroundColor = MJSColor(0, 62, 80);
		[btn2 addTarget:self action:@selector(btn1) forControlEvents:UIControlEventTouchUpInside];
		[self->yjlview addSubview:btn2];
		
		UIButton *btn3 = [[UIButton alloc] initWithFrame:CGRectMake(MJSSreenW/4*2, 0, MJSSreenW/4, MJSSreenW/4)];
		[btn3 setImage:[UIImage imageNamed:@"placeholder"] forState:UIControlStateNormal];
		btn3.backgroundColor = MJSColor(0, 62, 80);
		[btn3 addTarget:self action:@selector(btn1) forControlEvents:UIControlEventTouchUpInside];
		[self->yjlview addSubview:btn3];
		
		UIButton *btn4 = [[UIButton alloc] initWithFrame:CGRectMake(MJSSreenW/4*3, 0, MJSSreenW/4, MJSSreenW/4)];
		[btn4 setImage:[UIImage imageNamed:@"placeholder"] forState:UIControlStateNormal];
		btn4.backgroundColor = MJSColor(0, 62, 80);
		[btn4 addTarget:self action:@selector(btn1) forControlEvents:UIControlEventTouchUpInside];
		[self->yjlview addSubview:btn4];
	}
}
-(void)btn1{
	NSLog(@"点击了button");//46 62 80
}

- (void)coutomshowInView:(UIView *)view{
	if (!view){
		return;
	}
	[view addSubview:self];
	[view addSubview:yjlview];
	[yjlview setFrame:CGRectMake(0, MJSSreenH, MJSSreenW, 216)];
	[UIView animateWithDuration:0.3 animations:^{
		self.alpha = 1.0;
		[self->yjlview setFrame:CGRectMake(0, MJSSreenH - 216, MJSSreenW, 216)];
	} completion:nil];
}

- (void)showInView{
	[[UIApplication sharedApplication].keyWindow addSubview:self];
	[[UIApplication sharedApplication].keyWindow addSubview:yjlview];
	[yjlview setFrame:CGRectMake(0, MJSSreenH, MJSSreenW, 216)];
	[UIView animateWithDuration:0.3 animations:^{
		self.alpha = 1.0;
		[self->yjlview setFrame:CGRectMake(0, MJSSreenH - 216, MJSSreenW, 216)];
	} completion:nil];
}

- (void)dismissView{
	[yjlview setFrame:CGRectMake(0, MJSSreenH - 216, MJSSreenW, 216)];
	[UIView animateWithDuration:0.3f
					 animations:^{
						 self.alpha = 0.0;
						 
						 [self->yjlview setFrame:CGRectMake(0, MJSSreenH, MJSSreenW, 216)];
					 }
					 completion:^(BOOL finished){
						 [self removeFromSuperview];
						 [self->yjlview removeFromSuperview];
						 
					 }];
}
@end
