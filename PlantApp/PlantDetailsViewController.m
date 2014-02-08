//
//  PlantDetailsViewController.m
//  PlantApp
//
//  Created by Rudi Strahl on 2/1/2014.
//  Copyright (c) 2014 Rudi Strahl. All rights reserved.
//

#import "PlantDetailsViewController.h"

@interface PlantDetailsViewController ()
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

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onDoneButtonTap:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)onPhotoButtonTap:(id)sender {
}

- (IBAction)onPlantNameEdit:(id)sender {
}

- (IBAction)onLightButtonTap:(id)sender {
}

- (IBAction)onWaterButtonTap:(id)sender {
}

- (IBAction)onMistButtonTap:(id)sender {
}

- (IBAction)onFertilizerButtonTap:(id)sender {
}
@end