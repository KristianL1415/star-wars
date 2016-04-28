//
//  NSDateFormatter+ISO8601.h
//  Star-Wars
//
//  Created by Kristian Lien on 2/26/16.
//  Copyright © 2016 Myriad Mobile. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDateFormatter (ISO8601)

+ (NSDateFormatter *)iso8601;
+ (NSDateFormatter *)yearMonthDay;

@end
