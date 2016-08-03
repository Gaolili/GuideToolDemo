//
//  VersionTool.m
//  LearnDemo
//
//  Created by gaolili on 16/8/2.
//  Copyright © 2016年 Mac. All rights reserved.
//

#import "VersionTool.h"

@implementation VersionTool
+(BOOL)shouldPresentIntroVC {
    
    NSDictionary* infoDic = [[NSBundle mainBundle] infoDictionary];
    NSString* bundleVersion = infoDic[@"CFBundleVersion"];
    NSString* lastBundleVersion = [[NSUserDefaults standardUserDefaults] stringForKey:@"lastBundleVersion"];
    if ([bundleVersion isEqualToString:lastBundleVersion]) {
        return NO;
    } else {
        return YES;
    }
}

+ (void)hasShowedInstro{
    NSDictionary* infoDic = [[NSBundle mainBundle] infoDictionary];
    NSString* bundleVersion = infoDic[@"CFBundleVersion"];
    [[NSUserDefaults standardUserDefaults] setObject:bundleVersion forKey:@"lastBundleVersion"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}
@end
