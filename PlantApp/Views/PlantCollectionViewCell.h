//
//  PlantCollectionViewCell.h
//  PlantApp
//
//  Created by Rudi Strahl on 2/8/2014.
//  Copyright (c) 2014 Rudi Strahl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlantCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView    *imageView;
@property (weak, nonatomic) IBOutlet UILabel        *nameLabel;

- (void)setName:(NSString *)name;

- (void)setImage:(UIImage *)image;

@end
