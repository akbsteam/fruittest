#import "Product.h"

@implementation Product

@synthesize name;
@synthesize value;

+ (instancetype) apple
{
    Product *product = [[Product alloc] init];
    product.name = @"Apple";
    product.value = 60;
    return product;
}

+ (instancetype) orange;
{
    Product *product = [[Product alloc] init];
    product.name = @"Orange";
    product.value = 25;
    return product;
}

@end
