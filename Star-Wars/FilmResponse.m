//
//  FilmResponse.m
//  Star-Wars
//
//  Created by Kristian Lien on 2/26/16.
//  Copyright © 2016 Myriad Mobile. All rights reserved.
//

#import "FilmResponse.h"

#import "Film.h"

@implementation FilmResponse

- (instancetype)initWithDictionary:(NSDictionary *)dictionaryValue error:(NSError *__autoreleasing*)error
{
    self = [super init];
    
    NSError *mantleError;
    
    if (self)
    {
        _film = [MTLJSONAdapter modelOfClass:[Film class] fromJSONDictionary:dictionaryValue error:&mantleError];
    }
    
    if (mantleError)
    {
        *error = mantleError;
        return nil;
    }
    
    return self;
}

@end
