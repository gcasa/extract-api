//
//  Transform.h
//  extract-api
//
//  Created by Gregory Casamento on 12/23/20.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Transform : NSObject

- (instancetype) initWithDictionary: (NSDictionary *)dict;
- (NSString *) transformToMarkdown;

@end

NS_ASSUME_NONNULL_END
