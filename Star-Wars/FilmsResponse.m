//
//  FilmsResponse.m
//  Star-Wars
//
//  Created by Kristian Lien on 2/26/16.
//  Copyright © 2016 Myriad Mobile. All rights reserved.
//

#import "FilmsResponse.h"

#import "Film.h"

@implementation FilmsResponse

- (instancetype)initWithDictionary:(NSDictionary *)dictionaryValue error:(NSError *__autoreleasing*)error
{
    self = [super init];
    
    NSError *mantleError;
    
    if (self)
    {
        _count = dictionaryValue[@"count"];
        _films = [MTLJSONAdapter modelsOfClass:[Film class] fromJSONArray:dictionaryValue[@"results"] error:&mantleError];
    }
    
    if (mantleError)
    {
        *error = mantleError;
        return nil;
    }
    
    return self;
}

@end
