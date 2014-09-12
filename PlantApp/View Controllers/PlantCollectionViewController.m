//
//  PlantCollectionViewController.m
//  PlantApp
//
//  Created by Rudi Strahl on 2/1/2014.
//  Copyright (c) 2014 Rudi Strahl. All rights reserved.
//

#import "PlantCollectionViewController.h"
#import "PlantDetailsViewController.h"
#import "PlantCollectionViewCell.h"
#import "Plant.h"

@interface PlantCollectionViewController () <NSFetchedResultsControllerDelegate, UICollectionViewDataSource, UICollectionViewDelegate>

@property (readonly) NSFetchedResultsController *fetchedResultsController;

@end

NSMutableArray              *_objectChanges;
NSFetchedResultsController  *_fetchedResultsController;

NSString * const kFetchedResultsControllerCacheName = @"PlantCache";

@implementation PlantCollectionViewController

- (void)awakeFromNib
{
    _objectChanges = [NSMutableArray array];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self updateFetchResults];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - NSFetchedResultsController

/**
 Singleton accessor for the NSFetchedResultsController for the collection view.
 */
- (NSFetchedResultsController *)fetchedResultsController
{
    if (_fetchedResultsController != nil)
    {
        return _fetchedResultsController;
    }
    
    NSManagedObjectContext *context = [[RSCoreDataController sharedController] managedObjectContext];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *plantEntity = [NSEntityDescription entityForName:kPlantEntityName inManagedObjectContext:context];
    [fetchRequest setEntity:plantEntity];
    [fetchRequest setFetchBatchSize:20];
    
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"name" ascending:YES];
    NSArray *sortDescriptors = @[sortDescriptor];
    
    [fetchRequest setSortDescriptors:sortDescriptors];

    NSFetchedResultsController *fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest
                                                                                                managedObjectContext:context
                                                                                                  sectionNameKeyPath:nil
                                                                                                           cacheName:kFetchedResultsControllerCacheName];
    fetchedResultsController.delegate = self;
    _fetchedResultsController = fetchedResultsController;
    return _fetchedResultsController;
}

/**
 Updates the results in the NSFetchedResultsController and reloads the collectionView.
 */
- (void)updateFetchResults
{
    NSError *error = nil;
    if (![self.fetchedResultsController performFetch:&error])
    {
#warning CODE REVIEW - Use proper error handling
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"fetchedResultsController error %@, %@", error, [error userInfo]);
        abort();
    }
    [self.collectionView reloadData];
}

#pragma mark - NSFetchedResultsControllerDelegate

- (void)controller:(NSFetchedResultsController *)controller didChangeObject:(id)anObject atIndexPath:(NSIndexPath *)indexPath forChangeType:(NSFetchedResultsChangeType)type newIndexPath:(NSIndexPath *)newIndexPath
{
    NSMutableDictionary *change = [NSMutableDictionary new];
    switch(type)
    {
        case NSFetchedResultsChangeInsert:
            change[@(type)] = newIndexPath;
            break;
        case NSFetchedResultsChangeDelete:
            change[@(type)] = indexPath;
            break;
        case NSFetchedResultsChangeUpdate:
            change[@(type)] = indexPath;
            break;
        case NSFetchedResultsChangeMove:
            change[@(type)] = @[indexPath, newIndexPath];
            break;
    }
    [_objectChanges addObject:change];
}

- (void)controllerWillChangeContent:(NSFetchedResultsController *)controller
{
    
}

- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller
{
    if ([_objectChanges count] > 0)
    {
        [self.collectionView performBatchUpdates:^ {
            for (NSDictionary *change in _objectChanges)
            {
                [change enumerateKeysAndObjectsUsingBlock:^(NSNumber *key, id object, BOOL *stop) {
                    NSFetchedResultsChangeType type = [key unsignedIntegerValue];
                    switch (type)
                    {
                        case NSFetchedResultsChangeInsert:
                            [self.collectionView insertItemsAtIndexPaths:@[object]];
                            break;
                        case NSFetchedResultsChangeDelete:
                            [self.collectionView deleteItemsAtIndexPaths:@[object]];
                            break;
                        case NSFetchedResultsChangeUpdate:
                            [self.collectionView reloadItemsAtIndexPaths:@[object]];
                            break;
                        case NSFetchedResultsChangeMove:
                            [self.collectionView moveItemAtIndexPath:object[0] toIndexPath:object[1]];
                            break;
                    }
                }];
            }
        } completion:nil];
    }
    [_objectChanges removeAllObjects];
}

#pragma mark - UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"PlantDetailSegue" sender:[collectionView cellForItemAtIndexPath:indexPath]];
}

#pragma mark - UICollectionViewDataSource

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    PlantCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"PlantCell" forIndexPath:indexPath];
    
    return [self configureCell:cell forIndexPath:indexPath];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return [[_fetchedResultsController sections] count];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [[[_fetchedResultsController sections] objectAtIndex:section] numberOfObjects];
}

#pragma mark - Helper

- (UICollectionViewCell *)configureCell:(PlantCollectionViewCell *)cell forIndexPath:(NSIndexPath *)indexPath
{
    Plant *plant = [_fetchedResultsController objectAtIndexPath:indexPath];
    [cell setName:plant.name];
    [cell setImage:[UIImage imageWithData:plant.image]];
    return cell;
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"PlantDetailSegue"])
    {
        UINavigationController *navController = segue.destinationViewController;
        PlantDetailsViewController *detailsViewController = (PlantDetailsViewController *)navController.topViewController;
        if ([sender isKindOfClass:[UICollectionViewCell class]])
        {
            UICollectionViewCell *cell = (UICollectionViewCell *)sender;
            detailsViewController.plant = [_fetchedResultsController objectAtIndexPath:[self.collectionView indexPathForCell:cell]];
        }
    }
}

@end
