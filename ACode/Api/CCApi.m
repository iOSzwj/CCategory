//
//  CCApi.m
//  QMDemo
//
//  Created by 张文军 on 2018/11/29.
//  Copyright © 2018 张文军. All rights reserved.
//

#import "CCApi.h"
#import "RealReachability.h"
#import <CoreTelephony/CTCellularData.h>
#import "UIApplication+url.h"

NSString *const CCNetworkStateChangeKey = @"CCNetworkStateChangeKey";

@interface CCApi ()

@property (nonatomic, strong) CTCellularData *cellularData;
@end

@implementation CCApi

#pragma mark - 生命周期 Life Circle

+(CCApi *)defaultApi{
    static CCApi *obj;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        obj=[[self alloc]init];
    });
    return obj;
}

#pragma mark - 控制器生命周期 ViewController Life Circle

#pragma mark - 公开的方法 public Methods

+(AFHTTPSessionManager *)apiM{
    return self.defaultApi.apiM;
}
+(NSString *)userAgent{
    return self.defaultApi.userAgent;
}
+(CCNetworkState)networkState{
    return self.defaultApi.networkState;
}
+(NSString *)networkStateString{
    return self.defaultApi.networkStateString;
}

/** 开始监听网络变化，网络变化的时候会发出通知，通知名 "CCNetworkStateChangeKey"*/
+(void)startMonitorNetworkChange{
    [self.defaultApi startMonitorNetworkChange];
}
/** 停止监听网络变化*/
+(void)stopMonitorNetworkChange{
    [self.defaultApi stopMonitorNetworkChange];
}
/** 开始监听网络变化，网络变化的时候会发出通知，通知名 "CCNetworkStateChangeKey"*/
-(void)startMonitorNetworkChange{
    [GLobalRealReachability startNotifier];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(networkChange:) name:kRealReachabilityChangedNotification object:nil];
}
/** 停止监听网络变化*/
-(void)stopMonitorNetworkChange{
    [GLobalRealReachability stopNotifier];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:kRealReachabilityChangedNotification object:nil];
}
// 监听网络权限状态
+(void)netLimitsOfAuthority
{
    [self.defaultApi netLimitsOfAuthority];
}

// 监听网络权限状态
-(void)netLimitsOfAuthority
{
    _cellularData = [[CTCellularData alloc] init];
    _cellularData.cellularDataRestrictionDidUpdateNotifier = ^(CTCellularDataRestrictedState state) {
        switch (state) {
            case kCTCellularDataRestrictedStateUnknown:{
                NSLog(@"当前网络:未知");
            }break;
            case kCTCellularDataRestricted:{
                NSLog(@"当前网络:受限制");
                if([CCApi.networkStateString intValue]==1){
                    dispatch_async(dispatch_get_main_queue(), ^{
                        [CCApi netRestrictedStateAlert];
                    });
                }
            }break;
            case kCTCellularDataNotRestricted:{
            }break;
            default:
                break;
        }
    };
}
+(void)netRestrictedStateAlert
{
    NSString *title = [NSString stringWithFormat:@"已为“%@”关闭无线局域网",[[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleDisplayName"]];
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:@"您可以在“设置”中为此应用打开无线局域网" preferredStyle:UIAlertControllerStyleAlert];
    
    [alert addAction:[UIAlertAction actionWithTitle:@"好" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
    }]];
    [alert addAction:[UIAlertAction actionWithTitle:@"设置" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [UIApplication openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]];
        });
    }]];
    
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alert animated:YES completion:nil];
}

+(void)setHeaders:(NSDictionary *)dict{
    [self.defaultApi setHeaders:dict];
}
-(void)setHeaders:(NSDictionary *)dict{
    if (dict == nil) {
        return;
    }
    if (dict.allKeys.count == 0) {
        return;
    }
    if (self.apiM.requestSerializer == nil) {
        return;
    }
    __weak typeof(self) _weakSelf = self;
    [dict enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        [_weakSelf.apiM.requestSerializer setValue:[obj description] forHTTPHeaderField:key];
    }];
}

