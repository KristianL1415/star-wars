//
//  FilmCell.h
//  Star-Wars
//
//  Created by Kristian Lien on 4/28/16.
//  Copyright © 2016 Myriad Mobile. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FilmCell : UICollectionViewCell

@property(nonatomic, weak) IBOutlet UILabel *title;
@property(nonatomic, weak) IBOutlet UILabel *director;
@property(nonatomic, weak) IBOutlet UILabel *releaseDate;

@end
