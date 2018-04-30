#import <XCTest/XCTest.h>
#import "Product.h"
#import "Checkout.h"
#import "Offer.h"

@interface FruitTests : XCTestCase

@end

@implementation FruitTests

- (void)test_testApple {
    Product *product = [Product apple];
    
    XCTAssert([product.name isEqualToString: @"Apple"], @"Name \(product.name) is not 'Apple'");
    XCTAssertEqual(product.value, 60, @"Value \(product.value) is not 60");
}

- (void)test_testOrange {
    Product *product = [Product orange];
    
    XCTAssert([product.name isEqualToString: @"Orange"], @"Name \(product.name) is not 'Orange'");
    XCTAssertEqual(product.value, 25, @"Value \(product.value) is not 25");
}

- (void)test_createAndAppendFruits {
    Checkout *checkout = [[Checkout alloc] initWithProducts: @[]];
    
    for (NSUInteger i = 0; i<100; i++) {
        Product *product = [self randomProduct];
        [checkout addProduct: product];
    }
    
    XCTAssert([checkout.products count] == 100, "Not correct number of products in checkout");
}

- (void)test_initWithFruits {
    NSArray *products = [self hundredProducts];
    Checkout *checkout = [[Checkout alloc] initWithProducts: products];

    XCTAssert([checkout.products count] == 100, "Not correct number of products in checkout");
}

- (void)test_addListOfFruits {
    NSArray *products = [self hundredProducts];
    Checkout *checkout = [[Checkout alloc] initWithProducts: @[]];
    [checkout addList: products];
    
    XCTAssert([checkout.products count] == 100, "Not correct number of products in checkout");
}

- (void)test_totalForFruits {
    Checkout *checkout = [[Checkout alloc] initWithProducts: @[]];
    NSUInteger expected = 0;
    
    for (NSUInteger i = 0; i<100; i++) {
        Product *product = [self randomProduct];
        expected += product.value;
        [checkout addProduct: product];
    }
    
    NSUInteger total = [checkout total];
    
    XCTAssert(total == expected, "Total \(total), does not match expected: \(expected)");
}

- (void)test_bogof {
    NSArray *list = @[[Product apple], [Product apple], [Product apple]];
    NSUInteger expectedTotal = [Product apple].value * 2;
    
    NSUInteger total = [Offer bogof](list);
    XCTAssertEqual(total, expectedTotal, "Total \(total), does not match expected: \(expectedTotal)");
}

- (void)test_threeForTwo_twoOranges {
    NSArray *list = @[[Product orange], [Product orange]];
    NSUInteger expectedTotal = [Product orange].value * 2;
    
    NSUInteger total = [Offer threeForTwo](list);
    XCTAssertEqual(total, expectedTotal, "Total \(total), does not match expected: \(expectedTotal)");
}

- (void)test_threeForTwo_threeOranges {
    NSArray *list = @[[Product orange], [Product orange]];
    NSUInteger expectedTotal = [Product orange].value * 2;
    
    NSUInteger total = [Offer threeForTwo](list);
    XCTAssertEqual(total, expectedTotal, "Total \(total), does not match expected: \(expectedTotal)");
}

- (void)test_productsAndOffers {
    NSArray *list = @[[Product apple], [Product apple], [Product apple], [Product orange], [Product orange]];
    NSUInteger expectedTotal = ([Product apple].value * 2) + ([Product orange].value * 2);
    Checkout *checkout = [[Checkout alloc] initWithProducts: list];
    
    NSUInteger total = [checkout totalIncludingOffers];
    XCTAssertEqual(total, expectedTotal, "Total \(total), does not match expected: \(expectedTotal)");
}

- (void)test_productsAndOffersTwo {
    NSArray *list = @[[Product apple], [Product apple], [Product apple], [Product apple], [Product orange], [Product orange], [Product orange]];
    NSUInteger expectedTotal = ([Product apple].value * 2) + ([Product orange].value * 2);
    Checkout *checkout = [[Checkout alloc] initWithProducts: list];
    
    NSUInteger total = [checkout totalIncludingOffers];
    XCTAssertEqual(total, expectedTotal, "Total \(total), does not match expected: \(expectedTotal)");
}

#pragma mark - Helper Methods

- (NSArray *)hundredProducts {
    NSMutableArray *array = [NSMutableArray array];
    
    for (NSUInteger i = 0; i<100; i++) {
        Product *product = [self randomProduct];
        [array addObject: product];
    }
    
    return [array copy];
}

- (Product *)randomProduct {
    return arc4random_uniform(10) % 2 == 0 ? [Product apple] : [Product orange];
}

@end
