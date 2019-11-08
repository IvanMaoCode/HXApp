//
//  mainViewController.m
//  Canbee
//
//  Created by Kluth on 2019/10/30.
//  Copyright © 2019 yu_jing_shan. All rights reserved.
//

#import "mainViewController.h"
#import "UIColor+Hex.h"
#import "commonNavController.h"
#import "commonNavStoryboardController.h"
#import "commonTableViewController.h"
#import "addTimeViewController.h"
#import "personCenterViewController.h"
#import "HXnavigationController.h"
#import "UserItems.h"
#import "networktool.h"
#import "superLinkViewController.h"
#import "pupView.h"

#import "AFNetworking.h"
#import "MJExtension.h"
#import "SVProgressHUD.h"

@interface mainViewController ()<CustomIOSAlertViewDelegate>
@property (weak, nonatomic) IBOutlet UIView *noticeView;
@property (weak, nonatomic) IBOutlet UIView *commoNav;
@property (weak, nonatomic) IBOutlet UIView *personCenter;
@property (weak, nonatomic) IBOutlet UIView *nightWelfare;
@property (weak, nonatomic) IBOutlet UILabel *hourTime;

@property (weak, nonatomic) IBOutlet UILabel *minuteTime;

@property (weak, nonatomic) IBOutlet UILabel *secondTime;

@property (weak, nonatomic) IBOutlet UIButton *addTimeButton;
@property (weak, nonatomic) IBOutlet UIButton *personCenterBtn;
/*可变的用户数据*/
@property (nonatomic,strong) NSMutableArray *mutableitems;
@property(nonatomic,weak) NSTimer *timer;
//弹窗口
@property(nonatomic,strong) CustomIOSAlertView *alertView;
@property(nonatomic,weak) UITextField *username;
@property(nonatomic,weak) UITextField *password;
@property(assign,nonatomic) NSInteger exist;
@end

@implementation mainViewController
- (NSInteger)exist{
	if(_exist < 2){
		NSInteger exist = 0;
		_exist = exist;
	}
	return _exist;
}
- (CustomIOSAlertView *)alertView{
	if(_alertView == nil){
			CustomIOSAlertView *alertView = [[CustomIOSAlertView alloc] init];
		_alertView = alertView;
	}
	return _alertView;
}
- (UITextField *)username{
	if(_username == nil){
		UITextField *username = [[UITextField alloc] init];
		_username  = username;
	}
	return _username;
}
- (UITextField *)password{
	if(_password == nil){
		UITextField *password = [[UITextField alloc] init];
		_password = password;
	}
	return _password;
}
- (void)viewDidLoad {
    [super viewDidLoad];
//	self.Viewcontroller.frame = CGRectMake(0,64,375,29.5);
////	self.Viewcontroller.backgroundColor = [UIColor colorWithHexString:@"#001C58"];
//	self.Viewcontroller.backgroundColor = [UIColor colorWithRed:0/255.0 green:28/255.0 blue:88/255.0 alpha:1.0];
	//布局
	[self viewSetting];
	//创建定时器
	_timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(secondTimeChange) userInfo:nil repeats:YES];
	
	//倒计时方法二
