// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Plant.m instead.

#import "_Plant.h"

const struct PlantAttributes PlantAttributes = {
	.plantDateAdded = @"plantDateAdded",
	.plantFertilizerPeriod = @"plantFertilizerPeriod",
	.plantId = @"plantId",
	.plantImageFilename = @"plantImageFilename",
	.plantMistPeriod = @"plantMistPeriod",
	.plantName = @"plantName",
	.plantWaterPeriod = @"plantWaterPeriod",
};

const struct PlantRelationships PlantRelationships = {
};

const struct PlantFetchedProperties PlantFetchedProperties = {
};

@implementation PlantID
@end

@implementation _Plant

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Plant" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Plant";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Plant" inManagedObjectContext:moc_];
}

- (PlantID*)objectID {
	return (PlantID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	
	if ([key isEqualToString:@"plantFertilizerPeriodValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"plantFertilizerPeriod"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"plantIdValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"plantId"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"plantMistPeriodValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"plantMistPeriod"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"plantWaterPeriodValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"plantWaterPeriod"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}




@dynamic plantDateAdded;






@dynamic plantFertilizerPeriod;



- (int16_t)plantFertilizerPeriodValue {
	NSNumber *result = [self plantFertilizerPeriod];
	return [result shortValue];
}

- (void)setPlantFertilizerPeriodValue:(int16_t)value_ {
	[self setPlantFertilizerPeriod:[NSNumber numberWithShort:value_]];
}

- (int16_t)primitivePlantFertilizerPeriodValue {
	NSNumber *result = [self primitivePlantFertilizerPeriod];
	return [result shortValue];
}

- (void)setPrimitivePlantFertilizerPeriodValue:(int16_t)value_ {
	[self setPrimitivePlantFertilizerPeriod:[NSNumber numberWithShort:value_]];
}





@dynamic plantId;



- (int16_t)plantIdValue {
	NSNumber *result = [self plantId];
	return [result shortValue];
}

- (void)setPlantIdValue:(int16_t)value_ {
	[self setPlantId:[NSNumber numberWithShort:value_]];
}

- (int16_t)primitivePlantIdValue {
	NSNumber *result = [self primitivePlantId];
	return [result shortValue];
}

- (void)setPrimitivePlantIdValue:(int16_t)value_ {
	[self setPrimitivePlantId:[NSNumber numberWithShort:value_]];
}





@dynamic plantImageFilename;






@dynamic plantMistPeriod;



- (int16_t)plantMistPeriodValue {
	NSNumber *result = [self plantMistPeriod];
	return [result shortValue];
}

- (void)setPlantMistPeriodValue:(int16_t)value_ {
	[self setPlantMistPeriod:[NSNumber numberWithShort:value_]];
}

- (int16_t)primitivePlantMistPeriodValue {
	NSNumber *result = [self primitivePlantMistPeriod];
	return [result shortValue];
}

- (void)setPrimitivePlantMistPeriodValue:(int16_t)value_ {
	[self setPrimitivePlantMistPeriod:[NSNumber numberWithShort:value_]];
}





@dynamic plantName;






@dynamic plantWaterPeriod;



- (int16_t)plantWaterPeriodValue {
	NSNumber *result = [self plantWaterPeriod];
	return [result shortValue];
}

- (void)setPlantWaterPeriodValue:(int16_t)value_ {
	[self setPlantWaterPeriod:[NSNumber numberWithShort:value_]];
}

- (int16_t)primitivePlantWaterPeriodValue {
	NSNumber *result = [self primitivePlantWaterPeriod];
	return [result shortValue];
}

- (void)setPrimitivePlantWaterPeriodValue:(int16_t)value_ {
	[self setPrimitivePlantWaterPeriod:[NSNumber numberWithShort:value_]];
}










@end
