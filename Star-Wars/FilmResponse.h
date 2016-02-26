//
//  FilmResponse.h
//  Star-Wars
//
//  Created by Kristian Lien on 2/26/16.
//  Copyright © 2016 Myriad Mobile. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Film;

@interface FilmResponse : NSObject

@property(nonatomic, strong) Film *film;

- (instancetype)initWithDictionary:(NSDictionary *)dictionaryValue error:(NSError *__autoreleasing*)error;

@end
