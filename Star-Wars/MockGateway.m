//
//  MockGateway.m
//  Star-Wars
//
//  Created by Kristian Lien on 2/29/16.
//  Copyright © 2016 Myriad Mobile. All rights reserved.
//

#import "MockGateway.h"

#import "MockDataFactory.h"

@implementation MockGateway

+ (instancetype)sharedInstance
{
    static id sharedInstance;
    static dispatch_once_t dispatchToken;
    
    dispatch_once(&dispatchToken, ^{
        sharedInstance = [[self alloc] init];
    });
    
    return sharedInstance;
}

- (void)GET:(NSString *)endpoint parameters:(id)parameters completion:(ServiceHandler)handler
{
    NSError *error;
    id response = [MockDataFactory jsonObjectForEndpoint:endpoint];
    
    if (!response)
    {
        error = [NSError errorWithDomain:@"com.swapi.mockdata" code:999 userInfo:nil];
    }
    
    handler(response, error);
}

- (void)POST:(NSString *)endpoint parameters:(id)parameters completion:(ServiceHandler)handler
{
    
}

- (void)PUT:(NSString *)endpoint parameters:(id)parameters completion:(ServiceHandler)handler
{
    
}

- (void)DELETE:(NSString *)endpoint parameters:(id)parameters completion:(ServiceHandler)handler
{
    
}

@end
