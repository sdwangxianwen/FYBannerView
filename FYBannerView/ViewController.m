//
//  ViewController.m
//  FYBannerView
//
//  Created by wang on 2018/8/3.
//  Copyright © 2018年 wang. All rights reserved.
//

#import "ViewController.h"
#import "FYBannerView.h"
#import "UIView+FYExtension.h"


@interface ViewController ()<FYBannerViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *titleArr = @[@"第一个",@"第二个",@"第三个",@"第四个",@"第五个"];
    NSArray *bannerArr = @[@"https://img03.sogoucdn.com/app/a/100520020/7e36f3669bdc75a689aee934291bdee7",@"https://img02.sogoucdn.com/app/a/100520024/59201c67692f8cdaae0f5526c0f28776",@"https://img03.sogoucdn.com/app/a/100520024/7e55e4b77a0bc10e89d711245d938962",@"https://img03.sogoucdn.com/app/a/100520024/ea594fed0e05a34445d4ff561654009f",@"https://img03.sogoucdn.com/app/a/100520024/a5ddb3e029319cfb244f6262480c3389"];
    
    FYBannerView *banerView = [[FYBannerView alloc] initWithFrame:CGRectMake(0, 64, self.view.fy_width, 180) dataArr:bannerArr titleArr:titleArr];
    banerView.delegate = self;
    [self.view addSubview:banerView];
}
-(void)clickBannerIndex:(NSInteger)index {
    NSLog(@"点击了第%ld个",index);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
