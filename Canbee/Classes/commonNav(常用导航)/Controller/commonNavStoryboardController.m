//
//  commonNavStoryboardController.m
//  Canbee
//
//  Created by Kluth on 2019/11/1.
//  Copyright © 2019 yu_jing_shan. All rights reserved.
//

#import "commonNavStoryboardController.h"
NSString *const ID = @"cell";
@interface commonNavStoryboardController ()<UICollectionViewDataSource>
@property (weak, nonatomic) IBOutlet UIView *footerView;

@end

@implementation commonNavStoryboardController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
	
	//底部导航
	[self setupFootView];
}
-(void)setupFootView{
	//创建布局
	UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
	
	UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, 0, 400) collectionViewLayout:layout];
	collectionView.backgroundColor = [UIColor greenColor];
	self.footerView = collectionView;
	
	collectionView.dataSource = self;
	//注册
	[collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:ID];
}
#pragma mark UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
	return 10;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
	UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
	cell.backgroundColor = [UIColor redColor];
	NSLog(@"打印了cell");
	return cell;
}

@end
