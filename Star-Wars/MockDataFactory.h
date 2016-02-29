//
//  MockDataFactory.h
//  Star-Wars
//
//  Created by Kristian Lien on 2/29/16.
//  Copyright © 2016 Myriad Mobile. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MockDataFactory : NSObject

+ (id)jsonObjectForEndpoint:(NSString *)endpoint;

@end
