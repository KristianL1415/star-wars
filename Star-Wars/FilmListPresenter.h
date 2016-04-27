//
//  FilmListPresenter.h
//  Star-Wars
//
//  Created by Kristian Lien on 4/27/16.
//  Copyright © 2016 Myriad Mobile. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol FilmListPresenter <NSObject>

- (void)getFilmList; // Could pass a page here for pagination

@end

@interface FilmListPresenter : NSObject <FilmListPresenter>

@end
