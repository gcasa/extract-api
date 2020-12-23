//
//  NSString+Replacing.h
//  extract-api
//
//  Created by Gregory Casamento on 12/23/20.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (Replacing)

- (NSString *) stringByReplacingCharactersInSet: (NSCharacterSet *)charSet withString: (NSString *)aString;
- (NSString *) cleanLine;

@end

NS_ASSUME_NONNULL_END
