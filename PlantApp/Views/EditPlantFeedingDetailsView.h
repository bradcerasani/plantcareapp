//
//  EditPlantFeedingDetailsView.h
//  PlantApp
//
//  Created by Rudi Strahl on 2/22/2014.
//  Copyright (c) 2014 Rudi Strahl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EditPlantFeedingDetailsView : UIView
@property (weak, nonatomic) IBOutlet UIPickerView *feedingPeriodPickerView;
@property (weak, nonatomic) IBOutlet UIButton *setScheduleButton;
@property (weak, nonatomic) IBOutlet UIButton *resetPeriodButton;

@end
