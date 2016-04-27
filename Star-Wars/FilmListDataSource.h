//
//  FilmListDataSource.h
//  Star-Wars
//
//  Created by Kristian Lien on 4/27/16.
//  Copyright © 2016 Myriad Mobile. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FilmListDataSource : NSObject

- (instancetype)initWithCollectionView:(UICollectionView *)collectionView;
- (void)appendFilms:(NSArray *)films;

@end
