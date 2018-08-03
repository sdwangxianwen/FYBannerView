//
//  FYBannerView.h
//  FYBannerView
//
//  Created by wang on 2018/8/3.
//  Copyright © 2018年 wang. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol FYBannerViewDelegate <NSObject>
-(void)clickBannerIndex:(NSInteger)index;
@end
typedef void(^clickBlock)(NSInteger index);
@interface FYBannerView : UIView
@property(nonatomic,weak) id<FYBannerViewDelegate>delegate;

-(instancetype)initWithFrame:(CGRect)frame dataArr:(NSArray *)dataArr;

@end
