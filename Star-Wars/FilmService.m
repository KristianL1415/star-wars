//
//  FilmService.m
//  Star-Wars
//
//  Created by Kristian Lien on 2/26/16.
//  Copyright © 2016 Myriad Mobile. All rights reserved.
//

#import "FilmService.h"

#import "HTTPGateway.h"
#import "FilmResponse.h"
#import "FilmsResponse.h"

@implementation FilmService

+ (instancetype)sharedInstance
{
    static id sharedInstance;
    static dispatch_once_t dispatchToken;
    
    dispatch_once(&dispatchToken, ^{
        sharedInstance = [[self alloc] init];
    });
    
    return sharedInstance;
}

- (void)films:(FilmsHandler)handler
{
    [[HTTPGateway sharedInstance] GET:@"films" parameters:nil completion:^(id response, NSError *error) {
        FilmsResponse *filmsResponse;
        
        if (!error)
        {
            NSError *deserializationError;
            filmsResponse = [[FilmsResponse alloc] initWithDictionary:response error:&deserializationError];
            error = deserializationError;
        }
        
        handler(filmsResponse, error);
    }];
}

- (void)filmWithId:(NSNumber *)filmId completion:(FilmHandler)handler
{
    NSString *endpoint = [NSString stringWithFormat:@"films/%@", filmId];
    
    [[HTTPGateway sharedInstance] GET:endpoint parameters:nil completion:^(id response, NSError *error) {
        FilmResponse *filmResponse;
        
        if (!error)
        {
            NSError *deserializationError;
            filmResponse = [[FilmResponse alloc] initWithDictionary:response error:&deserializationError];
            error = deserializationError;
        }
        
        handler(filmResponse, error);
    }];
}

@end
