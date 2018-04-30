#import <Foundation/Foundation.h>

@interface Product : NSObject

@property (strong) NSString *name;
@property NSUInteger value;

+ (instancetype) apple;
+ (instancetype) orange;

@end