+(NSURLSessionDataTask *)GET:(NSString *)path parameters:(NSDictionary *)params success:(CCSuccessResultBlock)success failure:(CCFailueBlock)failure{
    return [[self defaultApi] GET:path parameters:params success:success failure:failure];
}
+(NSURLSessionDataTask *)POST:(NSString *)path parameters:(NSDictionary *)params success:(CCSuccessResultBlock)success failure:(CCFailueBlock)failure{
    return [[self defaultApi] POST:path parameters:params success:success failure:failure];
}

-(NSURLSessionDataTask *)GET:(NSString *)path parameters:(NSDictionary *)params success:(CCSuccessResultBlock)success failure:(CCFailueBlock)failure{
    
    return [self.apiM GET:path parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
    }];
    
}
-(NSURLSessionDataTask *)POST:(NSString *)path parameters:(NSDictionary *)params success:(CCSuccessResultBlock)success failure:(CCFailueBlock)failure{
    return [self.apiM POST:path parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
    }];
}

#pragma mark - 私有的方法 private Methods

-(void)networkChange:(NSNotification *)noti{
    RealReachability *reachability = (RealReachability *)noti.object;
    ReachabilityStatus newState = [reachability currentReachabilityStatus];
    NSString *newHState = @"0";
    switch (newState) {
        case RealStatusUnknown:{
            newHState = @"0";
        }break;
        case RealStatusNotReachable:{
            newHState = @"1";
        }break;
        case RealStatusViaWiFi:{
            newHState = @"3";
        }break;
        case RealStatusViaWWAN:{
            WWANAccessType accessType = [reachability currentWWANtype];
            switch (accessType) {
                case WWANType2G:{
                    newHState = @"4";
                }break;
                case WWANType3G:{
                    newHState = @"5";
                }break;
                case WWANType4G:{
                    newHState = @"6";
                }break;
                case WWANTypeUnknown:{
                    newHState = @"2";
                }break;
            }
        }break;
    }
    ReachabilityStatus oldState = [reachability previousReachabilityStatus];
    NSString * oldHState = @"0";
    switch (oldState) {
        case RealStatusUnknown:{
            oldHState = @"0";
        }break;
        case RealStatusNotReachable:{
            oldHState = @"1";
        }break;
        case RealStatusViaWiFi:{
            oldHState = @"3";
        }break;
        case RealStatusViaWWAN:{
            WWANAccessType accessType = [reachability currentWWANtype];
            switch (accessType) {
                case WWANType2G:{
                    oldHState = @"4";
                }break;
                case WWANType3G:{
                    oldHState = @"5";
                }break;
                case WWANType4G:{
                    oldHState = @"6";
                }break;
                case WWANTypeUnknown:{
                    oldHState = @"2";
                }break;
            }
        }break;
    }
    [[NSNotificationCenter defaultCenter] postNotificationName:CCNetworkStateChangeKey object:nil userInfo:@{@"old":oldHState,@"new":newHState}];
}

#pragma mark - setter

#pragma mark - 懒加载 getter
-(AFHTTPSessionManager *)apiM{
    if (_apiM == nil) {
        NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
        _apiM = [[AFHTTPSessionManager alloc] initWithBaseURL:nil sessionConfiguration:config];
        _apiM.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/html", @"text/javascript",@"text/plain", nil];
    }
    return _apiM;
}
-(NSString *)userAgent{
    
    NSString *ua = self.apiM.requestSerializer.HTTPRequestHeaders[@"User-Agent"].description;
    if (ua == nil) {
        return @"";
    }
    if (ua.length == 0) {
        return @"";
    }
    return ua;
}
-(CCNetworkState)networkState{
    [GLobalRealReachability startNotifier];
    ReachabilityStatus status = [GLobalRealReachability currentReachabilityStatus];
    switch (status) {
        case RealStatusUnknown:return CCNetworkStateUnknown;
        case RealStatusNotReachable:return CCNetworkStateUnable;
        case RealStatusViaWiFi:return CCNetworkStateWifi;
        case RealStatusViaWWAN:{
            WWANAccessType accessType = [GLobalRealReachability currentWWANtype];
            switch (accessType) {
                case WWANType2G:return CCNetworkState2G;
                case WWANType3G:return CCNetworkState3G;
                case WWANType4G:return CCNetworkState4G;
                case WWANTypeUnknown:return CCNetworkStateWANUnknown;
            }
        };
    }
    return CCNetworkStateUnknown;
}
-(NSString *)networkStateString{
    return [NSString stringWithFormat:@"%ld",self.networkState];
}

@end
