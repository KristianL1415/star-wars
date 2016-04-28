//
//  SWConfig.h
//  Star-Wars
//
//  Created by Kristian Lien on 2/26/16.
//  Copyright © 2016 Myriad Mobile. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SWConfig : NSObject

+ (NSURL *)baseUrl;
+ (BOOL)isUsingMockData;
+ (void)applicationDidFinishLaunching;

@end
