//
//  PlantDetailsViewController.m
//  PlantApp
//
//  Created by Rudi Strahl on 2/1/2014.
//  Copyright (c) 2014 Rudi Strahl. All rights reserved.
//

#import "PlantDetailsViewController.h"
#import "EditPlantFeedingDetailsView.h"
#import "Plant.h"
#import <MobileCoreServices/MobileCoreServices.h>

@interface PlantDetailsViewController () <UITextFieldDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate, UIPickerViewDataSource, UIPickerViewDelegate>

@property (weak, nonatomic) IBOutlet UIBarButtonItem *cancelButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *doneButton;
@property (weak, nonatomic) IBOutlet UIView *plantIdentityView;
@property (strong, nonatomic) IBOutlet UIView *blurUnderlayView;
@property (weak, nonatomic) IBOutlet UIView *feedingDetailsView;
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImageView;
@property (weak, nonatomic) IBOutlet UIButton *photoButton;
@property (weak, nonatomic) IBOutlet UIImageView *plantImageView;
@property (weak, nonatomic) IBOutlet UITextField *plantNameTextField;
@property (weak, nonatomic) IBOutlet UIButton *lightButton;
@property (weak, nonatomic) IBOutlet UIButton *waterButton;
@property (weak, nonatomic) IBOutlet UIButton *mistButton;
@property (weak, nonatomic) IBOutlet UIButton *fertilizerButton;
@property (strong, nonatomic) EditPlantFeedingDetailsView *editFeedingDetailsView;
@property (strong, nonatomic) UITapGestureRecognizer *tapGestureRecognizer;
@property (strong, nonatomic) NSArray *timePeriods;

- (IBAction)onDoneButtonTap:(id)sender;
- (IBAction)onPhotoButtonTap:(id)sender;
- (IBAction)onPlantNameEdit:(id)sender;
- (IBAction)onLightButtonTap:(id)sender;
- (IBAction)onWaterButtonTap:(id)sender;
- (IBAction)onMistButtonTap:(id)sender;
- (IBAction)onFertilizerButtonTap:(id)sender;
- (IBAction)onSetScheduleTap:(id)sender;

- (void)displayEditDetailsPopoverForButton:(id)sender;

@end

@implementation PlantDetailsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"Loaded plant : %@", _plant.objectID);
    _plantImageView.image = [_plant imageForPlant];
    _plantNameTextField.text = _plant.plantName;
    
    // Apply style to imageview and button
    _plantImageView.layer.cornerRadius = _photoButton.layer.cornerRadius = _plantImageView.frame.size.width / 2;
    _plantImageView.layer.masksToBounds = _photoButton.layer.masksToBounds = YES;
    
    // Apply style to buttons
    _waterButton.layer.cornerRadius = _waterButton.frame.size.width / 2;
    _mistButton.layer.cornerRadius = _mistButton.frame.size.width / 2;
    _fertilizerButton.layer.cornerRadius = _fertilizerButton.frame.size.width / 2;
#warning CODE REVIEW - Unnecessary in XCode 5.1
    CGFloat ratio = 1.0;
    NSLayoutConstraint *constraint = [NSLayoutConstraint
                                      constraintWithItem:_waterButton
                                      attribute:NSLayoutAttributeWidth
                                      relatedBy:NSLayoutRelationEqual
                                      toItem:_waterButton
                                      attribute:NSLayoutAttributeHeight
                                      multiplier:ratio
                                      constant:0];
    constraint.priority = 1000;
    [_waterButton.superview addConstraint:constraint];
    
    
    
    // Add tap gesture recognizer for dismissing popover
    self.tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissEditDetailsPopover)];
    self.tapGestureRecognizer.enabled = NO;
    [self.view addGestureRecognizer:self.tapGestureRecognizer];
    
    self.timePeriods = @[@"DAYS", @"WEEKS", @"MONTHS"];
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

