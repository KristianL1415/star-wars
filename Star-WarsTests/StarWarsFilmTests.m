//
//  StarWarsFilmTests.m
//  Star-Wars
//
//  Created by Kristian Lien on 2/26/16.
//  Copyright © 2016 Myriad Mobile. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "HTTPGateway.h"

#import "FilmService.h"
#import "FilmResponse.h"
#import "FilmsResponse.h"
#import "Film.h"

@interface StarWarsFilmTests : XCTestCase

@end

@implementation StarWarsFilmTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testGetFilms {
    XCTestExpectation *expectation = [self expectationWithDescription:@"allFilms"];
    
    [[HTTPGateway sharedInstance] GET:@"films" parameters:nil completion:^(id response, NSError *error) {
        XCTAssertNotNil(response, @"Get all films call should return valid array.");
        XCTAssertNil(error, @"Get all films call should not return an error");
        
        [expectation fulfill];
    }];
    
    [self waitForExpectationsWithTimeout:60.0 handler:nil];
}

- (void)testDeserializeFilmsResponse {
    XCTestExpectation *expectation = [self expectationWithDescription:@"deserializeFilms"];
    
    [[FilmService sharedInstance] films:^(FilmsResponse *response, NSError *error) {
        NSArray *films = response.films;
        
        XCTAssert([films isKindOfClass:[NSArray class]], @"Get all films call was not deserialized correctly.");
        XCTAssertNotNil(films, @"Get all films call was not deserialized correctly.");
        
        [expectation fulfill];
    }];
    
    [self waitForExpectationsWithTimeout:60.0 handler:nil];
}

- (void)testGetFilm {
    XCTestExpectation *expectation = [self expectationWithDescription:@"allFilms"];
    
    [[HTTPGateway sharedInstance] GET:@"films/1" parameters:nil completion:^(id response, NSError *error) {
        XCTAssertNotNil(response, @"Get film by id call should return valid response.");
        XCTAssertNil(error, @"Get film by id call should not return an error.");
        
        [expectation fulfill];
    }];
    
    [self waitForExpectationsWithTimeout:60.0 handler:nil];
}

- (void)testDeserializeFilmResponse {
    XCTestExpectation *expectation = [self expectationWithDescription:@"deserializeFilm"];
    
    [[FilmService sharedInstance] filmWithId:@1 completion:^(FilmResponse *response, NSError *error) {
        Film *film = response.film;
        
        XCTAssert([film isKindOfClass:[Film class]], @"Get film by id call was not deserialized correctly.");
        XCTAssertNotNil(film, @"Get film by id call was not deserialized correctly.");
        
        [expectation fulfill];
    }];
    
    [self waitForExpectationsWithTimeout:60.0 handler:nil];
}

@end
