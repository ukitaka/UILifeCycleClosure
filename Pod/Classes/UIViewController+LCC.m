//
//  UIViewController+LCC.m
//  Pods
//
//  Created by Yuki Takahashi on 2015/10/13.
//
//

#import "UIViewController+LCC.h"
#import "ISMethodSwizzling.h"
#import "NSObject+LCC.h"

@implementation UIViewController (LCC)

+ (void)load
{
    @autoreleasepool {
        ISSwizzleInstanceMethod([self class],
                                @selector(viewDidLayoutSubviews),
                                @selector(lcc_viewDidLayoutSubviews));
        ISSwizzleInstanceMethod([self class],
                                @selector(viewDidAppear:),
                                @selector(lcc_viewDidAppear:));
    }
}

#pragma mark - Life cycle

- (void)lcc_viewDidLayoutSubviews
{
    [self lcc_viewDidLayoutSubviews];
    [self setLcc_isViewLaidOut:YES];
}

- (void)lcc_viewDidAppear:(BOOL)animated
{
    [self lcc_viewDidAppear:animated];
    [self setLcc_isViewAppeared:YES];
}

#pragma mark - flgs

- (BOOL)lcc_isViewLaidOut
{
    return [self lcc_flgForKey:@selector(lcc_isViewLaidOut)];
}

- (void)setLcc_isViewLaidOut:(BOOL)lcc_isViewLaidOut
{
    [self lcc_setFlg:lcc_isViewLaidOut forKey:@selector(lcc_isViewLaidOut)];
}

- (BOOL)lcc_isViewAppeared
{
    return [self lcc_flgForKey:@selector(lcc_isViewAppeared)];
}

- (void)setLcc_isViewAppeared:(BOOL)lcc_isViewAppeared
{
    [self lcc_setFlg:lcc_isViewAppeared forKey:@selector(lcc_isViewAppeared)];
}

@end
