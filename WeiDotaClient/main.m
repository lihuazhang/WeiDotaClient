//
//  main.m
//  WeiDotaClient
//
//  Created by scilearn peng on 10/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AppDelegate.h"

int main(int argc, char *argv[])
{
    // force to use chinese
    [[NSUserDefaults standardUserDefaults] setObject:[NSArray arrayWithObject:@"zh"] forKey:@"AppleLanguages"];
    @autoreleasepool {
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
