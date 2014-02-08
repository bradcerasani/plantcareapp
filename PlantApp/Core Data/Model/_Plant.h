// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Plant.h instead.

#import <CoreData/CoreData.h>


extern const struct PlantAttributes {
	__unsafe_unretained NSString *plantDateAdded;
	__unsafe_unretained NSString *plantFertilizerPeriod;
	__unsafe_unretained NSString *plantId;
	__unsafe_unretained NSString *plantImageFilename;
	__unsafe_unretained NSString *plantMistPeriod;
	__unsafe_unretained NSString *plantName;
	__unsafe_unretained NSString *plantWaterPeriod;
} PlantAttributes;

extern const struct PlantRelationships {
} PlantRelationships;

extern const struct PlantFetchedProperties {
} PlantFetchedProperties;










@interface PlantID : NSManagedObjectID {}
@end

@interface _Plant : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (PlantID*)objectID;





@property (nonatomic, strong) NSDate* plantDateAdded;



//- (BOOL)validatePlantDateAdded:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* plantFertilizerPeriod;



@property int16_t plantFertilizerPeriodValue;
- (int16_t)plantFertilizerPeriodValue;
- (void)setPlantFertilizerPeriodValue:(int16_t)value_;

//- (BOOL)validatePlantFertilizerPeriod:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* plantId;



@property int16_t plantIdValue;
- (int16_t)plantIdValue;
- (void)setPlantIdValue:(int16_t)value_;

//- (BOOL)validatePlantId:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* plantImageFilename;



//- (BOOL)validatePlantImageFilename:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* plantMistPeriod;



@property int16_t plantMistPeriodValue;
- (int16_t)plantMistPeriodValue;
- (void)setPlantMistPeriodValue:(int16_t)value_;

//- (BOOL)validatePlantMistPeriod:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* plantName;



//- (BOOL)validatePlantName:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* plantWaterPeriod;



@property int16_t plantWaterPeriodValue;
- (int16_t)plantWaterPeriodValue;
- (void)setPlantWaterPeriodValue:(int16_t)value_;

//- (BOOL)validatePlantWaterPeriod:(id*)value_ error:(NSError**)error_;






@end

@interface _Plant (CoreDataGeneratedAccessors)

@end

@interface _Plant (CoreDataGeneratedPrimitiveAccessors)


- (NSDate*)primitivePlantDateAdded;
- (void)setPrimitivePlantDateAdded:(NSDate*)value;




- (NSNumber*)primitivePlantFertilizerPeriod;
- (void)setPrimitivePlantFertilizerPeriod:(NSNumber*)value;

- (int16_t)primitivePlantFertilizerPeriodValue;
- (void)setPrimitivePlantFertilizerPeriodValue:(int16_t)value_;




- (NSNumber*)primitivePlantId;
- (void)setPrimitivePlantId:(NSNumber*)value;

- (int16_t)primitivePlantIdValue;
- (void)setPrimitivePlantIdValue:(int16_t)value_;




- (NSString*)primitivePlantImageFilename;
- (void)setPrimitivePlantImageFilename:(NSString*)value;




- (NSNumber*)primitivePlantMistPeriod;
- (void)setPrimitivePlantMistPeriod:(NSNumber*)value;

- (int16_t)primitivePlantMistPeriodValue;
- (void)setPrimitivePlantMistPeriodValue:(int16_t)value_;




- (NSString*)primitivePlantName;
- (void)setPrimitivePlantName:(NSString*)value;




- (NSNumber*)primitivePlantWaterPeriod;
- (void)setPrimitivePlantWaterPeriod:(NSNumber*)value;

- (int16_t)primitivePlantWaterPeriodValue;
- (void)setPrimitivePlantWaterPeriodValue:(int16_t)value_;




@end
