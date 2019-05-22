//
//  CCApi.h
//  QMDemo
//
//  Created by 张文军 on 2018/11/29.
//  Copyright © 2018 张文军. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CCNetworking.h"

NS_ASSUME_NONNULL_BEGIN

extern NSString *const CCNetworkStateChangeKey;

typedef enum : NSUInteger {
    /** 未知*/
    CCNetworkStateUnknown = 0,
    /** 不可用*/
    CCNetworkStateUnable = 1,
    /** 手机网络，未知类型，一般不打可能会出现*/
    CCNetworkStateWANUnknown = 2,
    CCNetworkStateWifi = 3,
    CCNetworkState2G = 4,
    CCNetworkState3G = 5,
    CCNetworkState4G = 6
} CCNetworkState;

@interface CCApi : NSObject

/** 当前网络状态*/
@property (nonatomic, assign, readonly) CCNetworkState networkState;
/** 当前网络状态:字符串*/
@property (nonatomic, copy, readonly) NSString *networkStateString;

@property (nonatomic, strong)CCHTTPSessionManager *apiM;
@property (nonatomic, strong) NSString *userAgent;


+(CCApi *)defaultApi;

+(CCHTTPSessionManager *)apiM;
+(NSString *)userAgent;
+(CCNetworkState)networkState;
+(NSString *)networkStateString;

/** 开始监听网络变化，网络变化的时候会发出通知，通知名 "CCNetworkStateChangeKey"*/
+(void)startMonitorNetworkChange;
/** 停止监听网络变化*/
+(void)stopMonitorNetworkChange;

/** 开始监听网络变化，网络变化的时候会发出通知，通知名 "CCNetworkStateChangeKey"*/
-(void)startMonitorNetworkChange;
/** 停止监听网络变化*/
-(void)stopMonitorNetworkChange;
// 监听网络权限状态
+(void)netLimitsOfAuthority;
// 监听网络权限状态
-(void)netLimitsOfAuthority;


+(void)setHeaders:(NSDictionary *)dict;
-(void)setHeaders:(NSDictionary *)dict;

+(NSURLSessionDataTask *)GET:(NSString *)path parameters:(NSDictionary *)params success:(void(^)(id result))success failure:(void(^)(NSError *error))failure;
+(NSURLSessionDataTask *)POST:(NSString *)path parameters:(NSDictionary *)params success:(void(^)(id result))success failure:(void(^)(NSError *error))failure;

-(NSURLSessionDataTask *)GET:(NSString *)path parameters:(NSDictionary *)params success:(void(^)(id result))success failure:(void(^)(NSError *error))failure;
-(NSURLSessionDataTask *)POST:(NSString *)path parameters:(NSDictionary *)params success:(void(^)(id result))success failure:(void(^)(NSError *error))failure;



@end

NS_ASSUME_NONNULL_END
