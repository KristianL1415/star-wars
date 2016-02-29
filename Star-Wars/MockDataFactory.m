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
    id jsonObject;
    NSError *jsonError;
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:endpoint ofType:@"json"];
    
    if (filePath)
    {
        NSData *jsonData = [NSData dataWithContentsOfURL:[NSURL fileURLWithPath:filePath]];
        jsonObject = [NSJSONSerialization JSONObjectWithData:jsonData options:kNilOptions error:&jsonError];
    }
    
    if (jsonError)
    {
        return nil;
    }
    
    return jsonObject;
}

@end