#pragma mark - UIImagePickerControllerDelegate

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    NSString *mediaType = [info objectForKey: UIImagePickerControllerMediaType];
    UIImage *originalImage, *editedImage, *imageToSave;
    
    // Handle a still image capture
    if (CFStringCompare ((CFStringRef) mediaType, kUTTypeImage, 0) == kCFCompareEqualTo)
    {
        editedImage = (UIImage *) [info objectForKey:UIImagePickerControllerEditedImage];
        originalImage = (UIImage *) [info objectForKey:UIImagePickerControllerOriginalImage];
        if (editedImage)
        {
            imageToSave = editedImage;
        }
        else
        {
            imageToSave = originalImage;
        }
        // Save the new image (original or edited) to the Camera Roll
        UIImageWriteToSavedPhotosAlbum (imageToSave, nil, nil , nil);
        self.plantImageView.image = imageToSave;
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - UIPickerViewDataSource

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 2;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    switch (component)
    {
        case 1: // Time-period column
        {
            return 3;
            break;
        }
        default:
        {
            // Return a value dependent on the selected time-period column
            // 1-6 days
            // 1-3 weeks
            // 1-11 months
            switch ([pickerView selectedRowInComponent:1])
            {
                case 0: // Days
                {
                    return 6;
                    break;
                }
                case 1:
                {
                    return 3;
                    break;
                }
                default:
                {
                    return 11;
                    break;
                }
            }
        }
    }
}

#pragma mark - UIPickerViewDelegate
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    switch (component) {
        case 1: // Time-period column
        {
            return NSLocalizedString([_timePeriods objectAtIndex:row], @"Time period");
            break;
        }
        default:
        {
            return [NSString stringWithFormat:@"%@", @(row+1)];
            break;
        }
    }
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    [pickerView reloadComponent:0];
}


#pragma mark - Core Data

- (void)savePlant
{
    if (_plant == nil)
    {
        self.plant = [[RSCoreDataController sharedController] newPlantEntity];
        _plant.plantDateAdded = [NSDate date];
    }
    _plant.plantName = _plantNameTextField.text;
    _plant.plantWaterPeriod = @(0);
    _plant.plantMistPeriod = @(0);
    _plant.plantFertilizerPeriod = @(0);
    [[RSCoreDataController sharedController] saveContext];
    [self savePlantImage:self.plantImageView.image];
}

- (void)savePlantImage:(UIImage *)image
{
    NSData *imageData = UIImagePNGRepresentation(image);
    if (![imageData writeToFile:[_plant filenameForPlantImage] atomically:NO])
    {
        NSLog(@"Failed to save plant photo");
    }
}

+ (BOOL)deleteImageForPlant:(Plant *)plant
{
    NSError *error;
    if(![[NSFileManager defaultManager] removeItemAtPath:[plant filenameForPlantImage] error:&error])
    {
        NSLog(@"Error deleting plant image: %@", [error localizedDescription]);
        return NO;
    }
    return YES;
}


#pragma mark - IBActions

- (IBAction)onCancelButtonTap:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)onDoneButtonTap:(id)sender
{
    [self savePlant];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)onPhotoButtonTap:(id)sender
{
    // Open the camera picker
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
    {
        UIImagePickerController *cameraController = [[UIImagePickerController alloc] init];
        cameraController.sourceType = UIImagePickerControllerSourceTypeCamera;
        cameraController.allowsEditing = YES;
        cameraController.delegate = self;
        [self presentViewController:cameraController animated:YES completion:nil];
    }
}

- (IBAction)onPlantNameEdit:(id)sender
{
    NSLog(@"plant name: %@", _plantNameTextField.text);
}

- (IBAction)onLightButtonTap:(id)sender
{
    // Present a control that lets you select between light options
    // Shade, Medium, Full?
}

- (IBAction)onWaterButtonTap:(id)sender
{
    // Present a control that lets you select the period in days
    [self displayEditDetailsPopoverForButton:sender];
}

