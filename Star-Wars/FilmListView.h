//
//  FilmListView.h
//  Star-Wars
//
//  Created by Kristian Lien on 4/27/16.
//  Copyright © 2016 Myriad Mobile. All rights reserved.
//

#import "BaseViewController.h"

@protocol FilmListView <BaseViewController>

- (void)appendFilms:(NSArray *)films;

@end
