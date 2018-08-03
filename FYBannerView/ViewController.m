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

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    FYBannerView *banerView = [[FYBannerView alloc] initWithFrame:CGRectMake(0, 64, self.view.fy_width, 180)];
    [self.view addSubview:banerView];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