- (IBAction)onMistButtonTap:(id)sender
{
    // Present a control that lets you select the period in days
    [self displayEditDetailsPopoverForButton:sender];
}

- (IBAction)onFertilizerButtonTap:(id)sender
{
    // Present a control that lets you select the period in days
    [self displayEditDetailsPopoverForButton:sender];
}

- (IBAction)onSetScheduleTap:(id)sender
{
    // Determine the current-calling button - view knows its anchor
    UIButton *originButton = self.editFeedingDetailsView.originButton;
    
    // Convert the time-period to days
    
    
    // Save the value to the appropriate plant field
    if (originButton == _waterButton)
    {
        self.plant.plantWaterPeriod = @(0);
    }
    else if (originButton == _mistButton)
    {
        self.plant.plantMistPeriod = @(0);
    }
    else if (originButton == _fertilizerButton)
    {
        self.plant.plantFertilizerPeriod = @(0);
    }
    
    // Refresh the button display
    
    // Dismiss the popover?
}

#pragma mark - 

- (void)displayEditDetailsPopoverForButton:(id)sender
{
    DLog(@"");
    UIButton *button = (UIButton *)sender;
    if (!self.editFeedingDetailsView)
    {
        self.editFeedingDetailsView = [[[NSBundle mainBundle] loadNibNamed:@"EditPlantFeedingDetailsView" owner:self options:nil] objectAtIndex:0];
        self.editFeedingDetailsView.alpha = 0.0f;
        self.editFeedingDetailsView.hidden = YES;
        self.blurUnderlayView.frame = self.view.frame;
        self.blurUnderlayView.alpha = 0.0f;
        self.blurUnderlayView.hidden = YES;
    }
    
    // Position the view over the button that summoned it
    self.editFeedingDetailsView.originButton = button;
    CGPoint buttonOrigin = [self.feedingDetailsView convertPoint:button.frame.origin toView:self.view];
    DLog(@"%f", buttonOrigin.y);
    CGFloat newX = (self.view.frame.size.width - self.editFeedingDetailsView.frame.size.width) / 2;
    CGFloat newY = abs(buttonOrigin.y - self.editFeedingDetailsView.frame.size.height - 8);
    CGRect frame = self.editFeedingDetailsView.frame;
    frame.origin.x = newX;
    frame.origin.y = newY;
    self.editFeedingDetailsView.frame = frame;
    
    // Set the data for the view
#warning Incomplete implementation

    // Animate into view
    if (self.editFeedingDetailsView.hidden)
    {
        [self.view addSubview:self.blurUnderlayView];
        [self.view addSubview:self.editFeedingDetailsView];
        self.editFeedingDetailsView.hidden = NO;
        self.blurUnderlayView.hidden = NO;
        [UIView animateWithDuration:0.3f delay:0.0f options:UIViewAnimationOptionCurveEaseOut animations:^{
            self.editFeedingDetailsView.alpha = 1.0f;
            self.blurUnderlayView.alpha = 0.5f;
        } completion:^(BOOL completion) {
            // Enable the tap recognizer in the superview so we can dismiss the popover
            self.tapGestureRecognizer.enabled = YES;
        }];
    }
}

- (void)dismissEditDetailsPopover
{
    DLog(@"");
    // Animate
    [UIView animateWithDuration:0.3f delay:0.0f options:UIViewAnimationOptionCurveEaseIn animations:^{
        self.blurUnderlayView.alpha = 0.0f;
        self.editFeedingDetailsView.alpha = 0.0f;
    } completion:^(BOOL completed) {
        // Remove the popover from the view stack and disable the tap recognizer
        self.editFeedingDetailsView.hidden = YES;
        self.blurUnderlayView.hidden = YES;
        [self.editFeedingDetailsView removeFromSuperview];
        [self.blurUnderlayView removeFromSuperview];
        self.tapGestureRecognizer.enabled = NO;
    }];
}

@end
