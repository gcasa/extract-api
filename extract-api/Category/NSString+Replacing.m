//
//  NSString+Replacing.m
//  extract-api
//
//  Created by Gregory Casamento on 12/23/20.
//

#import "NSString+Replacing.h"

@implementation NSString(Replacing)

- (NSString *) stringByReplacingCharactersInSet: (NSCharacterSet *)charSet withString: (NSString *)aString
{
    NSMutableString *s = [NSMutableString stringWithCapacity:self.length];
    for (NSUInteger i = 0; i < self.length; ++i)
    {
        unichar c = [self characterAtIndex:i];
        if (![charSet characterIsMember:c])
        {
            [s appendFormat:@"%C", c];
        } else
        {
            [s appendString:aString];
        }
    }
    return s;
}

- (NSString *) cleanLine
{
    NSString *cleanedLine = [self stringByReplacingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]
                                                        withString:@""];
    
    cleanedLine = [cleanedLine stringByReplacingOccurrencesOfString:@"case"
                                                         withString:@""];
    cleanedLine = [cleanedLine stringByReplacingOccurrencesOfString:@"'"
                                                         withString:@""];
    cleanedLine = [cleanedLine stringByReplacingOccurrencesOfString:@":"
                                                         withString:@""];
    return cleanedLine;
}

@end
