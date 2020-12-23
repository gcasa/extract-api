//
//  ParseFile.h
//  extract-api
//
//  Created by Gregory Casamento on 12/23/20.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ParseFile : NSObject
{
    NSString *fileContent;
    NSArray *lines;
}

- (instancetype) initWithFilename: (NSString *)fileName;

- (NSDictionary *) parseToDictionary;

@end

NS_ASSUME_NONNULL_END
