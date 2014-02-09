//
//  RSCoreDataController+PlantApp.m
//  PlantApp
//
//  Created by Rudi Strahl on 2/8/2014.
//  Copyright (c) 2014 Rudi Strahl. All rights reserved.
//

#import "RSCoreDataController+PlantApp.h"
#import "Plant.h"

@implementation RSCoreDataController (PlantApp)

- (Plant *)newPlantEntity
{
    Plant *newPlant = (Plant *)[NSEntityDescription insertNewObjectForEntityForName:kPlantEntityName inManagedObjectContext:self.managedObjectContext];
    return newPlant;
}

@end
