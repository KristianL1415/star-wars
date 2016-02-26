//
//  Film.h
//  Star-Wars
//
//  Created by Kristian Lien on 2/26/16.
//  Copyright © 2016 Myriad Mobile. All rights reserved.
//

#import <Mantle/Mantle.h>

@interface Film : MTLModel <MTLJSONSerializing>

@property(nonatomic, copy) NSString *title;
@property(nonatomic, copy) NSNumber *episodeId;
@property(nonatomic, copy) NSString *openingCrawl;
@property(nonatomic, copy) NSString *director;
@property(nonatomic, copy) NSString *producer;
@property(nonatomic, copy) NSDate *releaseDate;

@property(nonatomic, copy) NSArray *characters;
@property(nonatomic, copy) NSArray *planets;
@property(nonatomic, copy) NSArray *starships;
@property(nonatomic, copy) NSArray *vehicles;
@property(nonatomic, copy) NSArray *species;

@property(nonatomic, copy) NSDate *created;
@property(nonatomic, copy) NSDate *edited;
@property(nonatomic, copy) NSString *url;

@end
