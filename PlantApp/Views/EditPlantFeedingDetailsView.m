//
//  EditPlantFeedingDetailsView.m
//  PlantApp
//
//  Created by Rudi Strahl on 2/22/2014.
//  Copyright (c) 2014 Rudi Strahl. All rights reserved.
//

#import "EditPlantFeedingDetailsView.h"

@implementation EditPlantFeedingDetailsView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    self.layer.cornerRadius = 4.0f;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
