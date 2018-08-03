//
//  FYPageControl.m
//  FYBannerView
//
//  Created by wang on 2018/8/3.
//  Copyright © 2018年 wang. All rights reserved.
//

#import "FYPageControl.h"

@implementation FYPageControl

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.userInteractionEnabled = NO;
    }
    return self;
}

//-(void)setCurrentPage:(NSInteger)currentPage {
//    for (NSInteger i = 0; i < [self.subviews count]; i++) {
//        UIImageView *subView = [self.subviews objectAtIndex:i];
//        if (i == currentPage) {
//            [subView setFrame:CGRectMake(subView.frame.origin.x, subView.frame.origin.y, 24, 12)];
//            subView.layer.cornerRadius = 6;
//            subView.clipsToBounds = YES;
//        } else {
//             [subView setFrame:CGRectMake(subView.frame.origin.x, subView.frame.origin.y, 6, 6)];
//            subView.layer.cornerRadius = 3;
//            subView.clipsToBounds = YES;
//        }
//       
//
//    }
//}

@end
