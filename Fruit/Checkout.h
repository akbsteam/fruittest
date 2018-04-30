#import <Foundation/Foundation.h>

@class Product;

@interface Checkout : NSObject

@property (strong) NSMutableArray *products;
@property (strong) NSDictionary *offers;

- (instancetype)initWithProducts: (NSArray *)products;

- (void) addList: (NSArray *)list;
- (void) addProduct: (Product *)product;
- (NSUInteger) total;
- (NSUInteger) totalIncludingOffers;

@end
