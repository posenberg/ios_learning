//
//  MovieTableViewCell.h
//  RottenTomatoes
//
//  Created by Mel on 10/18/14.
//  Copyright (c) 2014 Melinda Po. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MovieTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *thumbnailImageView;
@property (weak, nonatomic) IBOutlet UILabel *movieTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;

@end
