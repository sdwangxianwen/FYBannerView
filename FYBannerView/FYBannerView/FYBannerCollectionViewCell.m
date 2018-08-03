//
//  FYBannerCollectionViewCell.m
//  FYBannerView
//
//  Created by wang on 2018/8/3.
//  Copyright © 2018年 wang. All rights reserved.
//

#import "FYBannerCollectionViewCell.h"

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
    self.imageView.backgroundColor =  [UIColor colorWithRed:(arc4random() % 256)/255.0 green:(arc4random() % 256)/255.0 blue:(arc4random() % 256)/255.0 alpha:1];
    [self.contentView addSubview:self.imageView];
}

@end
