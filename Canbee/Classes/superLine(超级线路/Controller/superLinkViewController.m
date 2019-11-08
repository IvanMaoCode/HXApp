//
//  superLinkViewController.m
//  Canbee
//
//  Created by Kluth on 2019/11/1.
//  Copyright © 2019 yu_jing_shan. All rights reserved.
//

#import "superLinkViewController.h"
#import "loginRegisterViewController.h"
#import "insallAppViewController.h"

@interface superLinkViewController ()<CustomIOSAlertViewDelegate>
@property (weak, nonatomic) IBOutlet UIView *topBarView;
@property (weak, nonatomic) IBOutlet UIButton *linkBtn;
@property (weak, nonatomic) IBOutlet UIButton *btn1;
@property (weak, nonatomic) IBOutlet UIButton *btn2;
@property (weak, nonatomic) IBOutlet UIButton *btn;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmenView;
@property (nonatomic,strong) UIView *addView;
//选择按钮
@property(nonatomic,assign)NSInteger buttonSelect;
//改变字符串
@property(nonatomic,strong)NSString *Str;
//提醒用户登录弹窗
@property(nonatomic,strong) CustomIOSAlertView *alertView;

@end

@implementation superLinkViewController
//- (NSInteger)buttonSelect{
//	if(!_buttonSelect){
//		NSInteger buttonSelect = 0;
//		_buttonSelect = buttonSelect;
//	}
//	return _buttonSelect;
//}

- (CustomIOSAlertView *)alertView{
	if(_alertView == nil){
		CustomIOSAlertView *alertView = [[CustomIOSAlertView alloc] init];
		_alertView = alertView;
	}
	return _alertView;
}
- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view from its nib.
	self.segmenView.layer.borderWidth = 1;
	self.segmenView.backgroundColor = [UIColor clearColor];
	//	self.segmenView.tintColor = [UIColor whiteColor];
	self.segmenView.layer.borderColor = [[UIColor whiteColor] CGColor];
	self.segmenView.layer.cornerRadius = 4.5;
	//设置选中颜色
	NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName,nil];
	[self.segmenView setTitleTextAttributes:dic forState:UIControlStateSelected];
	//	//设置默认颜色
	NSDictionary *dics = [NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName,nil];
	[self.segmenView setTitleTextAttributes:dics forState:UIControlStateNormal];
	
	self.linkBtn.mjs_width = 100;
	self.linkBtn.layer.borderWidth = 1;
	self.linkBtn.layer.borderColor = [[UIColor yellowColor] CGColor];
	self.linkBtn.layer.cornerRadius = 14.5;
	
	self.btn1.layer.borderWidth = 1;
	self.btn1.layer.borderColor = [[UIColor colorWithRed:108/255.0 green:167/255.0 blue:47/255.0 alpha:1] CGColor ];
	self.btn1.layer.cornerRadius = 12.3;
	[self.btn1 addTarget:self action:@selector(allert) forControlEvents:UIControlEventTouchUpInside];
	
	self.btn2.layer.borderWidth = 1;
	self.btn2.layer.borderColor = [[UIColor colorWithRed:196/255.0 green:170/255.0 blue:106/255.0 alpha:1] CGColor ];
	self.btn2.layer.cornerRadius = 12.3;
	self.btn2.backgroundColor = [UIColor colorWithRed:196/255.0 green:170/255.0 blue:106/255.0 alpha:1];
	[self.btn2 addTarget:self action:@selector(allert) forControlEvents:UIControlEventTouchUpInside];
	[self.btn2 setTag:1];
	
	
	self.btn.layer.borderWidth = 1;
	self.btn.layer.borderColor = [[UIColor colorWithRed:108/255.0 green:167/255.0 blue:47/255.0 alpha:1] CGColor ];
	self.btn.layer.cornerRadius = 12.3;
	[self.btn addTarget:self action:@selector(allert) forControlEvents:UIControlEventTouchUpInside];
	
	//设置打开页面默认为黄金线路
	[self addnewView];
}
//点击热门开通按钮
-(void)allert{
	self.buttonSelect = 1;
	NSLog(@"点击了热门开通按钮");
	//如果用户没有登录提醒用户登录
	[self loginAllert];
}
//点击复制链接按钮
- (IBAction)copyLinkBtn:(id)sender {
	[self.linkBtn setTag:2];
	self.buttonSelect = 2;
	[self loginAllert];
}
#pragma - mark CustomIOSAlertViewDelegate
- (void)customIOS7dialogButtonTouchUpInside: (CustomIOSAlertView *)alertView clickedButtonAtIndex: (NSInteger)buttonIndex
{
	NSLog(@"Delegate: Button at position %d is clicked on alertView %d.", (int)buttonIndex, (int)[alertView tag]);
	[alertView close];
}
-(void)loginAllert{
	// Here we need to pass a full frame
	// Add some custom content to the alert view
	[self.alertView setContainerView:[self loginBtnView]];
	
	// Modify the parameters
	[self.alertView setButtonTitles:[NSMutableArray arrayWithObjects: @"取消", nil]];

	[self.alertView setDelegate:self];
	
	// You may use a Block, rather than a delegate.
	[self.alertView setOnButtonTouchUpInside:^(CustomIOSAlertView *alertView, int buttonIndex) {
		NSLog(@"Block: Button at position %d is clicked on alertView %d.", buttonIndex, (int)[alertView tag]);
		[alertView close];
	}];
	[self.alertView setUseMotionEffects:true];
	// And launch the dialog
	[self.alertView show];
}
-(UIView *)loginBtnView{
	UIView *demoView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 243, 153)];
	//	demoView.backgroundColor = [UIColor grayColor];
	demoView.layer.borderWidth = 0;
	demoView.layer.cornerRadius = 1.4;
	if(self.buttonSelect == 1){
	self.Str = @"需要登陆后才能购买";
	}else{
		self.Str = @"需要登录后才能复制";
	}
	UILabel *noticeLabel = [[UILabel alloc] initWithFrame:CGRectMake(243/2-76, 40, 200, 13.5)];
	noticeLabel.text = self.Str;
	
	UIButton *loginBtn = [[UIButton alloc] initWithFrame:CGRectMake(243/2-91/2, 100, 91, 36)];
	[loginBtn setImage:[UIImage imageNamed:@"loginNow2x"] forState:UIControlStateNormal];
	[loginBtn addTarget:self action:@selector(loginView) forControlEvents:UIControlEventTouchUpInside];
	
	
	[demoView addSubview:loginBtn];
	[demoView addSubview:noticeLabel];
	return demoView;
}
//点击登录按钮跳转到登录页面
-(void)loginView{
	loginRegisterViewController *loginVc = [[loginRegisterViewController alloc] init];
	
	[self presentViewController:loginVc animated:YES completion:^{
		NSLog(@"跳转到登录页面");
	}];
}
- (IBAction)superLinjkViewback:(id)sender {
	
//	[self.navigationController popoverPresentationController];
	[self dismissViewControllerAnimated:YES completion:^{
		NSLog(@"关闭当前窗口完成");
	}];

}
- (IBAction)changesegment:(id)sender {
	switch ([(UISegmentedControl *)sender selectedSegmentIndex]) {
		case 1:
			NSLog(@"点击了黄金线路");
			[self.addView removeFromSuperview];
			break;
		case 0:
			NSLog(@"点击了超级线路");
//			[self alertbuy];
			[self addnewView];
			break;
			
		default:
			break;
	}
}
-(void)addnewView{
	self.addView = [[UIView alloc]initWithFrame:CGRectMake(0,93.5, MJSSreenW, MJSSreenH - 93.5)];
	self.addView.backgroundColor = MJSColor(248, 248, 248);
	//解锁免费使用
	UIButton *openBtn = [[UIButton alloc] initWithFrame:CGRectMake(MJSSreenW/2 - 85.5, 80, 171, 65)];
	openBtn.layer.cornerRadius = 10.5;
	openBtn.backgroundColor = [UIColor clearColor];
	[openBtn setImage:[UIImage imageNamed:@"lock"] forState:UIControlStateNormal];
	[self.addView addSubview:openBtn];
	[openBtn addTarget:self action:@selector(openBtn) forControlEvents:UIControlEventTouchUpInside];
	
	//解锁说明布局
	UIView *instuctView = [[UIView alloc] initWithFrame:CGRectMake(MJSSreenW/2 - 135.5, 180, 271, 356)];
	instuctView.layer.borderWidth = 0.4;
	instuctView.layer.cornerRadius = 7.5;
	
	UILabel *instructLabel = [[UILabel alloc] initWithFrame:CGRectMake(MJSSreenW/2 - 148.5/2 , 230, 148.5, 12)];
	instructLabel.text = @"这里是解锁说明";
	[self.addView addSubview:instructLabel];
	[self.addView addSubview:instuctView];
	[self.view addSubview:self.addView];
}

-(void)openBtn{
	insallAppViewController *installAppVc = [[insallAppViewController alloc]init];
	
	[self presentViewController:installAppVc animated:YES completion:^{
		NSLog(@"点击了解锁");
	}];
	NSLog(@"点击了按钮");
}
@end
