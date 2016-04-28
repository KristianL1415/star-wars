//
//  FilmListPresenter.m
//  Star-Wars
//
//  Created by Kristian Lien on 4/27/16.
//  Copyright © 2016 Myriad Mobile. All rights reserved.
//

#import "FilmListPresenter.h"

#import "FilmService.h"
#import "FilmsResponse.h"
#import "Film.h"

@interface FilmListPresenter ()

@property(nonatomic) id<FilmListView> filmListView;

@end

@implementation FilmListPresenter

- (instancetype)initWithView:(id<FilmListView>)view
{
    self = [super init];
    
    if (self) {
        _filmListView = view;
    }
    
    return self;
}

- (void)getFilmList
{
    [[FilmService sharedInstance] films:^(FilmsResponse *response, NSError *error) {
        if (error) {
            [self.filmListView setNetworkError:error.localizedDescription];
        }
        else {
            NSArray *sortedFilms = [response.films sortedArrayUsingComparator:^NSComparisonResult(Film *film1, Film *film2) {
                NSNumber *first = film1.episodeId;
                NSNumber *second = film2.episodeId;
                return [first compare:second];
            }];
            
            [self.filmListView appendFilms:sortedFilms];
        }
    }];
}

@end
