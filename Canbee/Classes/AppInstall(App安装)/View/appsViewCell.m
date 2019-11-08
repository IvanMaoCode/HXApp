//
//  appsViewCell.m
//  Canbee
//
//  Created by Kluth on 2019/11/7.
//  Copyright © 2019 yu_jing_shan. All rights reserved.
//
#import "appItem.h"
#import "appsViewCell.h"
@interface appsViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *appIconView;
@property (weak, nonatomic) IBOutlet UILabel *appName;
@property (weak, nonatomic) IBOutlet UILabel *appInstruct;
@property (weak, nonatomic) IBOutlet UIButton *installBtn;


@end
@implementation appsViewCell
- (void)setItem:(appItem *)item{
	_item = item;
	//设置内容
	_appIconView.image = [UIImage imageNamed:@"placeholder"];
	_appName.text = item.app_name;
	_appInstruct.text = item.app_Intro;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
	self.installBtn.layer.borderWidth = 1;
	self.installBtn.layer.borderColor = [[UIColor greenColor] CGColor];
	self.installBtn.layer.cornerRadius = 12.5;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
