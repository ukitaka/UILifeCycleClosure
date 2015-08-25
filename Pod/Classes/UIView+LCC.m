//
//  UIView+LCC.m
//  Pods
//
//  Created by Yuki Takahashi on 2015/10/13.
//
//

#import "UIView+LCC.h"
#import "ISMethodSwizzling.h"
#import "NSObject+LCC.h"

@implementation UIView (LCC)

+ (void)load
{
    @autoreleasepool {
        ISSwizzleInstanceMethod([self class],
                                @selector(awakeFromNib),
                                @selector(lcc_awakeFromNib));
    }
}

#pragma mark - Life cycle

- (void)lcc_awakeFromNib
{
    [self lcc_awakeFromNib];
    [self setLcc_isAwakedFromNib:YES];
}

#pragma mark - flgs

- (BOOL)lcc_isAwakedFromNib
{
    return [self lcc_flgForKey:@selector(lcc_isAwakedFromNib)];
}

- (void)setLcc_isAwakedFromNib:(BOOL)lcc_isAwakedFromNib
{
    [self lcc_setFlg:lcc_isAwakedFromNib forKey:@selector(lcc_isAwakedFromNib)];
}

@end
