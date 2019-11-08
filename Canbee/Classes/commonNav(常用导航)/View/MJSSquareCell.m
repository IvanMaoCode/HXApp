//
//  MJSSquareCell.m
//  Canbee
//
//  Created by Kluth on 2019/11/1.
//  Copyright © 2019 yu_jing_shan. All rights reserved.
//

#import "MJSSquareCell.h"
#import "UIImageView+WebCache.h"
#import "MJSSquareItem.h"

@interface MJSSquareCell()
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *nameView;

@end

@implementation MJSSquareCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
	NSLog(@"打印了cell");
}
-(void)setItem:(MJSSquareItem *)item{
	_item = item;
	
	[_iconView sd_setImageWithURL:[NSURL URLWithString:item.icon]];
	_nameView.text = item.name;
}
@end
