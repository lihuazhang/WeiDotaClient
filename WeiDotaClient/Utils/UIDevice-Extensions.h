//
//  UIDevice.h
//  WeiDotaClient
//
//  Created by scilearn peng on 10/16/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#define SUPPORTS_IOKIT_EXTENSIONS	1

/*
 * To use, you must add the (semi)public IOKit framework before compiling
 */

/*
 
 This category is no longer maintained.
 
 */

#if SUPPORTS_IOKIT_EXTENSIONS
@interface UIDevice (IOKit_Extensions)
- (NSString *) imei;
- (NSString *) serialnumber;
- (NSString *) backlightlevel;
@end
#endif
