//
//  FYBannerCollectionViewCell.h
//  FYBannerView
//
//  Created by wang on 2018/8/3.
//  Copyright © 2018年 wang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FYBannerModel.h"

@interface FYBannerCollectionViewCell : UICollectionViewCell
@property(nonatomic,strong) UIImageView  *imageView;
@property(nonatomic,strong) UILabel  *titleLabel;
@property(nonatomic,strong) FYBannerModel  *model;


@end
