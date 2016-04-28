//
//  Film.m
//  Star-Wars
//
//  Created by Kristian Lien on 2/26/16.
//  Copyright © 2016 Myriad Mobile. All rights reserved.
//

#import "Film.h"

#import "NSDateFormatter+ISO8601.h"

@implementation Film

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    return @{
             @"title" : @"title",
             @"episodeId" : @"episode_id",
             @"openingCrawl" : @"opening_crawl",
             @"director" : @"director",
             @"producer" : @"producer",
             @"releaseDate" : @"release_date",
             @"characters" : @"characters",
             @"planets" : @"planets",
             @"starships" : @"starships",
             @"vehicles" : @"vehicles",
             @"species" : @"species",
             @"created" : @"created",
             @"edited" : @"edited",
             @"url" : @"url",
             };
}

+ (NSValueTransformer *)releaseDateJSONTransformer
{
    return [self dateJSONTransformerWithFormatter:[NSDateFormatter yearMonthDay]];
}

+ (NSValueTransformer *)createdJSONTransformer
{
    return [self dateJSONTransformerWithFormatter:[NSDateFormatter iso8601]];
}

+ (NSValueTransformer *)editedJSONTransformer
{
    return [self dateJSONTransformerWithFormatter:[NSDateFormatter iso8601]];
}

+ (NSValueTransformer *)dateJSONTransformerWithFormatter:(NSDateFormatter *)formatter
{
    return [MTLValueTransformer transformerUsingForwardBlock:^id(id value, BOOL *success, NSError *__autoreleasing *error) {
        return [formatter dateFromString:value];
    }];
}

- (NSString *)releaseDateLongFormat
{
    NSDateFormatter *formatter = [NSDateFormatter new];
    formatter.dateStyle = NSDateFormatterLongStyle;
    NSString *release = [formatter stringFromDate:self.releaseDate];
    
    return release;
}

@end
