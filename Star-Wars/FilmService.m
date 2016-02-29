//
//  FilmService.m
//  Star-Wars
//
//  Created by Kristian Lien on 2/26/16.
//  Copyright © 2016 Myriad Mobile. All rights reserved.
//

#import "FilmService.h"

#import "HTTPGateway.h"
#import "MockGateway.h"

#import "FilmResponse.h"
#import "FilmsResponse.h"

#import "SWConfig.h"

@interface FilmService ()

@property(nonatomic, strong) NSObject<MMGateway> *gateway;

@end

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

- (instancetype)init
{
    self = [super init];
    
    if (self)
    {
        _gateway = [SWConfig isUsingMockData] ? [MockGateway sharedInstance] : [HTTPGateway sharedInstance];
    }
    
    return self;
}

- (void)films:(FilmsHandler)handler
{
    [self.gateway GET:@"films" parameters:nil completion:^(id response, NSError *error) {
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
    
    [self.gateway GET:endpoint parameters:nil completion:^(id response, NSError *error) {
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