//	[self timeout];
	
	//请求网络数据
	[self loadData];
}
-(void)viewSetting{
	self.noticeView.backgroundColor = [UIColor colorWithRed:15/255.0 green:125/255.0 blue:165/255.0 alpha:1.0];
	
	self.hourTime.layer.cornerRadius = 5;
	self.hourTime.layer.borderWidth = 1.5;
	self.hourTime.layer.borderColor = [[UIColor whiteColor] CGColor];
	//剩余时间
	self.minuteTime.layer.cornerRadius = 5;
	self.minuteTime.layer.borderWidth = 1.5;
	self.minuteTime.layer.borderColor = [[UIColor whiteColor] CGColor];
	
	self.secondTime.layer.cornerRadius = 5;
	self.secondTime.layer.borderWidth = 1.5;
	self.secondTime.layer.borderColor = [[UIColor whiteColor] CGColor];
	
	self.commoNav.layer.borderWidth = 1.5;
	self.commoNav.layer.borderColor = [[UIColor whiteColor] CGColor];
	self.commoNav.layer.cornerRadius = 19.3;
	
	self.personCenter.backgroundColor = [UIColor colorWithRed:53/255.0 green:87/255.0 blue:223/255.0 alpha:1.0];
	self.nightWelfare.backgroundColor = [UIColor colorWithRed:29/255.0 green:54/255.0 blue:136/255.0 alpha:1.0];
	
	
	UILabel *label = [[UILabel alloc] init];
	label.frame = CGRectMake(288,508,32,34);
	label.numberOfLines = 0;
	[self.view addSubview:label];
	
	
	[self.addTimeButton setTitle:@"增加  时长" forState:UIControlStateNormal];
	self.addTimeButton.lineBreakMode = 0;
}
-(void)loadData{
	//1.创建会话层
	AFHTTPSessionManager *mgr = [AFHTTPSessionManager manager];
	//2.拼接请求参数
	NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
	
	//3.发送请求GET
	//	[mgr GET:@"file:///Users/kluth/Desktop/Canbee/vadmin.json" parameters:nil headers:(nil) progress:^(NSProgress * _Nonnull downloadProgress) {
	//		nil;
	//	} success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
	//		//写入解析数据
	////		[responseObject writeToFile:@"/Users/kluth/Desktop/Canbee/Canbee/Canbee/Canbee/Classes/main(主页)/Model/hx.plist" atomically:YES];
	////		//获取字典
	////		NSDictionary *hxDict = [responseObject[@"hx"] lastObject];
	////
	////
	//		//字典数组转模型
	//		NSLog(@"请求成功 - ");
	////		[responseObject writeToFile:@"/Users/kluth/Desktop/Canbee/Canbee/Canbee/Canbee/Classes/main(主页)/Model/hx.plist" atomically:YES ];
	////		[responseObject writeToFile:@"/Users/kluth/Desktop/Canbee/Canbee/Canbee/Canbee/Classes/main(主页)/Model/collection.json" atomically:YES];
	//
	//		//字典数组转模型数据
	//
	//		self.mutableitems =	[UserItems mj_objectArrayWithKeyValuesArray:responseObject[@"item"]];
	//		//刷新数据
	//		UserItems *useritem = [[UserItems alloc] init];
	//		NSLog(@"%ld个用户名字",self.mutableitems.count);
	//		for(NSString *key in self.mutableitems){
	//			NSLog(@"%@",key);
	//			NSLog(@"%@",self.mutableitems);
	//		}
	//	} failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
	//		NSLog(@"请求失败");
	//	}];
	
	//4.发送请求POST
	[mgr POST:@"file:///Users/kluth/Desktop/Canbee/vadmin.json" parameters:nil headers:nil progress:^(NSProgress * _Nonnull uploadProgress) {
		nil;
	} success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
		NSLog(@"请求成功 - %@",responseObject);
		[responseObject writeToFile:@"/Users/kluth/Desktop/Canbee/Canbee/Canbee/Canbee/Classes/main(主页)/Model/hxposts.plist" atomically:YES ];
	} failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
		NSLog(@"请求失败");
	}];
}
//倒计时
-(void)secondTimeChange{
	static int totalTime = 840;
	NSInteger minutes1;
	NSInteger second1;
	minutes1 = totalTime / 60;
	second1 = totalTime / 60 % 60;
//		static int i = 60;
//		if(i == 0){
//			[self jumpBtn:nil];
//		}
//		i--;

	totalTime--;
//	[_jumpBtn setTitle:[NSString stringWithFormat:@"跳过(%d)",i] forState:UIControlStateNormal];
//	self.secondTime.text = i;
//	[_minuteTime setText:[NSString stringWithFormat:@"%ld",minutes1]];
//	[_secondTime setText:[NSString stringWithFormat:@"%ld",second1]];

}
-(void)loginRegisterAlert{
	// Here we need to pass a full frame
	// Add some custom content to the alert view
	[self.alertView setContainerView:[self createDemoView]];
	
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
-(void)buyAlert{
	// Here we need to pass a full frame
	// Add some custom content to the alert view
	[self.alertView setContainerView:[self createbuyView]];
	
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
-(UIView *)createbuyView{
	UIView *demoView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 243, 200)];
	//	demoView.backgroundColor = [UIColor grayColor];
	demoView.layer.borderWidth = 0;
	demoView.layer.cornerRadius = 1.4;
	
	UILabel *textLabel = [[UILabel alloc] initWithFrame:CGRectMake(24, 10, 195, 152)];
	textLabel.text = @"黄金线路有15分钟的无条件免费使用时长。如需增加时长，请移步增加时长界面";
	textLabel.numberOfLines = 4;
	UIButton *registerBtn = [[UIButton alloc] init];
	[registerBtn setImage:[UIImage imageNamed:@"继续连接"] forState:UIControlStateNormal];
	[registerBtn setFrame:CGRectMake(24, 150, 90.5, 36)];
	//	[registerBtn setBackgroundColor:[UIColor blueColor]];
	//	[registerBtn setTitle:@"注册" forState:UIControlStateNormal];
	//	[registerBtn setTitle:@"点击注册" forState:UIControlStateHighlighted];
	[registerBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
	[registerBtn addTarget:self action:@selector(registerBtn) forControlEvents:UIControlEventTouchUpInside];
	UIButton *passwordBtn = [[UIButton alloc] init];
	[passwordBtn setFrame:CGRectMake(128.5, 150, 90.5, 36)];
	[passwordBtn setImage:[UIImage imageNamed:@"addTime1"] forState:UIControlStateNormal];
	//	[passwordBtn setBackgroundColor:[UIColor blueColor]];
	//	[passwordBtn setTitle:@"登录" forState:UIControlStateNormal];
	//	[passwordBtn setTitle:@"点击登录" forState:UIControlStateHighlighted];
	[passwordBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
	[passwordBtn addTarget:self action:@selector(addTimeBtn) forControlEvents:UIControlEventTouchUpInside];
	
	[demoView addSubview:textLabel];
	[demoView addSubview:registerBtn];
	[demoView addSubview:passwordBtn];
	
	return demoView;
}
//倒计时方法二
-(void)timeout{
	static int _shoumiNS = 900;
	__block int timeout=_shoumiNS; //倒计时时间
	
	dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
	
	dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
	
	dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
	
	dispatch_source_set_event_handler(_timer, ^{
		
		if(timeout<=0){ //倒计时结束，关闭
			
			dispatch_source_cancel(_timer);
			
			dispatch_async(dispatch_get_main_queue(), ^{
				
				//设置界面的按钮显示 根据自己需求设置（倒计时结束后调用）
				
//				self.ShouMIdate.text =@"0天0时0分0秒";
				
			});
			
		}else{
			
			dispatch_async(dispatch_get_main_queue(), ^{
				
				//设置界面的按钮显示 根据自己需求设置
				
				//                NSLog(@"____%@",strTime);
				
				int second =timeout%60;//秒
				
				int minutes = timeout/60%60;//分钟的。
				
				int hour = timeout/60/60%24;//小时
				
				int day = timeout/60/60/24;//天
				
				NSString *strTime = [NSString stringWithFormat:@"%d天%d小时%d分钟%d秒",day,hour,minutes,second ];
				
//				_ShouMIdate.text =strTime;
//				NSLog(@"%d天%d小时%d分钟%d秒",day,hour,minutes,second);
				
				[self.secondTime setText:[NSString stringWithFormat:@"%d",second]];
				[self.minuteTime setText:[NSString stringWithFormat:@"%d",minutes]];
			});
			
			timeout--;
			
		}
		
	});
	
	dispatch_resume(_timer);
	
}

- (IBAction)commoeNavBtn:(id)sender {
	//进入到常用导航栏
	
	UIStoryboard *storyboard = [UIStoryboard storyboardWithName:NSStringFromClass([commonTableViewController class]) bundle:nil];
	commonTableViewController *commonNav = [storyboard instantiateInitialViewController];
	
	[self presentViewController:commonNav animated:YES completion:^{
		NSLog(@"进入了常用导航栏");
	}];
}
- (IBAction)personCenter1:(UIButton *)sender {
	//判断是否已经登录
	if(self.exist){
		[self loginRegisterAlert];
		return;
	}
	personCenterViewController *personCenterVc = [[personCenterViewController alloc] init];
	[self presentViewController:personCenterVc animated:NO completion:^{
		NSLog(@"进入了个人中心");
	}];
	//给个人中新添加导航栏
//	HXnavigationController *nav1 = [[HXnavigationController alloc] initWithRootViewController:personCenterVc];
//	[self addChildViewController:nav1];
}
//原始的弹窗
- (IBAction)personCenter:(UIButton *)sender {
	Boolean *password = false;
	if(!password){
		// Here we need to pass a full frame
		CustomIOSAlertView *alertView = [[CustomIOSAlertView alloc] init];
		
		// Add some custom content to the alert view
		[alertView setContainerView:[self createDemoView]];
		
		// Modify the parameters
		[alertView setButtonTitles:[NSMutableArray arrayWithObjects: @"取消", nil]];
		[alertView setDelegate:self];
		
		// You may use a Block, rather than a delegate.
		[alertView setOnButtonTouchUpInside:^(CustomIOSAlertView *alertView, int buttonIndex) {
			NSLog(@"Block: Button at position %d is clicked on alertView %d.", buttonIndex, (int)[alertView tag]);
			[alertView close];
		}];
		
		[alertView setUseMotionEffects:true];
		
		// And launch the dialog
		[alertView show];
	}
	//给个人中新添加导航栏
	//	HXnavigationController *nav1 = [[HXnavigationController alloc] initWithRootViewController:personCenterVc];
	//	[self addChildViewController:nav1];
}
- (void)customIOS7dialogButtonTouchUpInside: (CustomIOSAlertView *)alertView clickedButtonAtIndex: (NSInteger)buttonIndex
{
	NSLog(@"Delegate: Button at position %d is clicked on alertView %d.", (int)buttonIndex, (int)[alertView tag]);
	[alertView close];
}
- (UIView *)createDemoView
{
	UIView *demoView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 243, 200)];
	
	
	//	_username = [[UITextField alloc] init];
	[self.username setFrame:CGRectMake(24, 50, 194.5, 30)];
	[self.username setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
	self.username.placeholder = @"请输入用户名";
	//[self.username addTarget:self action:@selector(textFieldEditChanged:) forControlEvents:UIControlEventEditingChanged];
	
	self.password.secureTextEntry = YES;
	[self.password setFrame:CGRectMake(24,90, 194.5, 30)];
	self.password.placeholder = @"请输入密码";
	[self.password setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
	//[self.password addTarget:self action:@selector(passwordFieldEditChanged:) forControlEvents:UIControlEventEditingChanged];
	
	UIButton *registerBtn = [[UIButton alloc] init];
	[registerBtn setImage:[UIImage imageNamed:@"register1"] forState:UIControlStateNormal];
	[registerBtn setFrame:CGRectMake(24, 150, 90.5, 36)];
	//	[registerBtn setBackgroundColor:[UIColor blueColor]];
	//	[registerBtn setTitle:@"注册" forState:UIControlStateNormal];
	//	[registerBtn setTitle:@"点击注册" forState:UIControlStateHighlighted];
	[registerBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
	[registerBtn addTarget:self action:@selector(registerBtn) forControlEvents:UIControlEventTouchUpInside];
	UIButton *passwordBtn = [[UIButton alloc] init];
	[passwordBtn setFrame:CGRectMake(128.5, 150, 90.5, 36)];
	[passwordBtn setImage:[UIImage imageNamed:@"login1"] forState:UIControlStateNormal];
	//	[passwordBtn setBackgroundColor:[UIColor blueColor]];
	//	[passwordBtn setTitle:@"登录" forState:UIControlStateNormal];
	//	[passwordBtn setTitle:@"点击登录" forState:UIControlStateHighlighted];
	[passwordBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
	[passwordBtn addTarget:self action:@selector(loginBtn:password:) forControlEvents:UIControlEventTouchUpInside];
	//提示用户需要登录注册
	UILabel *noticeLabel = [[UILabel alloc] init];
	NSString *str = @"账号登陆：直接填写账号密码即可登录";
	noticeLabel.text = str;
	noticeLabel.textColor = [UIColor redColor];
	
	[noticeLabel setFont:[UIFont systemFontOfSize:12]];
	//	noticeLabel.text attr
	[noticeLabel setFrame:CGRectMake(20, 6, 243, 12)];
	
	[demoView addSubview:self.username];
	[demoView addSubview:self.password];
	[demoView addSubview:registerBtn];
	[demoView addSubview:passwordBtn];
	[demoView addSubview:noticeLabel];
	return demoView;
}
-(void)addTimeBtn{
	[self.alertView close];
	superLinkViewController *superLink = [[superLinkViewController alloc]init];
	[self presentViewController:superLink animated:YES completion:^{
		NSLog(@"点击增加时长");
		
	}];
}
//注册按钮
-(void)registerBtn{
	NSLog(@"点击了注册按钮");
	//SessionPOST请求
	[self sessionPost];
	
}
//注册POST请求
-(void)sessionPost{
	NSString *Strurl = @"http://go.jummy.top/api/user/";
	NSString *nameStr = [NSString stringWithFormat:@"%@",self.username.text];
	NSString *passwordStr = [NSString stringWithFormat:@"%@",self.password.text];
	NSDictionary *paramDict = @{@"username":nameStr,
								@"password":passwordStr,
								@"type":@"JSON"
								};
	[networktool post:Strurl params:paramDict success:^(id  _Nonnull responseObj) {
		NSLog(@"请求成功");
		
		NSLog(@"*****%@",responseObj);
		//解析数据
		NSLog(@"打印结果--%@",responseObj[@"result"]);
		if([responseObj[@"result"] isEqualToString:@"已经有这个用户了"]){
			[SVProgressHUD showErrorWithStatus:@"用户已经存在"];
			[SVProgressHUD dismissWithDelay:0.8];
		}else{
			[self.alertView close];
			[SVProgressHUD showSuccessWithStatus:@"注册成功"];
			[SVProgressHUD dismissWithDelay:0.8];
		}
	} failure:^(NSError * _Nonnull error) {
		NSLog(@"请求失败");
	}];
}
//登录按钮
-(void)loginBtn:(NSString *)account password:(NSString *)password{
	NSLog(@"点击了登录按钮");
	
	//[self.alertView close];
	if(_username.text.length == 0){
		[SVProgressHUD showErrorWithStatus:self.username.placeholder];
		[SVProgressHUD dismissWithDelay:0.7];
		return;
	}
	//POST请求登录：
	NSString *Strurl = @"http://go.jummy.top/api/user/login";
	NSString *nameStr = [NSString stringWithFormat:@"%@",self.username.text];
	NSString *passwordStr = [NSString stringWithFormat:@"%@",self.password.text];
	NSDictionary *paramDict = @{@"username":nameStr,
								@"password":passwordStr,
								@"type":@"JSON"
								};
	[networktool post:Strurl params:paramDict success:^(id  _Nonnull responseObj) {
		NSLog(@"登录成功");
		self.exist = 1;
		//		self.isLogin = true;
		NSLog(@"*****%@",responseObj);
		//解析数据
		[SVProgressHUD showSuccessWithStatus:responseObj[@"result"]];
		[SVProgressHUD dismissWithDelay:0.8];
		[self.alertView close];
		[self timeout];
	} failure:^(NSError * _Nonnull error) {
		NSLog(@"请求失败");
	}];
}
//增加时长按钮跳转页面
- (IBAction)addTimeBtnView:(id)sender {
	
	superLinkViewController *superLinkVc = [[superLinkViewController alloc]init];
	[self presentViewController:superLinkVc animated:YES completion:^{
		NSLog(@"点击增加时长");
	}];
}
- (IBAction)onBtn:(id)sender {
	NSLog(@"点击了开关按钮");
	//判断用户是否已经登录
	if(_username.text.length <=0){
		[self loginRegisterAlert];
	}//如果已经登录,再点击开关按钮进入购买弹窗
	else{
		[self buyAlert];
	}
}
//深夜福利
- (IBAction)nightWelfareBtn:(id)sender {
	NSLog(@"点击了深夜福利按钮");
	pupView *pup = [[pupView alloc]init];
	[pup showInView];
}
@end
