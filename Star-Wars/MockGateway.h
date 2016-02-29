//
//  MockGateway.h
//  Star-Wars
//
//  Created by Kristian Lien on 2/29/16.
//  Copyright © 2016 Myriad Mobile. All rights reserved.
//

#import "MMGateway.h"

@interface MockGateway : NSObject <MMGateway>

typedef void (^SuccessHandler)(NSURLSessionDataTask *task, id responseObject);
typedef void (^FailureHandler)(NSURLSessionDataTask *task, NSError *error);

+ (instancetype)sharedInstance;

- (void)GET:(NSString *)endpoint parameters:(id)parameters completion:(ServiceHandler)handler;
- (void)POST:(NSString *)endpoint parameters:(id)parameters completion:(ServiceHandler)handler;
- (void)PUT:(NSString *)endpoint parameters:(id)parameters completion:(ServiceHandler)handler;
- (void)DELETE:(NSString *)endpoint parameters:(id)parameters completion:(ServiceHandler)handler;

@end
