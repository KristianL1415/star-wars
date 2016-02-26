//
//  FilmService.h
//  Star-Wars
//
//  Created by Kristian Lien on 2/26/16.
//  Copyright © 2016 Myriad Mobile. All rights reserved.
//

#import <Foundation/Foundation.h>

@class FilmResponse, FilmsResponse;

@interface FilmService : NSObject

typedef void (^FilmsHandler)(FilmsResponse *response, NSError *error);
typedef void (^FilmHandler)(FilmResponse *response, NSError *error);

+ (instancetype)sharedInstance;

- (void)films:(FilmsHandler)handler;
- (void)filmWithId:(NSNumber *)filmId completion:(FilmHandler)handler;

@end
