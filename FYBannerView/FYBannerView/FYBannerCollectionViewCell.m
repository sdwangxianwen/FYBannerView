//
//  FYBannerCollectionViewCell.m
//  FYBannerView
//
//  Created by wang on 2018/8/3.
//  Copyright © 2018年 wang. All rights reserved.
//

#import "FYBannerCollectionViewCell.h"
#import <UIImageView+WebCache.h>

@implementation FYBannerCollectionViewCell
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}

-(void)setupUI {
    self.imageView = [[UIImageView alloc] initWithFrame:self.frame];
    [self.contentView addSubview:self.imageView];
    
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, self.frame.size.height - 40, self.frame.size.width - 20, 20)];
    self.titleLabel.font = [UIFont systemFontOfSize:13];
    self.titleLabel.textColor = [UIColor whiteColor];
    [self.contentView addSubview:self.titleLabel];
}
-(void)setModel:(FYBannerModel *)model {
    _model = model;
    self.titleLabel.text = model.titleString;
    
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:[model.imageUrl stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]] placeholderImage:[UIImage imageNamed:@"bg_homework_result_header_blue"] options:0];
}

@end
