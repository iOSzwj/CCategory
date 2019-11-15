//
//  NSObject+runtime.m
//  Demo
//
//  Created by 张文军 on 2018/11/12.
//  Copyright © 2018 张文军. All rights reserved.
//

#import "NSObject+runtime.h"
#import <objc/runtime.h>
@implementation NSObject (runtime)
    
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
    
#pragma mark - 返回值为id类型
    
- (id)executeSel:(SEL)sel{
    if ([self respondsToSelector:sel]) {
        //方法返回值类型
        char retType[512] = {};
        Method method = class_getInstanceMethod([self class], sel);
        method_getReturnType(method, retType, 512);
        if( [[NSString stringWithFormat:@"%s",retType] isEqualToString:@"Q"])
        {
            unsigned long long num = (unsigned long long)[self performSelector:sel];
            return [NSNumber numberWithUnsignedLongLong:num];
        }else if( [[NSString stringWithFormat:@"%s",retType] isEqualToString:@"q"])
        {
            long long num = (long long)[self performSelector:sel];
            return [NSNumber numberWithLongLong:num];
        }else if( [[NSString stringWithFormat:@"%s",retType] isEqualToString:@"I"])
        {
            unsigned int num = (unsigned int)[self performSelector:sel];
            return [NSNumber numberWithUnsignedInt:num];
        }else if( [[NSString stringWithFormat:@"%s",retType] isEqualToString:@"i"])
        {
           int num = (int)[self performSelector:sel];
            return [NSNumber numberWithInt:num];
        }else if( [[NSString stringWithFormat:@"%s",retType] isEqualToString:@"S"])
        {
            unsigned short num = (unsigned short)[self performSelector:sel];
            return [NSNumber numberWithUnsignedShort:num];
        }else if( [[NSString stringWithFormat:@"%s",retType] isEqualToString:@"s"])
        {
            short num = (short)[self performSelector:sel];
            return [NSNumber numberWithShort:num];
        }else if( [[NSString stringWithFormat:@"%s",retType] isEqualToString:@"L"])
        {
            unsigned long num = (unsigned long)[self performSelector:sel];
            return [NSNumber numberWithUnsignedLong:num];
        }else if( [[NSString stringWithFormat:@"%s",retType] isEqualToString:@"l"])
        {
            long num = (long)[self performSelector:sel];
            return [NSNumber numberWithLong:num];
        }else if( [[NSString stringWithFormat:@"%s",retType] isEqualToString:@"C"])
        {
            unsigned char num = (unsigned char)[self performSelector:sel];
            return [NSNumber numberWithUnsignedChar:num];
        }else if( [[NSString stringWithFormat:@"%s",retType] isEqualToString:@"c"])
        {
            char num = (char)[self performSelector:sel];
            return [NSNumber numberWithChar:num];
        }
        return [self performSelector:sel];
    }
    return nil;
}

