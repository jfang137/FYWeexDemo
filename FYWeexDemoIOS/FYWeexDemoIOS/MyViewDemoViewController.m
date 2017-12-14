//
//  MyViewDemoViewController.m
//  FYWeexDemoIOS
//
//  Created by 方懿 on 2017/11/29.
//  Copyright © 2017年 fangyi. All rights reserved.
//

#import "MyViewDemoViewController.h"

#import <WeexSDK/WXSDKInstance.h>
#import <WeexSDK/WXComponentManager.h>
#import <WeexSDK/WXSDKManager.h>
#import <WeexSDK/WXDefine.h>
#import <FYTools/FYDefines.h>
#import <FYTools/UIView+FYUtils.h>

@interface MyViewDemoViewController ()

@property (nonatomic, strong) WXSDKInstance *instance;
@property (nonatomic, strong) UIView *weexView;
@property (nonatomic, copy) NSURL *url;

@property (nonatomic) BOOL firstLayoutFinish;

@end

@implementation MyViewDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"view的方式集成";
    
    self.url = [NSURL URLWithString:@"http://192.168.200.181:8081/dist/index.js"];
    
    _instance = [[WXSDKInstance alloc] init];
    _instance.viewController = self;
    _instance.frame = CGRectMake(0, 0, self.view.fy_width, self.view.fy_height * .75);
    [_instance renderWithURL:self.url options:@{@"bundleUrl":[self.url absoluteString]} data:nil];
    
    __weak typeof(self) weakSelf = self;
    _instance.onCreate = ^(UIView *view) {
        view.backgroundColor = [UIColor whiteColor];
        [weakSelf.weexView removeFromSuperview];
        [weakSelf.view addSubview:view];
        weakSelf.weexView = view;
    };
    
    _instance.onFailed = ^(NSError *error) {
        //处理失败回调的逻辑。
        NSLog(@"error:%@",error);
    };
    
    _instance.renderFinish = ^ (UIView *view) {
        //处理页面渲染完成的逻辑。
    };
    
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    if (!self.firstLayoutFinish) {
        [self setupWeexView];
        [self setupNativeBottom];
        self.firstLayoutFinish = YES;
    }
}

- (void)dealloc {
    [_instance destroyInstance];
}

- (void)setupWeexView {
    self.url = [NSURL URLWithString:@"http://localhost:8081/dist/index.js"];
    
    _instance = [[WXSDKInstance alloc] init];
    _instance.viewController = self;
    _instance.frame = CGRectMake(0, 0, self.view.fy_width, self.view.fy_height * .75);
    [_instance renderWithURL:self.url options:@{@"bundleUrl":[self.url absoluteString]} data:nil];
    
    __weak typeof(self) weakSelf = self;
    _instance.onCreate = ^(UIView *view) {
        view.backgroundColor = [UIColor whiteColor];
        [weakSelf.weexView removeFromSuperview];
        [weakSelf.view addSubview:view];
        weakSelf.weexView = view;
    };
    
    _instance.onFailed = ^(NSError *error) {
        //处理失败回调的逻辑。
        NSLog(@"error:%@",error);
    };
    
    _instance.renderFinish = ^ (UIView *view) {
        //处理页面渲染完成的逻辑。
    };
}

- (void)setupNativeBottom {
    UILabel *label = [[UILabel alloc] init];
    label.text = @"底部四分之一区域是native背景view";
    label.textColor = FYGRBColor(0x333333);
    label.font = [UIFont systemFontOfSize:14];
    [label sizeToFit];
    label.center = CGPointMake(self.view.fy_centerX, self.view.fy_height * 3 / 4 + 25);
    [self.view addSubview:label];
    
    UIButton *callJsBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 200, 50)];
    [callJsBtn setTitle:@"点击native按钮与js交互" forState:UIControlStateNormal];
    callJsBtn.center = CGPointMake(self.view.fy_centerX, label.fy_bottomY + 60);
    callJsBtn.backgroundColor = FYGRBColor(0x14A3FE);
    [callJsBtn addTarget:self action:@selector(callJsMethod) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:callJsBtn];
}

- (void)callJsMethod {
    [[WXSDKManager bridgeMgr] fireEvent:_instance.instanceId ref:WX_SDK_ROOT_REF type:@"nativeCall" params:@{@"key1":@"value1",@"key2":@"value2"} domChanges:nil];
}

@end
