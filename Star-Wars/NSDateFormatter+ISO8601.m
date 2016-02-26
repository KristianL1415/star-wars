//
//  NSDateFormatter+ISO8601.m
//  Star-Wars
//
//  Created by Kristian Lien on 2/26/16.
//  Copyright © 2016 Myriad Mobile. All rights reserved.
//

#import "NSDateFormatter+ISO8601.h"

@implementation NSDateFormatter (ISO8601)

+ (NSDateFormatter *)iso8601
{
    NSDateFormatter *iso8601 = [NSDateFormatter new];
    
    [iso8601 setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss.SSSZ"];
    // ??? Do I actually want to set this?
//    [iso8601 setLocale:[NSLocale localeWithLocaleIdentifier:@"en_US_POSIX"]];
    
    return iso8601;
}

@end
