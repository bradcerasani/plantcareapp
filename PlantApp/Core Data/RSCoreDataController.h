//
//  CoreDataController.h
//
//  Created by Rudi Strahl on 2013-08-22.
//  Copyright (c) 2013 Rudi Strahl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface RSCoreDataController : NSObject

@property (readonly) NSManagedObjectContext         *managedObjectContext;
@property (readonly) NSManagedObjectModel           *managedObjectModel;
@property (readonly) NSPersistentStoreCoordinator   *persistentStoreCoordinator;

+ (id)sharedController;

- (void)saveContext;

@end