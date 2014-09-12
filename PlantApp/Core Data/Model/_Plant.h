// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Plant.h instead.

@import CoreData;

extern const struct PlantAttributes {
	__unsafe_unretained NSString *dateCreated;
	__unsafe_unretained NSString *dateWaterRefreshed;
	__unsafe_unretained NSString *image;
	__unsafe_unretained NSString *name;
	__unsafe_unretained NSString *uid;
	__unsafe_unretained NSString *waterPeriod;
} PlantAttributes;

@interface PlantID : NSManagedObjectID {}
@end

@interface _Plant : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) PlantID* objectID;

@property (nonatomic, strong) NSDate* dateCreated;

//- (BOOL)validateDateCreated:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSDate* dateWaterRefreshed;

//- (BOOL)validateDateWaterRefreshed:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSData* image;

//- (BOOL)validateImage:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* name;

//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* uid;

//- (BOOL)validateUid:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* waterPeriod;

@property (atomic) int16_t waterPeriodValue;
- (int16_t)waterPeriodValue;
- (void)setWaterPeriodValue:(int16_t)value_;

//- (BOOL)validateWaterPeriod:(id*)value_ error:(NSError**)error_;

@end

@interface _Plant (CoreDataGeneratedPrimitiveAccessors)

- (NSDate*)primitiveDateCreated;
- (void)setPrimitiveDateCreated:(NSDate*)value;

- (NSDate*)primitiveDateWaterRefreshed;
- (void)setPrimitiveDateWaterRefreshed:(NSDate*)value;

- (NSData*)primitiveImage;
- (void)setPrimitiveImage:(NSData*)value;

- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;

- (NSString*)primitiveUid;
- (void)setPrimitiveUid:(NSString*)value;

- (NSNumber*)primitiveWaterPeriod;
- (void)setPrimitiveWaterPeriod:(NSNumber*)value;

- (int16_t)primitiveWaterPeriodValue;
- (void)setPrimitiveWaterPeriodValue:(int16_t)value_;

@end
