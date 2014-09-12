//
//  PlantDetailsViewController.m
//  PlantApp
//
//  Created by Rudi Strahl on 2/1/2014.
//  Copyright (c) 2014 Rudi Strahl. All rights reserved.
//

#import "PlantDetailsViewController.h"
#import "Plant.h"
#import "RSRadialProgressView.h"
#import <MobileCoreServices/MobileCoreServices.h>

@interface PlantDetailsViewController () <UITextFieldDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@property (nonatomic, weak) IBOutlet UIImageView            *backgroundImageView;
@property (nonatomic, weak) IBOutlet UIButton               *photoButton;
@property (nonatomic, weak) IBOutlet UIImageView            *plantImageView;
@property (nonatomic, weak) IBOutlet UITextField            *plantNameTextField;
@property (nonatomic, weak) IBOutlet UIButton               *waterButton;
@property (nonatomic, weak) IBOutlet UIButton               *fertilizerButton;
@property (nonatomic, weak) IBOutlet RSRadialProgressView   *waterProgressView;
@property (nonatomic, weak) IBOutlet UILabel                *waterProgressLabel;

- (IBAction)photoButtonTapped:(id)sender;
- (IBAction)onPlantNameEdit:(id)sender;
- (IBAction)waterButtonTapped:(id)sender;
- (IBAction)fertilizerButtonTapped:(id)sender;
- (IBAction)saveButtonTapped:(id)sender;

@end

@implementation PlantDetailsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"Loaded plant : %@", self.plant.objectID);
    self.plantImageView.image = [UIImage imageWithData:self.plant.image];
    self.plantNameTextField.text = self.plant.name;
    
    // Apply style to imageview and button
    self.plantImageView.layer.cornerRadius = self.photoButton.layer.cornerRadius = self.plantImageView.frame.size.width / 2;
    self.plantImageView.layer.masksToBounds = self.photoButton.layer.masksToBounds = YES;
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
        self.plant.dateCreated = [NSDate date];
    }
    self.plant.name = _plantNameTextField.text;
    self.plant.waterPeriod = @(0);
    self.plant.image = UIImageJPEGRepresentation(self.plantImageView.image, 1);
    [[RSCoreDataController sharedController] saveContext];
}

#pragma mark - IBActions

- (IBAction)photoButtonTapped:(id)sender
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

- (IBAction)waterButtonTapped:(id)sender
{
}

- (IBAction)fertilizerButtonTapped:(id)sender
{
}

- (IBAction)saveButtonTapped:(id)sender
{
    [self savePlant];
}


@end
