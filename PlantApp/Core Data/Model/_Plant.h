// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Plant.h instead.

#import <CoreData/CoreData.h>

extern const struct PlantAttributes {
	__unsafe_unretained NSString *fertilizerInterval;
	__unsafe_unretained NSString *lastUpdated;
	__unsafe_unretained NSString *photoFilename;
	__unsafe_unretained NSString *plantId;
	__unsafe_unretained NSString *plantName;
	__unsafe_unretained NSString *waterInterval;
} PlantAttributes;

@interface PlantID : NSManagedObjectID {}
@end

@interface _Plant : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) PlantID* objectID;

@property (nonatomic, strong) NSNumber* fertilizerInterval;

@property (atomic) int16_t fertilizerIntervalValue;
- (int16_t)fertilizerIntervalValue;
- (void)setFertilizerIntervalValue:(int16_t)value_;

//- (BOOL)validateFertilizerInterval:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSDate* lastUpdated;

//- (BOOL)validateLastUpdated:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* photoFilename;

//- (BOOL)validatePhotoFilename:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* plantId;

@property (atomic) int16_t plantIdValue;
- (int16_t)plantIdValue;
- (void)setPlantIdValue:(int16_t)value_;

//- (BOOL)validatePlantId:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* plantName;

//- (BOOL)validatePlantName:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* waterInterval;

@property (atomic) int16_t waterIntervalValue;
- (int16_t)waterIntervalValue;
- (void)setWaterIntervalValue:(int16_t)value_;

//- (BOOL)validateWaterInterval:(id*)value_ error:(NSError**)error_;

@end

@interface _Plant (CoreDataGeneratedPrimitiveAccessors)

- (NSNumber*)primitiveFertilizerInterval;
- (void)setPrimitiveFertilizerInterval:(NSNumber*)value;

- (int16_t)primitiveFertilizerIntervalValue;
- (void)setPrimitiveFertilizerIntervalValue:(int16_t)value_;

- (NSDate*)primitiveLastUpdated;
- (void)setPrimitiveLastUpdated:(NSDate*)value;

- (NSString*)primitivePhotoFilename;
- (void)setPrimitivePhotoFilename:(NSString*)value;

- (NSNumber*)primitivePlantId;
- (void)setPrimitivePlantId:(NSNumber*)value;

- (int16_t)primitivePlantIdValue;
- (void)setPrimitivePlantIdValue:(int16_t)value_;

- (NSString*)primitivePlantName;
- (void)setPrimitivePlantName:(NSString*)value;

- (NSNumber*)primitiveWaterInterval;
- (void)setPrimitiveWaterInterval:(NSNumber*)value;

- (int16_t)primitiveWaterIntervalValue;
- (void)setPrimitiveWaterIntervalValue:(int16_t)value_;

@end
