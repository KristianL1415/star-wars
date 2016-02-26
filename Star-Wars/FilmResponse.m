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
    
    if (self)
    {
        _film = [MTLJSONAdapter]
    }
    
    return self;
}

@end
