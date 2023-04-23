//
//  Main.m
//  FLEXAnywhere
//
//  Created by Insu Byeon on 2023/04/24.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <objc/runtime.h>
#import "FLEXManager.h"

__attribute__((constructor))
static void pluginDidStart(void) {
    NSLog(@"FLEXAnywhere pluginDidStart v2");
}

@interface UIWindow (Swizzle)
@end

@implementation UIWindow (Swizzle)
+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 1 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
            [[FLEXManager sharedManager] showExplorer];
        });
    });
}
@end
