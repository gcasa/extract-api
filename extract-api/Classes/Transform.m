//
//  Transform.m
//  extract-api
//
//  Created by Gregory Casamento on 12/23/20.
//

#import "Transform.h"
#import "NSArray+StringFunctions.h"

@implementation Transform

- (instancetype) initWithDictionary: (NSDictionary *)dict
{
    self = [super init];
    if (self != nil)
    {
        dictionary = dict;
    }
    return self;
}

- (NSString *) transformToMarkdown
{
    NSString *output = @"";
    NSArray *keys = [dictionary allKeys];
    for (NSString *k in keys)
    {
        output = [output stringByAppendingString: [NSString stringWithFormat:@"\n\n%@\n--\n", k]];
        output = [output stringByAppendingString: @"| action | method | parameters\n"];
        output = [output stringByAppendingString: @"|:-------|:------:|:----------\n"];
        NSDictionary *apiDict = [dictionary objectForKey: k];
        NSArray *akeys = [apiDict allKeys];
        for (NSString *akey in akeys)
        {
            NSArray *parms = [apiDict objectForKey: akey];
            NSString *parmString = [parms stringWithSeparatedBy: @","];
            output = [output stringByAppendingFormat: @"| %@ | POST | %@\n", akey,
                      [parmString stringByReplacingOccurrencesOfString:@"_" withString:@"\\_"]];
            
        }
    }
    return output;
}

@end
