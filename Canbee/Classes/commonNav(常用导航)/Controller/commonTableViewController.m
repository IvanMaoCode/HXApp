//
//  commonTableViewController.m
//  Canbee
//
//  Created by Kluth on 2019/11/1.
//  Copyright © 2019 yu_jing_shan. All rights reserved.
//

#import "commonTableViewController.h"
#import "MJSSquareItem.h"
#import "MJSSquarecell.h"

#import "MJSSquareItem.h"
#import "AFNetworking.h"
#import "MJExtension.h"
#import "SafariServices/SafariServices.h"
static NSString *const ID = @"cell";
static NSInteger const cols = 4;
static CGFloat const margin = 0;
#define itemWH  (MJSSreenW - (cols - 1) * margin) / cols
@interface commonTableViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>
@property(nonatomic,strong)NSMutableArray *squareItems;
@property(nonatomic,weak)UICollectionView *collectionsView;
@end

@implementation commonTableViewController
- (NSArray *)squareItems{
	if(!_squareItems){
		_squareItems = [MJSSquareItem mj_objectArrayWithFilename:@"square_2.plist"];
		//处理数据:判断是否缺多少个数据
		[self resolveData];
 		NSInteger count = _squareItems.count;
		NSInteger rows =(count - 1) / cols + 1;
//		self.collectionsView.mjs_height = rows * itemWH;
//		//设置tableView滚动范围：自己计算
//		self.tableView.contentSize = CGSizeMake(0, CGRectGetMaxY(self.collectionsView.frame));
		self.tableView.tableFooterView = self.collectionsView;
	}
	return _squareItems;
}
- (void)viewDidLoad {
    [super viewDidLoad];
	
	[self setupFootView];
	
	
	//请求cell数据
	//[self loadData];
	//处理cell间距
	self.tableView.sectionHeaderHeight = 0;
	
	self.tableView.sectionFooterHeight = 10;
//	self.tableView.contentInset = UIEdgeInsetsMake(10, 0, 0, 0);
	//展示Cell内容
//	[self loadData];
}
//-(void)loadData{
//	//创建请求会话管理者
//	AFHTTPSessionManager *mgr = [AFHTTPSessionManager manager];
//
//	//拼接参数
//	NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
//	parameters[@"a"] = @"square";
//	parameters[@"c"] = @"topic";
//
//	//发送请求
//	[mgr GET:@"http://" parameters:parameters headers:(nullable NSDictionary<NSString *,NSString *> *) progress:^(NSProgress * _Nonnull downloadProgress) {
//
//	} success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//		<#code#>
//	} failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//		<#code#>
//	}];
//}
-(void)loadData{
	
}
-(void)setupFootView{
	//创建布局
	UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
	
	//设置cell的尺寸
	layout.itemSize = CGSizeMake(itemWH, itemWH);
	layout.minimumInteritemSpacing = margin;
	layout.minimumLineSpacing = margin;
	//创建UIcollectionView
	UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 110, 0, 600) collectionViewLayout:layout];
	_collectionsView = collectionView;
	collectionView.backgroundColor = MJSColor(42, 62, 80);
	
	self.tableView.backgroundColor = MJSColor(166, 166, 166);
	self.tableView.tableFooterView = collectionView;
	//上面灰色
	UILabel *label = [[UILabel alloc] init];
	label.backgroundColor =  MJSColor(166, 166, 166);
	label.frame = CGRectMake(10, 0, 0, 249);
	label.textColor = [UIColor whiteColor];
	label.textAlignment = NSTextAlignmentCenter;
	self.tableView.tableHeaderView = label;
	
	//添加按钮
	UIButton *btn = [[UIButton alloc] init];
	[btn setImage:[UIImage imageNamed:@"back0"] forState:UIControlStateNormal];
	btn.frame = CGRectMake(-10, -20, 110, 100);
	[btn setTitle:@"返回" forState:UIControlStateNormal];
	[btn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchDown];
	[self.tableView addSubview:btn];
	
	collectionView.dataSource = self;
	collectionView.delegate = self;
	collectionView.scrollEnabled = NO;
	//注册cell
	[collectionView registerNib:[UINib nibWithNibName:@"MJSSquareCell" bundle:nil] forCellWithReuseIdentifier:ID];
}
-(void)back{
	[self dismissViewControllerAnimated:YES completion:^{
		NSLog(@"关闭当前窗口完成");
	}];
}
#pragma mark UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
	return self.squareItems.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
	MJSSquareCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
	
	MJSSquareItem *item = self.squareItems[indexPath.row];
	cell.item = item;
	return cell;
}
#pragma mark - 处理请求完成的数据 填充补全表格
-(void)resolveData{
	NSInteger count = self.squareItems.count;
	NSInteger exter = count % cols;
	if(exter){
		exter = cols - exter;
		exter = exter + 4;
		for(int i = 0;i < exter;i++){
			MJSSquareItem *item = [[MJSSquareItem alloc] init];
			[self.squareItems addObject:item];
		}
	}
}

#pragma mark - Table view data source
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
	
	MJSSquareItem *item = self.squareItems[indexPath.row];
	if(![item.url containsString:@"http"]) return;
	NSURL *url = [NSURL URLWithString:item.url];
	SFSafariViewController *safariVc = [[SFSafariViewController alloc] initWithURL:url];
	//处理done的返回
	/*方法一
	 safariVc.delegate = self;
	 self.navigationController.navigationBarHidden = YES;
	 [self.navigationController pushViewController:safariVc animated:YES];
	 */
	[self presentViewController:safariVc animated:YES completion:nil];

}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return 0;
}
#pragma mark UISearchControllerDelegate




@end
