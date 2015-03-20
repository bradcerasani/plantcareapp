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

@interface PlantDetailsViewController () <UITextFieldDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@property (weak, nonatomic) IBOutlet UIBarButtonItem *cancelButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *doneButton;
@property (weak, nonatomic) IBOutlet UIView *plantIdentityView;
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

- (IBAction)onDoneButtonTap:(id)sender;
- (IBAction)onPhotoButtonTap:(id)sender;
- (IBAction)onPlantNameEdit:(id)sender;
- (IBAction)onLightButtonTap:(id)sender;
- (IBAction)onWaterButtonTap:(id)sender;
- (IBAction)onMistButtonTap:(id)sender;
- (IBAction)onFertilizerButtonTap:(id)sender;

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
    
    // Add tap gesture recognizer for dismissing popover
    self.tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissEditDetailsPopover)];
    self.tapGestureRecognizer.enabled = NO;
    [self.view addGestureRecognizer:self.tapGestureRecognizer];
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

#pragma mark - Core Data

- (void)savePlant
{
    if (_plant == nil)
    {
        self.plant = [[RSCoreDataController sharedController] newPlantEntity];
        _plant.lastUpdated = [NSDate date];
    }
    _plant.plantName = _plantNameTextField.text;
    _plant.waterInterval = @(0);
    _plant.fertilizerInterval = @(0);
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
    }
    
    // Position the view over the button that summoned it
    CGPoint buttonOrigin = [self.feedingDetailsView convertPoint:button.frame.origin toView:self.view];
    DLog(@"%f", buttonOrigin.y);
    CGFloat newX = (self.view.frame.size.width - self.editFeedingDetailsView.frame.size.width) / 2;
    CGFloat newY = fabs(buttonOrigin.y - self.editFeedingDetailsView.frame.size.height);
    CGRect frame = self.editFeedingDetailsView.frame;
    frame.origin.x = newX;
    frame.origin.y = newY;
    self.editFeedingDetailsView.frame = frame;
    
    // Set the data for the view
#warning Incomplete implementation

    // Animate into view
    if (self.editFeedingDetailsView.hidden)
    {
        [self.view addSubview:self.editFeedingDetailsView];
        self.editFeedingDetailsView.hidden = NO;
        [UIView animateWithDuration:0.3f delay:0.0f options:UIViewAnimationOptionCurveEaseOut animations:^{
            self.editFeedingDetailsView.alpha = 1.0f;
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
        self.editFeedingDetailsView.alpha = 0.0f;
    } completion:^(BOOL completed) {
        // Remove the popover from the view stack and disable the tap recognizer
        self.editFeedingDetailsView.hidden = YES;
        [self.editFeedingDetailsView removeFromSuperview];
        self.tapGestureRecognizer.enabled = NO;
    }];
}

@end
