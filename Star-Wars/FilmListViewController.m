//
//  FilmListViewController.m
//  Star-Wars
//
//  Created by Kristian Lien on 2/26/16.
//  Copyright © 2016 Myriad Mobile. All rights reserved.
//

#import "FilmListViewController.h"

#import "FilmListView.h"
#import "FilmListPresenter.h"
#import "FilmListDataSource.h"

@interface FilmListViewController () <FilmListView>

@property(nonatomic, weak) IBOutlet UICollectionView *collectionView;

@property(nonatomic, strong) FilmListDataSource *dataSource;
@property(nonatomic) id<FilmListPresenter> presenter;

@end

@implementation FilmListViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self initializeComponents];
}

- (void)initializeComponents
{
    self.presenter = [FilmListPresenter new];
    self.dataSource = [[FilmListDataSource alloc] initWithCollectionView:self.collectionView];
}

- (void)appendFilms:(NSArray *)films
{
    // TODO If pagination is needed, we won't want to overwrite the existing list
    [self.dataSource appendFilms:films];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
