//
//  PlantCollectionViewCell.m
//  PlantApp
//
//  Created by Rudi Strahl on 2/8/2014.
//  Copyright (c) 2014 Rudi Strahl. All rights reserved.
//

#import "PlantCollectionViewCell.h"

@implementation PlantCollectionViewCell

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.imageView.layer.cornerRadius = self.imageView.frame.size.height / 2;
}

- (void)setName:(NSString *)name
{
    self.nameLabel.text = name;
}

- (void)setImage:(UIImage *)image
{
    self.imageView.image = image;
}

@end
