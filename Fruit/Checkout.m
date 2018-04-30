#import "Checkout.h"
#import "Product.h"

@implementation Checkout

- (instancetype)initWithProducts: (NSArray *)products
{
    self = [super init];
    
    if (self) {
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

@end