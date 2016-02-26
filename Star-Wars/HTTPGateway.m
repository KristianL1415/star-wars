//
//  HTTPGateway.m
//  Star-Wars
//
//  Created by Kristian Lien on 2/26/16.
//  Copyright © 2016 Myriad Mobile. All rights reserved.
//

#import "HTTPGateway.h"

#import <AFNetworking/AFNetworking.h>

@interface HTTPGateway ()

@property(nonatomic, strong) AFHTTPSessionManager *sessionManager;

@end

@implementation HTTPGateway

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
        _sessionManager = [[AFHTTPSessionManager manager] initWithBaseURL:[NSURL URLWithString:@"http://swapi.co/api/"]];
    }
    
    return self;
}

#pragma mark - HTTP Methods

- (void)GET:(NSString *)endpoint parameters:(id)parameters completion:(ServiceHandler)handler
{
    [self.sessionManager GET:endpoint
                  parameters:parameters
                     success:[self successWithCompletion:handler]
                     failure:[self failureWithCompletion:handler]];
}

- (void)POST:(NSString *)endpoint parameters:(id)parameters completion:(ServiceHandler)handler
{
    [self.sessionManager POST:endpoint
                   parameters:parameters
                      success:[self successWithCompletion:handler]
                      failure:[self failureWithCompletion:handler]];
}

- (void)PUT:(NSString *)endpoint parameters:(id)parameters completion:(ServiceHandler)handler
{
    [self.sessionManager PUT:endpoint
                  parameters:parameters
                     success:[self successWithCompletion:handler]
                     failure:[self failureWithCompletion:handler]];
}

- (void)DELETE:(NSString *)endpoint parameters:(id)parameters completion:(ServiceHandler)handler
{
    [self.sessionManager DELETE:endpoint
                     parameters:parameters
                        success:[self successWithCompletion:handler]
                        failure:[self successWithCompletion:handler]];
}

#pragma mark - Completion Wrappers

- (void (^)(NSURLSessionDataTask *task, id responseObject))successWithCompletion:(ServiceHandler)handler
{
    return ^(NSURLSessionDataTask *task, id responseObject) {
        handler(responseObject, nil);
    };
}

- (void (^)(NSURLSessionDataTask *task, NSError *error))failureWithCompletion:(ServiceHandler)handler
{
    return ^(NSURLSessionDataTask *task, NSError *error) {
        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *) task.response;
        
        NSData *errorData = error.userInfo[@"com.alamofire.serialization.response.error.data"];
        NSString *errorString = [[NSString alloc] initWithData:errorData encoding:NSUTF8StringEncoding];
        
        NSLog(@"\n***\n\n\nError %@: %@\n\n\n***\n", @(httpResponse.statusCode), errorString);
        
        handler(nil, error);
    };
}

@end
