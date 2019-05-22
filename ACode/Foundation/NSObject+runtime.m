//
//  NSObject+runtime.m
//  Demo
//
//  Created by 张文军 on 2018/11/12.
//  Copyright © 2018 张文军. All rights reserved.
//

#import "NSObject+runtime.h"

@implementation NSObject (runtime)

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"

#pragma mark - 返回值为id类型

- (id)executeSel:(SEL)sel{
    if ([self respondsToSelector:sel]) {
        return [self performSelector:sel];
    }
    return nil;
}
+ (id)executeSel:(SEL)sel{
    if ([self respondsToSelector:sel]) {
        return [self performSelector:sel];
    }
    return nil;
}
- (id)executeSelName:(NSString *)selName{
    SEL sel = NSSelectorFromString(selName);
    return [self executeSel:sel];
}
+ (id)executeSelName:(NSString *)selName{
    SEL sel = NSSelectorFromString(selName);
    return [self executeSel:sel];
}

- (id)executeSel:(SEL)sel obj:(id)obj{
    if ([self respondsToSelector:sel]) {
        return [self performSelector:sel withObject:obj];
    }
    return nil;
}
+ (id)executeSel:(SEL)sel obj:(id)obj{
    if ([self respondsToSelector:sel]) {
        return [self performSelector:sel withObject:obj];
    }
    return nil;
}
- (id)executeSelName:(NSString *)selName obj:(id)obj{
    SEL sel = NSSelectorFromString(selName);
    return [self executeSel:sel obj:obj];
}
+ (id)executeSelName:(NSString *)selName obj:(id)obj{
    SEL sel = NSSelectorFromString(selName);
    return [self executeSel:sel obj:obj];
}

- (id)executeSel:(SEL)sel obj:(id)obj1 obj:(id)obj2{
    if ([self respondsToSelector:sel]) {
        return [self performSelector:sel withObject:obj1 withObject:obj2];
    }
    return nil;
}
+ (id)executeSel:(SEL)sel obj:(id)obj1 obj:(id)obj2{
    if ([self respondsToSelector:sel]) {
        return [self performSelector:sel withObject:obj1 withObject:obj2];
    }
    return nil;
}
- (id)executeSelName:(NSString *)selName obj:(id)obj1 obj:(id)obj2{
    SEL sel = NSSelectorFromString(selName);
    return [self executeSel:sel obj:obj1 obj:obj2];
}
+ (id)executeSelName:(NSString *)selName obj:(id)obj1 obj:(id)obj2{
    SEL sel = NSSelectorFromString(selName);
    return [self executeSel:sel obj:obj1 obj:obj2];
}

#pragma mark - 返回值为bool类型

- (BOOL)bExecuteSel:(SEL)sel{
    if ([self respondsToSelector:sel]) {
        return [self performSelector:sel];
    }
    return nil;
}
+ (BOOL)bExecuteSel:(SEL)sel{
    if ([self respondsToSelector:sel]) {
        return [self performSelector:sel];
    }
    return nil;
}
- (BOOL)bExecuteSelName:(NSString *)selName{
    SEL sel = NSSelectorFromString(selName);
    return [self executeSel:sel];
}
+ (BOOL)bExecuteSelName:(NSString *)selName{
    SEL sel = NSSelectorFromString(selName);
    return [self executeSel:sel];
}

- (BOOL)bExecuteSel:(SEL)sel obj:(id)obj{
    if ([self respondsToSelector:sel]) {
        return [self performSelector:sel withObject:obj];
    }
    return nil;
}
+ (BOOL)bExecuteSel:(SEL)sel obj:(id)obj{
    if ([self respondsToSelector:sel]) {
        return [self performSelector:sel withObject:obj];
    }
    return nil;
}
- (BOOL)bExecuteSelName:(NSString *)selName obj:(id)obj{
    SEL sel = NSSelectorFromString(selName);
    return [self executeSel:sel obj:obj];
}
+ (BOOL)bExecuteSelName:(NSString *)selName obj:(id)obj{
    SEL sel = NSSelectorFromString(selName);
    return [self executeSel:sel obj:obj];
}

- (BOOL)bExecuteSel:(SEL)sel obj:(id)obj1 obj:(id)obj2{
    if ([self respondsToSelector:sel]) {
        return [self performSelector:sel withObject:obj1 withObject:obj2];
    }
    return nil;
}
+ (BOOL)bExecuteSel:(SEL)sel obj:(id)obj1 obj:(id)obj2{
    if ([self respondsToSelector:sel]) {
        return [self performSelector:sel withObject:obj1 withObject:obj2];
    }
    return nil;
}
- (BOOL)bExecuteSelName:(NSString *)selName obj:(id)obj1 obj:(id)obj2{
    SEL sel = NSSelectorFromString(selName);
    return [self executeSel:sel obj:obj1 obj:obj2];
}
+ (BOOL)bExecuteSelName:(NSString *)selName obj:(id)obj1 obj:(id)obj2{
    SEL sel = NSSelectorFromString(selName);
    return [self executeSel:sel obj:obj1 obj:obj2];
}

#pragma clang diagnostic pop

@end
