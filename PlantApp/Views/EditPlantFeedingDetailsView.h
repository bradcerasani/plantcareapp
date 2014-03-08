//
//  EditPlantFeedingDetailsView.h
//  PlantApp
//
//  Created by Rudi Strahl on 2/22/2014.
//  Copyright (c) 2014 Rudi Strahl. All rights reserved.
//

#import <UIKit/UIKit.h>

@class EditPlantFeedingDetailsView;

@protocol EditFeedingDetailDelegate <NSObject>

- feedingDetailView:(EditPlantFeedingDetailsView *)view didSetSchedule:(NSNumber *)days ForButton:(UIButton *)button;

@end

@interface EditPlantFeedingDetailsView : UIView

@property (weak, nonatomic) IBOutlet UIPickerView *feedingPeriodPickerView;
@property (weak, nonatomic) IBOutlet UIButton *setScheduleButton;
@property (weak, nonatomic) IBOutlet UIButton *resetPeriodButton;
@property (weak, nonatomic) UIButton *originButton;
@property (unsafe_unretained, nonatomic) id<EditFeedingDetailDelegate> delegate;

@end
