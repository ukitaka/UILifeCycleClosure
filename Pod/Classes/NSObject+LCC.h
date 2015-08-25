//
//  NSObject+LCC.h
//  Pods
//
//  Created by Yuki Takahashi on 2015/10/09.
//
//

#import <Aspects/Aspects.h>

@interface NSObject (LCC)

+ (id<AspectToken>)aspect_hookSelector:(SEL)selector
                           withOptions:(AspectOptions)options
                            usingVoidBlock:(void (^)(id<AspectInfo>))block
                                 error:(NSError **)error;

- (BOOL)lcc_flgForKey:(const void *)key;
- (void)lcc_setFlg:(BOOL)flg forKey:(const void *)key;

@end
