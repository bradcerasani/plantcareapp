//
//  RoundedImageView.m
//  PlantApp
//
//  Created by Rudi Strahl on 2015-03-20.
//  Copyright (c) 2015 Rudi Strahl. All rights reserved.
//

#import "RoundedImageView.h"

@implementation RoundedImageView

- (id)init {
    if (self = [super init]) {
        self.clipsToBounds = YES;
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.layer.cornerRadius = self.frame.size.height * self.cornerRadiusMultiplier;
}

@end
