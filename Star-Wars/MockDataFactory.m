//
//  MockDataFactory.m
//  Star-Wars
//
//  Created by Kristian Lien on 2/29/16.
//  Copyright © 2016 Myriad Mobile. All rights reserved.
//

#import "MockDataFactory.h"

@implementation MockDataFactory

+ (id)jsonObjectForEndpoint:(NSString *)endpoint
{
    NSString *fileName = [self fileNameForEndpoint:endpoint];
    
    return [self jsonObjectForFileWithName:fileName];
}

+ (NSString *)fileNameForEndpoint:(NSString *)endpoint
{
    if ([endpoint containsString:@"/"]) {
        return [self singleResourceNameForEndpoint:endpoint];
    }
    else {
        return endpoint;
    }
}

+ (NSString *)singleResourceNameForEndpoint:(NSString *)endpoint
{
    NSArray *resources = @[ @"films" ];
    
    for (NSString *name in resources) {
        if ([endpoint containsString:name]) {
            return [self singleResourceMap][name];
        }
    }
    
    return nil;
}

+ (NSDictionary *)singleResourceMap
{
    return @{
             @"films" : @"film",
             };
}

#pragma mark - JSON File Retrieval

+ (id)jsonObjectForFileWithName:(NSString *)name
{
    id jsonObject;
    NSError *jsonError;
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:name ofType:@"json"];
    
    if (filePath) {
        NSData *jsonData = [NSData dataWithContentsOfURL:[NSURL fileURLWithPath:filePath]];
        jsonObject = [NSJSONSerialization JSONObjectWithData:jsonData options:kNilOptions error:&jsonError];
    }
    
    if (jsonError) {
        return nil;
    }
    
    return jsonObject;
}

@end
