//
//  FilmListDataSource.m
//  Star-Wars
//
//  Created by Kristian Lien on 4/27/16.
//  Copyright © 2016 Myriad Mobile. All rights reserved.
//

#import "FilmListDataSource.h"

#import "Film.h"
#import "FilmCell.h"

@interface FilmListDataSource () <UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property(nonatomic, strong) UICollectionView *collectionView;
@property(nonatomic, copy) NSArray *films;

@end

@implementation FilmListDataSource

CGFloat const kCellSpacing = 8.0;

- (instancetype)initWithCollectionView:(UICollectionView *)collectionView
{
    self = [super init];
    
    if (self)
    {
        collectionView.dataSource = self;
        collectionView.delegate = self;
        _collectionView = collectionView;
        _films = @[];
    }
    
    return self;
}

- (void)appendFilms:(NSArray *)films
{
    // TODO If pagination is needed, we won't want to overwrite the existing list
    self.films = [self.films arrayByAddingObjectsFromArray:films];
    [self.collectionView reloadData];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.films.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    FilmCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"filmCell" forIndexPath:indexPath];
    
    Film *film = self.films[indexPath.row];
    cell.title.text = film.title;
    cell.director.text = film.director;
    
    return cell;
}

#pragma mark - Layout

- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat edge = (collectionView.frame.size.width - kCellSpacing) / 2;
    return CGSizeMake(edge, edge);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView
                        layout:(UICollectionViewLayout *)collectionViewLayout
        insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(8.0, 0.0, 8.0, 0.0);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView
                   layout:(UICollectionViewLayout *)collectionViewLayout
minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return kCellSpacing;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView
                   layout:(UICollectionViewLayout *)collectionViewLayout
minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return kCellSpacing/2;
}

@end
