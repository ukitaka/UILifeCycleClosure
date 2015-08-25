//
//  NSObject+LCC.m
//  Pods
//
//  Created by Yuki Takahashi on 2015/10/09.
//
//

#import "NSObject+LCC.h"
#import <objc/runtime.h>

@implementation NSObject (LCC)

+ (id<AspectToken>)aspect_hookSelector:(SEL)selector
                           withOptions:(AspectOptions)options
                            usingVoidBlock:(void (^)(id<AspectInfo>))block
                                 error:(NSError **)error {
    return [self aspect_hookSelector:selector withOptions:options usingBlock:block error:error];
}

- (BOOL)lcc_flgForKey:(const void *)key
{
    id flg = objc_getAssociatedObject(self, key);
    
    if (flg != nil) {
        return [flg boolValue];
    }
    
    return NO;
}

- (void)lcc_setFlg:(BOOL)flg forKey:(const void *)key
{
    objc_setAssociatedObject(self, key, @(flg), OBJC_ASSOCIATION_COPY_NONATOMIC);
}

@end
