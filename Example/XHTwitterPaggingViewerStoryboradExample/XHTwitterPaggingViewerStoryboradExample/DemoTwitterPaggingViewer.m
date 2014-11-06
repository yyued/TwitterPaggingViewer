//
//  DemoTwitterPaggingViewer.m
//  XHTwitterPaggingViewerStoryboradExample
//
//  Created by dw_iOS on 14-11-6.
//  Copyright (c) 2014年 曾宪华 QQ群: (142557668) QQ:543413507  Gmail:xhzengAIB@gmail.com. All rights reserved.
//

#import "DemoTwitterPaggingViewer.h"

@interface DemoTwitterPaggingViewer ()

@end

@implementation DemoTwitterPaggingViewer

#pragma mark - Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"icon_plug"] style:UIBarButtonItemStyleBordered target:self action:@selector(addTwitter)];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Action

- (void)addTwitter {
    [[[UIAlertView alloc] initWithTitle:@"提示" message:@"哈哈" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确定", nil] show];
}


@end
