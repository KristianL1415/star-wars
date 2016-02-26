//
//  FilmService.m
//  Star-Wars
//
//  Created by Kristian Lien on 2/26/16.
//  Copyright © 2016 Myriad Mobile. All rights reserved.
//

#import "FilmService.h"

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
    
}

- (void)filmWithId:(NSNumber *)filmId completion:(FilmHandler)handler
{
    
}

@end
