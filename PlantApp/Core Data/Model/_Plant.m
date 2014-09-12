// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Plant.m instead.

#import "_Plant.h"

const struct PlantAttributes PlantAttributes = {
	.dateCreated = @"dateCreated",
	.dateWaterRefreshed = @"dateWaterRefreshed",
	.image = @"image",
	.name = @"name",
	.uid = @"uid",
	.waterPeriod = @"waterPeriod",
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

	if ([key isEqualToString:@"waterPeriodValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"waterPeriod"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}

@dynamic dateCreated;

@dynamic dateWaterRefreshed;

@dynamic image;

@dynamic name;

@dynamic uid;

@dynamic waterPeriod;

- (int16_t)waterPeriodValue {
	NSNumber *result = [self waterPeriod];
	return [result shortValue];
}

- (void)setWaterPeriodValue:(int16_t)value_ {
	[self setWaterPeriod:@(value_)];
}

- (int16_t)primitiveWaterPeriodValue {
	NSNumber *result = [self primitiveWaterPeriod];
	return [result shortValue];
}

- (void)setPrimitiveWaterPeriodValue:(int16_t)value_ {
	[self setPrimitiveWaterPeriod:@(value_)];
}

@end

