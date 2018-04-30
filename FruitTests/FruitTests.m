#import <XCTest/XCTest.h>
#import "Product.h"

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

@end
