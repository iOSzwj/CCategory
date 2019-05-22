//
//  ViewController.m
//  CCategoryDemo
//
//  Created by ioszwj on 2019/5/17.
//  Copyright © 2019 hare. All rights reserved.
//

#import "ViewController.h"
#import "UIViewController+frame.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(willChange:) name:UIApplicationWillChangeStatusBarOrientationNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didChange:) name:UIApplicationDidChangeStatusBarOrientationNotification object:nil];
    
    
//    NSLog(@"top:%lf bottom:%lf",self.top,self.bottom);
}

-(void)viewDidAppear:(BOOL)animated{
//    NSLog(@"top:%lf bottom:%lf",self.top,self.bottom);
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    NSLog(@"top:%lf bottom:%lf",self.top,self.bottom);
}

-(void)willChange:(NSNotification *)noti{
//    UIInterfaceOrientation tation = [noti.userInfo[UIApplicationStatusBarOrientationUserInfoKey] intValue];
//    switch (tation) {
//        case UIInterfaceOrientationUnknown:{
//            NSLog(@"will unknown");
//        }break;
//        case UIInterfaceOrientationPortrait:{
//            NSLog(@"will top");
//        }break;
//        case UIInterfaceOrientationPortraitUpsideDown:{
//            NSLog(@"will down");
//        }break;
//        case UIInterfaceOrientationLandscapeLeft:{
//            NSLog(@"will left");
//        }break;
//        case UIInterfaceOrientationLandscapeRight:{
//            NSLog(@"will right");
//        }break;
//    }
    
    // 1：导航栏在手机上边
    // 3：导航栏在手机右边
    // 4：导航栏在手机左边
    // UIApplicationStatusBarOrientationUserInfoKey
//    NSLog(@"willChange %@",noti.userInfo);
}
-(void)didChange:(NSNotification *)noti{
    
//    NSLog(@"%@",noti.userInfo);
    
    // 1：导航栏在手机左边
    // 3：导航栏在手机上边
    // 4：导航栏在手机右边
    // UIApplicationStatusBarOrientationUserInfoKey
    
    
//    UIInterfaceOrientation tation = [noti.userInfo[UIApplicationStatusBarOrientationUserInfoKey] intValue];
//    switch (tation) {
//        case UIInterfaceOrientationUnknown:{
//            NSLog(@"did unknown");
//        }break;
//        case UIInterfaceOrientationPortrait:{
//            NSLog(@"did top");
//        }break;
//        case UIInterfaceOrientationPortraitUpsideDown:{
//            NSLog(@"did down");
//        }break;
//        case UIInterfaceOrientationLandscapeLeft:{
//            NSLog(@"did left");
//        }break;
//        case UIInterfaceOrientationLandscapeRight:{
//            NSLog(@"did right");
//        }break;
//    }
//    NSLog(@"top:%lf bottom:%lf",self.top,self.bottom);
}
//
//-(void)viewDidAppear:(BOOL)animated{
//    NSLog(@"top:%lf bottom:%lf left:%lf right:%lf",self.top,self.bottom,self.left,self.right);
//}
//
//-(UIInterfaceOrientationMask)supportedInterfaceOrientations{
//    return UIInterfaceOrientationMaskAll;//支持所有朝向
//}

-(void)viewLayoutMarginsDidChange{
    [super viewLayoutMarginsDidChange];
    NSLog(@"top:%lf bottom:%lf",self.top,self.bottom);
}

@end
