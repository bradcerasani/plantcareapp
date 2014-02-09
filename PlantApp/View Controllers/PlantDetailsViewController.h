//
//  PlantDetailsViewController.h
//  PlantApp
//
//  Created by Rudi Strahl on 2/1/2014.
//  Copyright (c) 2014 Rudi Strahl. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Plant;

@interface PlantDetailsViewController : UIViewController

@property (strong, nonatomic) Plant *plant;

/**
 Deletes the image associated with the given plant object.
 @param plant The plant object from which the image will be deleted.
 @return YES if the image was deleted successfully, NO otherwise.
 */
+ (BOOL)deleteImageForPlant:(Plant *)plant;

@end
