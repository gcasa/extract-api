//
//  NSArray+StringFunctions.h
//  extract-api
//
//  Created by Gregory Casamento on 12/23/20.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSArray (StringFunctions)

- (NSString *) stringWithSeparatedBy: (NSString *)separator;

@end

NS_ASSUME_NONNULL_END
