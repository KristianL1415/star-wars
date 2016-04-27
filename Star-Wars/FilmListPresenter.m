//
//  FilmListPresenter.m
//  Star-Wars
//
//  Created by Kristian Lien on 4/27/16.
//  Copyright © 2016 Myriad Mobile. All rights reserved.
//

#import "FilmListPresenter.h"

#import "FilmService.h"
#import "FilmListView.h"
#import "FilmsResponse.h"

@interface FilmListPresenter ()

@property(nonatomic) id<FilmListView> filmListView;

@end

@implementation FilmListPresenter

- (void)getFilmList
{
    [[FilmService sharedInstance] films:^(FilmsResponse *response, NSError *error) {
        if (error) {
            [self.filmListView setNetworkError:error.localizedDescription];
        }
        else {
            [self.filmListView appendFilms:response.films];
        }
    }];
}

@end
