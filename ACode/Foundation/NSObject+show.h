//
//  NSObject+show.h
//  QMDemo
//
//  Created by 张文军 on 2018/11/28.
//  Copyright © 2018 张文军. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (show)

//显示失败提示
- (void)showErrorMsg:(NSObject *)msg;
+ (void)showErrorMsg:(NSObject *)msg;

//显示成功提示
- (void)showSuccessMsg:(NSObject *)msg;
+ (void)showSuccessMsg:(NSObject *)msg;

// 显示等待消息
- (void)showWaitingMsg:(NSString *)msg;
+ (void)showWaitingMsg:(NSString *)msg;

//显示忙
- (void)showProgress;
+ (void)showProgress;

//隐藏提示
- (void)hideProgress;
+ (void)hideProgress;

@end

NS_ASSUME_NONNULL_END
