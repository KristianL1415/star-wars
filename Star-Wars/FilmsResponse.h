//
//  FilmsResponse.h
//  Star-Wars
//
//  Created by Kristian Lien on 2/26/16.
//  Copyright © 2016 Myriad Mobile. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FilmsResponse : NSObject

@property(nonatomic, strong) NSNumber *count;
@property(nonatomic, strong) NSArray *films;

- (instancetype)initWithDictionary:(NSDictionary *)dictionaryValue error:(NSError *__autoreleasing*)error;

@end
