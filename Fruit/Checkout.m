#import "Checkout.h"
#import "Product.h"
#import "Offer.h"

@implementation Checkout

- (instancetype)initWithProducts: (NSArray *)products
{
    self = [super init];
    
    if (self) {
        self.offers = @{@"Apple": [Offer bogof], @"Orange": [Offer threeForTwo]};
        self.products = [products mutableCopy];
    }
    
    return self;
}

- (void) addList: (NSArray *)list
{
    [self.products addObjectsFromArray: list];
}

- (void) addProduct: (Product *)product
{
    [self.products addObject: product];
}

- (NSUInteger) total
{
    return [self totalFromArray: self.products];
}

- (NSUInteger) totalIncludingOffers
{
    NSDictionary *grouped = [self groupFromArray: self.products];
    
    __block NSUInteger total = 0;
    
    [grouped enumerateKeysAndObjectsUsingBlock:^(NSString *key, NSArray *obj, BOOL *stop) {
        OfferType block = [self.offers objectForKey: key];
        
        if (block) {
            total += block(obj);
            
        } else {
            total += [self totalFromArray: obj];
        };
    }];
    
    return total;
}

#pragma mark - Helper Functions

- (NSDictionary *) groupFromArray: (NSArray *)array
{
    NSMutableDictionary *grouped = [NSMutableDictionary dictionary];
    
    for (Product *product in array) {
        if (![grouped objectForKey: product.name]) {
            grouped[product.name] = [NSMutableArray array];
        }
        
        [grouped[product.name] addObject:product];
    }
    
    return [grouped copy];
}

- (NSUInteger) totalFromArray: (NSArray *)array
{
    NSUInteger total = 0;
    
    for (Product *product in array) {
        total += product.value;
    }
    
    return total;
}

@end