+ (id)executeSel:(SEL)sel{
    if ([self respondsToSelector:sel]) {
        //方法返回值类型
        char retType[512] = {};
        Method method = class_getClassMethod([self class], sel);
        method_getReturnType(method, retType, 512);
        if( [[NSString stringWithFormat:@"%s",retType] isEqualToString:@"Q"])
        {
            unsigned long long num = (unsigned long long)[self performSelector:sel];
            return [NSNumber numberWithUnsignedLongLong:num];
        }else if( [[NSString stringWithFormat:@"%s",retType] isEqualToString:@"q"])
        {
            long long num = (long long)[self performSelector:sel];
            return [NSNumber numberWithLongLong:num];
        }else if( [[NSString stringWithFormat:@"%s",retType] isEqualToString:@"I"])
        {
            unsigned int num = (unsigned int)[self performSelector:sel];
            return [NSNumber numberWithUnsignedInt:num];
        }else if( [[NSString stringWithFormat:@"%s",retType] isEqualToString:@"i"])
        {
           int num = (int)[self performSelector:sel];
            return [NSNumber numberWithInt:num];
        }else if( [[NSString stringWithFormat:@"%s",retType] isEqualToString:@"S"])
        {
            unsigned short num = (unsigned short)[self performSelector:sel];
            return [NSNumber numberWithUnsignedShort:num];
        }else if( [[NSString stringWithFormat:@"%s",retType] isEqualToString:@"s"])
        {
            short num = (short)[self performSelector:sel];
            return [NSNumber numberWithShort:num];
        }else if( [[NSString stringWithFormat:@"%s",retType] isEqualToString:@"L"])
        {
            unsigned long num = (unsigned long)[self performSelector:sel];
            return [NSNumber numberWithUnsignedLong:num];
        }else if( [[NSString stringWithFormat:@"%s",retType] isEqualToString:@"l"])
        {
            long num = (long)[self performSelector:sel];
            return [NSNumber numberWithLong:num];
        }else if( [[NSString stringWithFormat:@"%s",retType] isEqualToString:@"C"])
        {
            unsigned char num = (unsigned char)[self performSelector:sel];
            return [NSNumber numberWithUnsignedChar:num];
        }else if( [[NSString stringWithFormat:@"%s",retType] isEqualToString:@"c"])
        {
            char num = (char)[self performSelector:sel];
            return [NSNumber numberWithChar:num];
        }
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
        //方法返回值类型
        char retType[512] = {};
        Method method = class_getInstanceMethod([self class], sel);
        method_getReturnType(method, retType, 512);
        if( [[NSString stringWithFormat:@"%s",retType] isEqualToString:@"Q"])
        {
            unsigned long long num = (unsigned long long)[self performSelector:sel withObject:obj];
            return [NSNumber numberWithUnsignedLongLong:num];
        }else if( [[NSString stringWithFormat:@"%s",retType] isEqualToString:@"q"])
        {
            long long num = (long long)[self performSelector:sel withObject:obj];
            return [NSNumber numberWithLongLong:num];
        }else if( [[NSString stringWithFormat:@"%s",retType] isEqualToString:@"I"])
        {
            unsigned int num = (unsigned int)[self performSelector:sel withObject:obj];
            return [NSNumber numberWithUnsignedInt:num];
        }else if( [[NSString stringWithFormat:@"%s",retType] isEqualToString:@"i"])
        {
           int num = (int)[self performSelector:sel withObject:obj];
            return [NSNumber numberWithInt:num];
        }else if( [[NSString stringWithFormat:@"%s",retType] isEqualToString:@"S"])
        {
            unsigned short num = (unsigned short)[self performSelector:sel withObject:obj];
            return [NSNumber numberWithUnsignedShort:num];
        }else if( [[NSString stringWithFormat:@"%s",retType] isEqualToString:@"s"])
        {
            short num = (short)[self performSelector:sel withObject:obj];
            return [NSNumber numberWithShort:num];
        }else if( [[NSString stringWithFormat:@"%s",retType] isEqualToString:@"L"])
        {
            unsigned long num = (unsigned long)[self performSelector:sel withObject:obj];
            return [NSNumber numberWithUnsignedLong:num];
        }else if( [[NSString stringWithFormat:@"%s",retType] isEqualToString:@"l"])
        {
            long num = (long)[self performSelector:sel withObject:obj];
            return [NSNumber numberWithLong:num];
        }else if( [[NSString stringWithFormat:@"%s",retType] isEqualToString:@"C"])
        {
            unsigned char num = (unsigned char)[self performSelector:sel withObject:obj];
            return [NSNumber numberWithUnsignedChar:num];
        }else if( [[NSString stringWithFormat:@"%s",retType] isEqualToString:@"c"])
        {
            char num = (char)[self performSelector:sel withObject:obj];
            return [NSNumber numberWithChar:num];
        }
        return [self performSelector:sel withObject:obj];
    }
    return nil;
}
+ (id)executeSel:(SEL)sel obj:(id)obj{
    if ([self respondsToSelector:sel]) {
        //方法返回值类型
        char retType[512] = {};
        Method method = class_getClassMethod([self class], sel);
        method_getReturnType(method, retType, 512);
        if( [[NSString stringWithFormat:@"%s",retType] isEqualToString:@"Q"])
        {
            unsigned long long num = (unsigned long long)[self performSelector:sel withObject:obj];
            return [NSNumber numberWithUnsignedLongLong:num];
        }else if( [[NSString stringWithFormat:@"%s",retType] isEqualToString:@"q"])
        {
            long long num = (long long)[self performSelector:sel withObject:obj];
            return [NSNumber numberWithLongLong:num];
        }else if( [[NSString stringWithFormat:@"%s",retType] isEqualToString:@"I"])
        {
            unsigned int num = (unsigned int)[self performSelector:sel withObject:obj];
            return [NSNumber numberWithUnsignedInt:num];
        }else if( [[NSString stringWithFormat:@"%s",retType] isEqualToString:@"i"])
        {
           int num = (int)[self performSelector:sel withObject:obj];
            return [NSNumber numberWithInt:num];
        }else if( [[NSString stringWithFormat:@"%s",retType] isEqualToString:@"S"])
        {
            unsigned short num = (unsigned short)[self performSelector:sel withObject:obj];
            return [NSNumber numberWithUnsignedShort:num];
        }else if( [[NSString stringWithFormat:@"%s",retType] isEqualToString:@"s"])
        {
            short num = (short)[self performSelector:sel withObject:obj];
            return [NSNumber numberWithShort:num];
        }else if( [[NSString stringWithFormat:@"%s",retType] isEqualToString:@"L"])
        {
            unsigned long num = (unsigned long)[self performSelector:sel withObject:obj];
            return [NSNumber numberWithUnsignedLong:num];
        }else if( [[NSString stringWithFormat:@"%s",retType] isEqualToString:@"l"])
        {
            long num = (long)[self performSelector:sel withObject:obj];
            return [NSNumber numberWithLong:num];
        }else if( [[NSString stringWithFormat:@"%s",retType] isEqualToString:@"C"])
        {
            unsigned char num = (unsigned char)[self performSelector:sel withObject:obj];
            return [NSNumber numberWithUnsignedChar:num];
        }else if( [[NSString stringWithFormat:@"%s",retType] isEqualToString:@"c"])
        {
            char num = (char)[self performSelector:sel withObject:obj];
            return [NSNumber numberWithChar:num];
        }
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
        //方法返回值类型
        char retType[512] = {};
        Method method = class_getInstanceMethod([self class], sel);
        method_getReturnType(method, retType, 512);
        if( [[NSString stringWithFormat:@"%s",retType] isEqualToString:@"Q"])
        {
            unsigned long long num = (unsigned long long)[self performSelector:sel withObject:obj1 withObject:obj2];
            return [NSNumber numberWithUnsignedLongLong:num];
        }else if( [[NSString stringWithFormat:@"%s",retType] isEqualToString:@"q"])
        {
            long long num = (long long)[self performSelector:sel withObject:obj1 withObject:obj2];
            return [NSNumber numberWithLongLong:num];
        }else if( [[NSString stringWithFormat:@"%s",retType] isEqualToString:@"I"])
        {
            unsigned int num = (unsigned int)[self performSelector:sel withObject:obj1 withObject:obj2];
            return [NSNumber numberWithUnsignedInt:num];
        }else if( [[NSString stringWithFormat:@"%s",retType] isEqualToString:@"i"])
        {
           int num = (int)[self performSelector:sel withObject:obj1 withObject:obj2];
            return [NSNumber numberWithInt:num];
        }else if( [[NSString stringWithFormat:@"%s",retType] isEqualToString:@"S"])
        {
            unsigned short num = (unsigned short)[self performSelector:sel withObject:obj1 withObject:obj2];
            return [NSNumber numberWithUnsignedShort:num];
        }else if( [[NSString stringWithFormat:@"%s",retType] isEqualToString:@"s"])
        {
            short num = (short)[self performSelector:sel withObject:obj1 withObject:obj2];
            return [NSNumber numberWithShort:num];
        }else if( [[NSString stringWithFormat:@"%s",retType] isEqualToString:@"L"])
        {
            unsigned long num = (unsigned long)[self performSelector:sel withObject:obj1 withObject:obj2];
            return [NSNumber numberWithUnsignedLong:num];
        }else if( [[NSString stringWithFormat:@"%s",retType] isEqualToString:@"l"])
        {
            long num = (long)[self performSelector:sel withObject:obj1 withObject:obj2];
            return [NSNumber numberWithLong:num];
        }else if( [[NSString stringWithFormat:@"%s",retType] isEqualToString:@"C"])
        {
            unsigned char num = (unsigned char)[self performSelector:sel withObject:obj1 withObject:obj2];
            return [NSNumber numberWithUnsignedChar:num];
        }else if( [[NSString stringWithFormat:@"%s",retType] isEqualToString:@"c"])
        {
            char num = (char)[self performSelector:sel withObject:obj1 withObject:obj2];
            return [NSNumber numberWithChar:num];
        }
        return [self performSelector:sel withObject:obj1 withObject:obj2];
    }
    return nil;
}
+ (id)executeSel:(SEL)sel obj:(id)obj1 obj:(id)obj2{
    if ([self respondsToSelector:sel]) {
        //方法返回值类型
        char retType[512] = {};
        Method method = class_getClassMethod([self class], sel);
        method_getReturnType(method, retType, 512);
        if( [[NSString stringWithFormat:@"%s",retType] isEqualToString:@"Q"])
        {
            unsigned long long num = (unsigned long long)[self performSelector:sel withObject:obj1 withObject:obj2];
            return [NSNumber numberWithUnsignedLongLong:num];
        }else if( [[NSString stringWithFormat:@"%s",retType] isEqualToString:@"q"])
        {
            long long num = (long long)[self performSelector:sel withObject:obj1 withObject:obj2];
            return [NSNumber numberWithLongLong:num];
        }else if( [[NSString stringWithFormat:@"%s",retType] isEqualToString:@"I"])
        {
            unsigned int num = (unsigned int)[self performSelector:sel withObject:obj1 withObject:obj2];
            return [NSNumber numberWithUnsignedInt:num];
        }else if( [[NSString stringWithFormat:@"%s",retType] isEqualToString:@"i"])
        {
           int num = (int)[self performSelector:sel withObject:obj1 withObject:obj2];
            return [NSNumber numberWithInt:num];
        }else if( [[NSString stringWithFormat:@"%s",retType] isEqualToString:@"S"])
        {
            unsigned short num = (unsigned short)[self performSelector:sel withObject:obj1 withObject:obj2];
            return [NSNumber numberWithUnsignedShort:num];
        }else if( [[NSString stringWithFormat:@"%s",retType] isEqualToString:@"s"])
        {
            short num = (short)[self performSelector:sel withObject:obj1 withObject:obj2];
            return [NSNumber numberWithShort:num];
        }else if( [[NSString stringWithFormat:@"%s",retType] isEqualToString:@"L"])
        {
            unsigned long num = (unsigned long)[self performSelector:sel withObject:obj1 withObject:obj2];
            return [NSNumber numberWithUnsignedLong:num];
        }else if( [[NSString stringWithFormat:@"%s",retType] isEqualToString:@"l"])
        {
            long num = (long)[self performSelector:sel withObject:obj1 withObject:obj2];
            return [NSNumber numberWithLong:num];
        }else if( [[NSString stringWithFormat:@"%s",retType] isEqualToString:@"C"])
        {
            unsigned char num = (unsigned char)[self performSelector:sel withObject:obj1 withObject:obj2];
            return [NSNumber numberWithUnsignedChar:num];
        }else if( [[NSString stringWithFormat:@"%s",retType] isEqualToString:@"c"])
        {
            char num = (char)[self performSelector:sel withObject:obj1 withObject:obj2];
            return [NSNumber numberWithChar:num];
        }
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
        return (BOOL)[self performSelector:sel];
    }
    return NO;
}
+ (BOOL)bExecuteSel:(SEL)sel{
    if ([self respondsToSelector:sel]) {
        return (BOOL)[self performSelector:sel];
    }
    return NO;
}
- (BOOL)bExecuteSelName:(NSString *)selName{
    SEL sel = NSSelectorFromString(selName);
    return [self bExecuteSel:sel];
}
+ (BOOL)bExecuteSelName:(NSString *)selName{
    SEL sel = NSSelectorFromString(selName);
    return [self bExecuteSel:sel];
}
    
