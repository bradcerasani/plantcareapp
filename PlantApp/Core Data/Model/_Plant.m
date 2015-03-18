// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Plant.m instead.

#import "_Plant.h"

const struct PlantAttributes PlantAttributes = {
	.fertilizerInterval = @"fertilizerInterval",
	.lastUpdated = @"lastUpdated",
	.photoFilename = @"photoFilename",
	.plantId = @"plantId",
	.plantName = @"plantName",
	.waterInterval = @"waterInterval",
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

	if ([key isEqualToString:@"fertilizerIntervalValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"fertilizerInterval"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"plantIdValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"plantId"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"waterIntervalValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"waterInterval"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}

@dynamic fertilizerInterval;

- (int16_t)fertilizerIntervalValue {
	NSNumber *result = [self fertilizerInterval];
	return [result shortValue];
}

- (void)setFertilizerIntervalValue:(int16_t)value_ {
	[self setFertilizerInterval:[NSNumber numberWithShort:value_]];
}

- (int16_t)primitiveFertilizerIntervalValue {
	NSNumber *result = [self primitiveFertilizerInterval];
	return [result shortValue];
}

- (void)setPrimitiveFertilizerIntervalValue:(int16_t)value_ {
	[self setPrimitiveFertilizerInterval:[NSNumber numberWithShort:value_]];
}

@dynamic lastUpdated;

@dynamic photoFilename;

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

@dynamic plantName;

@dynamic waterInterval;

- (int16_t)waterIntervalValue {
	NSNumber *result = [self waterInterval];
	return [result shortValue];
}

- (void)setWaterIntervalValue:(int16_t)value_ {
	[self setWaterInterval:[NSNumber numberWithShort:value_]];
}

- (int16_t)primitiveWaterIntervalValue {
	NSNumber *result = [self primitiveWaterInterval];
	return [result shortValue];
}

- (void)setPrimitiveWaterIntervalValue:(int16_t)value_ {
	[self setPrimitiveWaterInterval:[NSNumber numberWithShort:value_]];
}

@end

