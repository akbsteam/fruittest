#import <Foundation/Foundation.h>

@class Product;

@interface Checkout : NSObject

@property (strong) NSMutableArray *products;

- (instancetype)initWithProducts: (NSArray *)products;

- (void) addList: (NSArray *)list;
- (void) addProduct: (Product *)product;

@end
