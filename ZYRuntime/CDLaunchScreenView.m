//
//  LaunchScreenView.m
//  youwo
//
//  Created by mygame on 15/3/28.
//  Copyright (c) 2015年 mygame. All rights reserved.
//

#import "CDLaunchScreenView.h"

enum {
    kDeviceHeithiPhone4 = 480,
    kDeviceHeithiPhone5 = 568,
    kDeviceHeithiPhone6 = 667,      // (375,667)
    kDeviceHeithiPhone6Plus = 736,  // (414, 736)
    kDeviceHeithiPad = 1024,        // (768, 1024)
};

@interface CDLaunchScreenView ()<UIWebViewDelegate>
@property (strong, nonatomic) UIImageView *launchImageViewNew;
@end


@implementation CDLaunchScreenView
+ (CDLaunchScreenView *)addLaunchScreenViewForView:(UIView *)view {
    CDLaunchScreenView *launchView = [[CDLaunchScreenView alloc] initWithFrame:view.bounds];
    [view addSubview:launchView];
//    launchView.launchImageViewNew = [[UIImageView alloc] initWithFrame:launchView.bounds];
//    [launchView addSubview:launchView.launchImageViewNew];
    
    
//    UIWebView *webView = [[UIWebView alloc] initWithFrame:view.bounds];
//    webView.scalesPageToFit = YES;
//    [launchView addSubview:webView];
//    
//    NSString *path = [[NSBundle mainBundle] pathForResource:@"splash" ofType:@"html"];
//    NSString *html = [[NSString alloc] initWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
//    [webView loadHTMLString:html baseURL:[[NSBundle mainBundle] bundleURL]];
    
    
//    // 选择启动图
//    NSString *launchImageName = nil;
//    NSUInteger height = (NSUInteger)CGRectGetHeight([UIScreen mainScreen].bounds);
//    switch (height) {
//        case kDeviceHeithiPhone4:
//        {
//            launchImageName = @"Default@2x.png";
//            break;
//        }
//        case kDeviceHeithiPhone5:
//        {
//            launchImageName = @"Default-568h@2x.png";
//            break;
//        }
//        case kDeviceHeithiPhone6:
//        {
//            launchImageName = @"LaunchImage-800-667h@2x.png";
//            break;
//        }
//        case kDeviceHeithiPhone6Plus:
//        {
//            launchImageName = @"LaunchImage-800-Portrait-736h@3x.png";
//            break;
//        }
//        case kDeviceHeithiPad:
//        {
//            launchImageName = @"Default-Portrait@2x~ipad.png";
//            break;
//        }
//        default:
//            launchImageName = @"Default@2x.png";
//            break;
//    }
//    
//    launchView.launchImageViewNew.image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:launchImageName ofType:nil]];
//    [UIView animateWithDuration:1 delay:3 options:UIViewAnimationOptionTransitionNone animations:^{
//        launchView.alpha = 0;
//        launchView.transform = CGAffineTransformMakeScale(2, 2);
//    } completion:^(BOOL finished) {
//        
//        [launchView removeFromSuperview];
//    }];
    return launchView;
}

- (void)webViewDidStartLoad:(UIWebView *)webView {
    NSLog(@"%s", __PRETTY_FUNCTION__);
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    NSLog(@"%s", __PRETTY_FUNCTION__);
}

- (void)dealloc
{
    NSLog(@"%s", __PRETTY_FUNCTION__);
}
@end
