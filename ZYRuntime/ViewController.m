//
//  ViewController.m
//  ZYRuntime
//
//  Created by mygame on 15/9/21.
//  Copyright © 2015年 mygame. All rights reserved.
//

#import "ViewController.h"
#import "CDLaunchScreenView.h"
#import "ZYUserInfo.h"
#import "ZYUserInfo+Runtime.h"
#import "ZYRuntimeTestView.h"

@interface ViewController ()
@property (strong, nonatomic) ZYRuntimeTestView *testView;
@end

@implementation ViewController
- (IBAction)buttonClicked:(id)sender {
    [UIView animateWithDuration:1 animations:^{
        self.testView.alpha = CGFLOAT_MIN;
    } completion:^(BOOL finished) {
        [self unregisterKVO];
        [self.testView removeFromSuperview];
        self.testView = nil;
    }];
}

- (IBAction)changeButtonClicked:(id)sender {
    self.testView.userInfo.runtimeInt += 1;
    self.testView.userInfo.runtimeDate = [NSDate date];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    ZYRuntimeTestView *view = [[ZYRuntimeTestView alloc] initWithFrame:CGRectMake(100, 200, 110, 110)];
    view.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:view];
    self.testView = view;
    
    view.userInfo = [[ZYUserInfo alloc] init];
    view.userInfo.uid = 100;
    view.userInfo.address = @"ddd";
    view.userInfo.city = @"afdadsf";
    view.userInfo.runtimeInt = 11;
    NSDate *date = [NSDate date];
    NSLog(@"date=%@", date);
    view.userInfo.runtimeDate = date;
    view.userInfo.runtimeData = [[ZYRuntimeData alloc] init];
    view.userInfo.runtimeData.nickname = @"asd";
    view.userInfo.runtimeData.age = 10;
    
    [self registerKVO];
}

- (NSArray *)kvoKeyPaths {
    return @[@"runtimeInt", @"runtimeDate", @"runtimeData"];
}

- (void)registerKVO {
    for (NSString *keyPath in [self kvoKeyPaths]) {
        [self.testView.userInfo addObserver:self forKeyPath:keyPath options:NSKeyValueObservingOptionNew context:nil];
    }
}

- (void)unregisterKVO {
    for (NSString *keyPath in [self kvoKeyPaths]) {
        [self.testView.userInfo removeObserver:self forKeyPath:keyPath];
    }
}


- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context {
    NSLog(@"keyPath=%@", keyPath);
    NSLog(@"change=%@", change[NSKeyValueChangeNewKey]);
    
    NSLog(@"age=%d", (int)self.testView.userInfo.runtimeData.age);
    NSLog(@"nickname=%@", self.testView.userInfo.runtimeData.nickname);
}
@end
