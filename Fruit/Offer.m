#import "Offer.h"
#import "Product.h"

@implementation Offer

+ (OfferType) bogof
{
    return ^NSUInteger(NSArray *list) {
        NSUInteger count = list.count;
        if (count == 0) { return 0; }
        
        Product *product = (Product *)list[0];
        if (!product) { return 0; }
        
        NSUInteger value = product.value;
        NSUInteger bogof = floor(count / 2);
        NSUInteger remainder = count % 2;
        
        return (bogof + remainder) * value;
    };
}

+ (OfferType) threeForTwo
{
    return ^NSUInteger(NSArray *list) {
        NSUInteger count = list.count;
        if (count == 0) { return 0; }
        
        Product *product = (Product *)list[0];
        if (!product) { return 0; }
        
        NSUInteger value = product.value;
        NSUInteger threes = floor(count / 3);
        NSUInteger remainder = count % 3;
        
        return (threes * value * 2) + (remainder * value);
    };
}

@end
