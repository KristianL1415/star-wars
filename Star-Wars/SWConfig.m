//
//  SWConfig.m
//  Star-Wars
//
//  Created by Kristian Lien on 2/26/16.
//  Copyright © 2016 Myriad Mobile. All rights reserved.
//

#import "SWConfig.h"

@implementation SWConfig

+ (NSURL *)baseUrl
{
    return [NSURL URLWithString:@"http://swapi.co/api"];
}

// Turn mock data on and off here
+ (BOOL)isUsingMockData
{
    return NO;
}

@end
