//
//  PlantDetailsViewController.m
//  PlantApp
//
//  Created by Rudi Strahl on 2/1/2014.
//  Copyright (c) 2014 Rudi Strahl. All rights reserved.
//

#import "PlantDetailsViewController.h"
#import "Plant.h"
#import "RoundedImageView.h"
#import <MobileCoreServices/MobileCoreServices.h>

@interface PlantDetailsViewController () <UITextFieldDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@property (weak, nonatomic) IBOutlet UIBarButtonItem *cancelButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *doneButton;
@property (weak, nonatomic) IBOutlet UIView *plantIdentityView;
@property (weak, nonatomic) IBOutlet UIView *feedingDetailsView;
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImageView;
@property (weak, nonatomic) IBOutlet UIButton *photoButton;
@property (weak, nonatomic) IBOutlet RoundedImageView *plantImageView;
@property (weak, nonatomic) IBOutlet UITextField *plantNameTextField;
@property (weak, nonatomic) IBOutlet UIButton *waterButton;
@property (weak, nonatomic) IBOutlet UIButton *fertilizerButton;

- (IBAction)onDoneButtonTap:(id)sender;
- (IBAction)onPhotoButtonTap:(id)sender;
- (IBAction)onPlantNameEdit:(id)sender;
- (IBAction)onWaterButtonTap:(id)sender;
- (IBAction)onFertilizerButtonTap:(id)sender;

@end

@implementation PlantDetailsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    DLog(@"Loaded plant : %@", _plant.objectID);
    _plantImageView.image = [_plant imageForPlant];
    _plantNameTextField.text = _plant.plantName;
    
    // Apply style to image view and button
    _plantImageView.cornerRadiusMultiplier = 0.5f;
    
    // Apply style to buttons
    _waterButton.layer.cornerRadius = _waterButton.frame.size.width / 2;
    _fertilizerButton.layer.cornerRadius = _fertilizerButton.frame.size.width / 2;
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
    NSString *mediaType = info[UIImagePickerControllerMediaType];
    UIImage *originalImage, *editedImage, *imageToSave;
    
    // Handle a still image capture
    if (CFStringCompare ((CFStringRef) mediaType, kUTTypeImage, 0) == kCFCompareEqualTo)
    {
        editedImage = (UIImage *) info[UIImagePickerControllerEditedImage];
        originalImage = (UIImage *) info[UIImagePickerControllerOriginalImage];
        imageToSave = editedImage ?: originalImage;

        // Save the new image (original or edited) to the Camera Roll
        UIImageWriteToSavedPhotosAlbum(imageToSave, nil, nil , nil);
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
        _plant.plantDateAdded = [NSDate date];
    }
    _plant.plantName = _plantNameTextField.text;
#warning TODO: save actual data
    _plant.plantWaterPeriod = @(0);
    _plant.plantFertilizerPeriod = @(0);
    [[RSCoreDataController sharedController] saveContext];
    [self savePlantImage:self.plantImageView.image];
}

- (void)savePlantImage:(UIImage *)image
{
    NSData *imageData = UIImagePNGRepresentation(image);
    if (![imageData writeToFile:[_plant filenameForPlantImage] atomically:NO])
    {
        DLog(@"Failed to save plant photo");
    }
}

+ (BOOL)deleteImageForPlant:(Plant *)plant
{
    NSError *error;
    if(![[NSFileManager defaultManager] removeItemAtPath:[plant filenameForPlantImage] error:&error])
    {
        DLog(@"Error deleting plant image: %@", [error localizedDescription]);
        return NO;
    }
    return YES;
}


#pragma mark - IBActions

- (IBAction)onCancelButtonTap:(id)sender
{
    DLog(@"");
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)onDoneButtonTap:(id)sender
{
    DLog(@"");
    [self savePlant];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)onPhotoButtonTap:(id)sender
{
    DLog(@"");
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
    DLog(@"plant name: %@", _plantNameTextField.text);
}

- (IBAction)onWaterButtonTap:(id)sender
{
    DLog(@"");
}

- (IBAction)onFertilizerButtonTap:(id)sender
{
    DLog(@"");
}

@end
