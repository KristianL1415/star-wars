//
//  MMGateway.h
//
//  Created by Kristian Lien on 2/29/16.
//  Copyright © 2016 Myriad Mobile. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol MMGateway <NSObject>

typedef void (^ServiceHandler)(id response, NSError *error);

/**
 *  A GET request packaging required Authentication and other headers based on the current token.
 *
 *  @param endpoint          Endpoint relative to the baseURL.
 *  @param params            Required parameters
 *  @param completionHandler Completion handler
 */
- (void)GET:(NSString *)endpoint parameters:(id)parameters completion:(ServiceHandler)handler;

/**
 *  A POST request packaging required Authentication and other headers based on the current token
 *
 *  @param endpoint          Endpoint relative to the baseURL.
 *  @param params            Required parameters
 *  @param completionHandler Completion handler
 */
- (void)POST:(NSString *)endpoint parameters:(id)parameters completion:(ServiceHandler)handler;

/**
 *  A PUT request packaging required Authentication and other headers based on the current token
 *
 *  @param endpoint          Endpoint relative to the baseURL.
 *  @param params            Required parameters
 *  @param completionHandler Completion handler
 */
- (void)PUT:(NSString *)endpoint parameters:(id)parameters completion:(ServiceHandler)handler;

/**
 *  A DELETE require packaging required Authentication and other headers based on the current token.
 *
 *  @param endpoint          Endpoint relative to the baseURL
 *  @param parameters        Required parameters
 *  @param completionHandler Completion handler
 */
- (void)DELETE:(NSString *)endpoint parameters:(id)parameters completion:(ServiceHandler)handler;

@end