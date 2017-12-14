//
//  ViewController.m
//  FYWeexDemoIOS
//
//  Created by 方懿 on 2017/11/27.
//  Copyright © 2017年 fangyi. All rights reserved.
//

#import "ViewController.h"

#import "MyViewDemoViewController.h"

#import <WeexSDK/WXBaseViewController.h>

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"WeexDemo";
}

- (void)viewWayAction {
    MyViewDemoViewController *vc = [MyViewDemoViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)vcWayAction {
    WXBaseViewController *vc = [[WXBaseViewController alloc] initWithSourceURL:[NSURL URLWithString:@"http://localhost:8081/dist/index.js"]];
    vc.title = @"vc方式集成";
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)listDemoAction {
    WXBaseViewController *vc = [[WXBaseViewController alloc] initWithSourceURL:[NSURL URLWithString:@"http://localhost:8081/dist/list_demo.js"]];
    vc.title = @"list demo";
    [self.navigationController pushViewController:vc animated:YES];
}

- (NSArray<NSDictionary *> *)tableItemDict {
    return @[@{@"view方式集成":@"viewWayAction"},
             @{@"vc方式集成":@"vcWayAction"},
             @{@"list demo":@"listDemoAction"}];
}

@end
