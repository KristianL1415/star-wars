//
//  BaseViewController.h
//  Star-Wars
//
//  Created by Kristian Lien on 4/27/16.
//  Copyright © 2016 Myriad Mobile. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol BaseViewController <NSObject>

- (void)setNetworkError:(NSString *)message;

@end

@interface BaseViewController : UIViewController <BaseViewController>

@end