- (BOOL)bExecuteSel:(SEL)sel obj:(id)obj{
    if ([self respondsToSelector:sel]) {
        return (BOOL)[self performSelector:sel withObject:obj];
    }
    return NO;
}
+ (BOOL)bExecuteSel:(SEL)sel obj:(id)obj{
    if ([self respondsToSelector:sel]) {
        return (BOOL)[self performSelector:sel withObject:obj];
    }
    return NO;
}
- (BOOL)bExecuteSelName:(NSString *)selName obj:(id)obj{
    SEL sel = NSSelectorFromString(selName);
    return [self bExecuteSel:sel obj:obj];
}
+ (BOOL)bExecuteSelName:(NSString *)selName obj:(id)obj{
    SEL sel = NSSelectorFromString(selName);
    return [self bExecuteSel:sel obj:obj];
}
    
- (BOOL)bExecuteSel:(SEL)sel obj:(id)obj1 obj:(id)obj2{
    if ([self respondsToSelector:sel]) {
        return (BOOL)[self performSelector:sel withObject:obj1 withObject:obj2];
    }
    return NO;
}
+ (BOOL)bExecuteSel:(SEL)sel obj:(id)obj1 obj:(id)obj2{
    if ([self respondsToSelector:sel]) {
        return (BOOL)[self performSelector:sel withObject:obj1 withObject:obj2];
    }
    return NO;
}
- (BOOL)bExecuteSelName:(NSString *)selName obj:(id)obj1 obj:(id)obj2{
    SEL sel = NSSelectorFromString(selName);
    return [self bExecuteSel:sel obj:obj1 obj:obj2];
}
+ (BOOL)bExecuteSelName:(NSString *)selName obj:(id)obj1 obj:(id)obj2{
    SEL sel = NSSelectorFromString(selName);
    return [self bExecuteSel:sel obj:obj1 obj:obj2];
}
    
#pragma clang diagnostic pop
@end
