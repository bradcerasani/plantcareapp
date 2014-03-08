#import "_Plant.h"

typedef enum {
    PlantFeedLightShade,
    PlantFeedLightMedium,
    PlantFeedLightFull
} PlantFeedLight;

typedef enum {
    PlantFeedTypeLight = 1,
    PlantFeedTypeFertilizer = 2,
    PlantFeedTypeWater = 3,
    PlantFeedTypeMist = 4
} PlantFeedType;

@interface Plant : _Plant {}

/**
 Returns the UIImage saved for the plant object, if one exists.
 @return A UIImage representation of the image saved, nil if not found or doesn't exist.
 */
- (UIImage *)imageForPlant;

/**
 Returns the filename calculated for the image stored for the plant object.
 @return The filename for the plant's image.
 */
- (NSString *)filenameForPlantImage;

@end
