//
//  PlantDetailsViewController.m
//  PlantApp
//
//  Created by Rudi Strahl on 2/1/2014.
//  Copyright (c) 2014 Rudi Strahl. All rights reserved.
//

#import "PlantDetailsViewController.h"
#import "Plant.h"

@interface PlantDetailsViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UIBarButtonItem *doneButton;
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImageView;
@property (weak, nonatomic) IBOutlet UIButton *photoButton;
@property (weak, nonatomic) IBOutlet UITextField *plantNameTextField;
@property (weak, nonatomic) IBOutlet UIButton *lightButton;
@property (weak, nonatomic) IBOutlet UIButton *waterButton;
@property (weak, nonatomic) IBOutlet UIButton *mistButton;
@property (weak, nonatomic) IBOutlet UIButton *fertilizerButton;

- (IBAction)onDoneButtonTap:(id)sender;
- (IBAction)onPhotoButtonTap:(id)sender;
- (IBAction)onPlantNameEdit:(id)sender;
- (IBAction)onLightButtonTap:(id)sender;
- (IBAction)onWaterButtonTap:(id)sender;
- (IBAction)onMistButtonTap:(id)sender;
- (IBAction)onFertilizerButtonTap:(id)sender;

@end

@implementation PlantDetailsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

#pragma mark - Core Data

- (void)updatePlantEntity
{
    if (_plant == nil)
    {
        self.plant = [[RSCoreDataController sharedController] newPlantEntity];
        _plant.plantDateAdded = [NSDate date];
    }
    _plant.plantId = @(0);
    _plant.plantName = _plantNameTextField.text;
    _plant.plantImageFilename = @"";
    _plant.plantWaterPeriod = @(0);
    _plant.plantMistPeriod = @(0);
    _plant.plantFertilizerPeriod = @(0);
    [[RSCoreDataController sharedController] saveContext];
}

#pragma mark - IBActions

- (IBAction)onDoneButtonTap:(id)sender
{
    // Save new plant into core data
    [self updatePlantEntity];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)onPhotoButtonTap:(id)sender
{
}

- (IBAction)onPlantNameEdit:(id)sender
{
    NSLog(@"plant name: %@", _plantNameTextField.text);
}

- (IBAction)onLightButtonTap:(id)sender
{
}

- (IBAction)onWaterButtonTap:(id)sender
{
}

- (IBAction)onMistButtonTap:(id)sender
{
}

- (IBAction)onFertilizerButtonTap:(id)sender
{
}

@end
