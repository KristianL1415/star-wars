//
//  HTTPGateway.h
//  Star-Wars
//
//  Created by Kristian Lien on 2/26/16.
//  Copyright © 2016 Myriad Mobile. All rights reserved.
//

#import "MMGateway.h"

@interface HTTPGateway : NSObject <MMGateway>

+ (instancetype)sharedInstance;

- (void)GET:(NSString *)endpoint parameters:(id)parameters completion:(ServiceHandler)handler;
- (void)POST:(NSString *)endpoint parameters:(id)parameters completion:(ServiceHandler)handler;
- (void)PUT:(NSString *)endpoint parameters:(id)parameters completion:(ServiceHandler)handler;
- (void)DELETE:(NSString *)endpoint parameters:(id)parameters completion:(ServiceHandler)handler;

@end
