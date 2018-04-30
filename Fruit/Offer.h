#import <Foundation/Foundation.h>

typedef NSUInteger (^OfferType)(NSArray *list);

@interface Offer : NSObject

+ (OfferType) bogof;
+ (OfferType) threeForTwo;

@end
