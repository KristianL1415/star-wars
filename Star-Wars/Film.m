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
    return [self dateJSONTransformer];
}

+ (NSValueTransformer *)createdJSONTransformer
{
    return [self dateJSONTransformer];
}

+ (NSValueTransformer *)editedJSONTransformer
{
    return [self dateJSONTransformer];
}

+ (NSValueTransformer *)dateJSONTransformer
{
    return [MTLValueTransformer transformerUsingForwardBlock:^id(id value, BOOL *success, NSError *__autoreleasing *error) {
        return [[NSDateFormatter iso8601] dateFromString:value];
    }];
}

@end
