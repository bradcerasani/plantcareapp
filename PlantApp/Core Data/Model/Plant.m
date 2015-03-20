#import "Plant.h"


@interface Plant ()

// Private interface goes here.

@end


@implementation Plant

- (UIImage *)imageForPlant
{
    UIImage *plantImage = [UIImage imageWithContentsOfFile:[self filenameForPlantImage]];
    return plantImage;
}

- (NSString *)filenameForPlantImage
{
    NSString *uriRepresentation = [[(NSManagedObjectID *)self.objectID URIRepresentation] lastPathComponent];
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *filename = [documentsDirectory stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.png", uriRepresentation]];
    DLog(@"Calculated string: %@", filename);
    return filename;
}

@end
