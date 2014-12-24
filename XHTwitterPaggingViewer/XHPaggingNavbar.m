//
//  XHPaggingNavbar.m
//  XHTwitterPagging
//
//  Created by 曾 宪华 on 14-6-20.
//  Copyright (c) 2014年 曾宪华 QQ群: (142557668) QQ:543413507  Gmail:xhzengAIB@gmail.com. All rights reserved.
//

#import "XHPaggingNavbar.h"

#define kXHiPad ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad)

#define kXHLabelBaseTag 1000

@interface XHPaggingNavbar () {
    CGFloat deviceWidth;
    CGFloat deviceHeight;
    CGFloat deviceRatio;
}

/**
 *  分页指示器
 */
@property (nonatomic, strong) UIPageControl *pageControl;

/**
 *  title label 集合
 */
@property (nonatomic, strong) NSMutableArray *titleLabels;

@end

@implementation XHPaggingNavbar

#pragma mark - DataSource

- (void)reloadData {
    if (!self.titles.count) {
        return;
    }
    
    [self.titleLabels enumerateObjectsUsingBlock:^(UILabel *label, NSUInteger idx, BOOL *stop) {
        label.hidden = YES;
    }];
    
    [self.titles enumerateObjectsUsingBlock:^(NSString *title, NSUInteger idx, BOOL *stop) {
        CGRect titleLabelFrame = CGRectMake((idx * (deviceWidth / deviceRatio)), 8, CGRectGetWidth(self.bounds), 20);
        UILabel *titleLabel = (UILabel *)[self viewWithTag:kXHLabelBaseTag + idx];
        if (!titleLabel) {
            titleLabel = [[UILabel alloc] init];
            [self addSubview:titleLabel];
            [self.titleLabels addObject:titleLabel];
        }
        titleLabel.hidden = NO;
        titleLabel.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;
        titleLabel.font = [[UINavigationBar appearance].titleTextAttributes objectForKey:NSFontAttributeName];
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.textColor = [UINavigationBar appearance].tintColor;
        titleLabel.backgroundColor = [UIColor clearColor];
        titleLabel.text = title;
        titleLabel.frame = titleLabelFrame;
        if (self.currentPage == idx) {
            titleLabel.alpha = 1.0;
        } else {
            titleLabel.alpha = 0.0;
        }
    }];
    
    self.pageControl.numberOfPages = self.titles.count;
}

#pragma mark - Propertys

- (void)setCurrentPage:(NSInteger)currentPage {
    _currentPage = currentPage;
    self.pageControl.currentPage = currentPage;
}

- (void)setContentOffset:(CGPoint)contentOffset {
    _contentOffset = contentOffset;
    
    CGFloat xOffset = contentOffset.x;
    
    [self.titleLabels enumerateObjectsUsingBlock:^(UILabel *titleLabel, NSUInteger idx, BOOL *stop) {
        if ([titleLabel isKindOfClass:[UILabel class]]) {
            
            // frame
            CGRect titleLabelFrame = titleLabel.frame;
            titleLabelFrame.origin.x = (idx * (deviceWidth / deviceRatio) - xOffset / deviceRatio);
            titleLabel.frame = titleLabelFrame;
            
            // alpha
            CGFloat alpha;
            if(xOffset < deviceWidth * idx) {
                alpha = (xOffset - deviceWidth * (idx - 1)) / deviceWidth;
            }else{
                alpha = 1 - ((xOffset - deviceWidth * idx) / deviceWidth);
            }
            titleLabel.alpha = alpha;
        }
    }];
}

- (UIPageControl *)pageControl {
    if (!_pageControl) {
        _pageControl = [[UIPageControl alloc] init];
        _pageControl.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;
        _pageControl.frame = (CGRect){0, 35, CGRectGetWidth(self.bounds), 0};
        _pageControl.hidesForSinglePage = YES;
        _pageControl.currentPage = self.currentPage;
        _pageControl.currentPageIndicatorTintColor = [UIColor whiteColor];
        _pageControl.pageIndicatorTintColor = [UIColor colorWithWhite:0.799 alpha:1.000];
    }
    return _pageControl;
}

- (NSMutableArray *)titleLabels {
    if (!_titleLabels) {
        _titleLabels = [[NSMutableArray alloc] initWithCapacity:0];
    }
    return _titleLabels;
}

#pragma mark - Life Cycle

- (void)didMoveToSuperview {
    [super didMoveToSuperview];
    
    deviceHeight = CGRectGetHeight([[UIScreen mainScreen] bounds]);
    deviceWidth = CGRectGetWidth([[UIScreen mainScreen] bounds]);
    deviceRatio = deviceHeight / deviceWidth;
}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        [self addSubview:self.pageControl];
    }
    return self;
}

- (void)dealloc {
    self.pageControl = nil;
    self.titleLabels = nil;
}

@end
