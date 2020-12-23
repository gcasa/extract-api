//
//  NSArray+StringFunctions.m
//  extract-api
//
//  Created by Gregory Casamento on 12/23/20.
//

#import "NSArray+StringFunctions.h"

@implementation NSArray (StringFunctions)

- (NSString *) stringWithSeparatedBy: (NSString *)separator
{
    if ([self count] == 0)
    {
        return @"";
    }
    
    NSString *result = @"";
    for (NSString *s in self)
    {
        result = [result stringByAppendingString: s];
        if ([[self lastObject] isEqualToString: s] == NO)
        {
            result = [result stringByAppendingString:@", "];
        }
    }
    
    return result;
}

@end
