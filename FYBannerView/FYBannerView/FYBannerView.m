//
//  FYBannerView.m
//  FYBannerView
//
//  Created by wang on 2018/8/3.
//  Copyright © 2018年 wang. All rights reserved.
//

#import "FYBannerView.h"
#import "UIView+FYExtension.h"
#import "FYBannerCollectionViewCell.h"

static NSString *const FYBannerCollectionViewCellID = @"FYBannerCollectionViewCellID";

@interface FYBannerView ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property(nonatomic,strong) UICollectionView  *collectionView;
@property(nonatomic,strong) UICollectionViewFlowLayout *layout;

@property(nonatomic,assign) NSInteger currentIndex; //当前的页数
@property(nonatomic, strong) NSTimer *timers; //定时器
@property(nonatomic,strong) UIPageControl  *pageControl; //页面指示器

@end

@implementation FYBannerView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}

-(void)setupUI {
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    self.layout = layout;
    layout.minimumLineSpacing = 0;
    layout.minimumInteritemSpacing = 0;
    layout.itemSize = CGSizeMake(self.fy_width, self.fy_height);
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, self.fy_width, self.fy_height) collectionViewLayout:layout];
    self.collectionView.pagingEnabled = YES;
    [self.collectionView registerClass:[FYBannerCollectionViewCell class] forCellWithReuseIdentifier:FYBannerCollectionViewCellID];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    [self addSubview:self.collectionView];
    
    self.pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.collectionView.frame) - 20, self.fy_width, 20)];
    [self.pageControl setNumberOfPages:5];
    [self.pageControl setCurrentPageIndicatorTintColor:[UIColor greenColor]];
    [self.pageControl setPageIndicatorTintColor:[UIColor whiteColor]];
    
    [self addSubview:self.pageControl];
    
    [self startTimer];
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 5;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    FYBannerCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:FYBannerCollectionViewCellID forIndexPath:indexPath];
    cell.backgroundColor =  [UIColor colorWithRed:(arc4random() % 256)/255.0 green:(arc4random() % 256)/255.0 blue:(arc4random() % 256)/255.0 alpha:1];
    return cell;
}

//MARK:自动滚动
-(void)automaticScroll {
    NSInteger currentIndex = [self getCurrentIndex];
    NSInteger pageIndex = currentIndex + 1;
    UICollectionViewCell *cell = [self.collectionView cellForItemAtIndexPath:[NSIndexPath indexPathForItem:currentIndex inSection:0]];
    [UIView animateWithDuration:0.2 animations:^{
         cell.transform = CGAffineTransformMakeScale(0.85, 0.85);
    } completion:^(BOOL finished) {
        cell.transform = CGAffineTransformMakeScale(1.0, 1.0);
        [self scrollToIndex:pageIndex];
    }];
}

-(void)scrollToIndex:(NSInteger)targetIndex{
    if (targetIndex >= 5){
        [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:0] atScrollPosition:UICollectionViewScrollPositionNone animated:NO];
        return;
    }
    [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:targetIndex inSection:0] atScrollPosition:UICollectionViewScrollPositionNone animated:YES];
}

-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    [self startTimer];
}
-(NSInteger)pageControlIndexWithCurrentCellIndex:(NSInteger)index{
    return index % 5;
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
    self.pageControl.currentPage = [self pageControlIndexWithCurrentCellIndex:[self getCurrentIndex]];
}

//MARK:获取当前页数
-(NSInteger)getCurrentIndex {
    NSInteger index = 0;
    index = (self.collectionView.contentOffset.x + self.layout.itemSize.width / 2)/self.layout.itemSize.width;
    return MAX(0, index);
}

-(void)startTimer{
    [self invalidateTimer];
    self.currentIndex = [self currentIndex];
    _timers = [NSTimer timerWithTimeInterval:2.0 target:self selector:@selector(automaticScroll) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:_timers forMode:NSRunLoopCommonModes];
}

-(void)invalidateTimer{
    if (_timers != nil){
        [_timers invalidate];
        _timers = nil;
    }
}

@end
