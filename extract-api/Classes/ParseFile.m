//
//  ParseFile.m
//  extract-api
//
//  Created by Gregory Casamento on 12/23/20.
//

#import "ParseFile.h"
#import "NSString+Replacing.h"

@implementation ParseFile

- (instancetype) initWithFilename: (NSString *)fileName
{
    self = [super init];
    if (self != nil)
    {
        fileContent = [NSString stringWithContentsOfFile: fileName
                                                encoding: NSUTF8StringEncoding
                                                   error: NULL];
        lines = [fileContent componentsSeparatedByString:@"\n"];
    }
    return self;
}

- (NSDictionary *) parseToDictionary
{
    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithCapacity:10];
    NSString *apiName = nil;

    for (NSString *line in lines)
    {
        if ([line containsString:@"switch"])
            continue;
        
        if ([line containsString:@"case"])
        {
            NSString *cleanedLine = [line cleanLine];
            apiName = [cleanedLine copy];
            if ([dict objectForKey: apiName] == nil)
            {
                [dict setObject: [NSMutableArray array] forKey: apiName];
            }
        }
        else if ([line containsString:@"$_POST"])
        {
            NSString *parmName = nil;
            NSScanner *sc = [NSScanner scannerWithString: line];
            
            [sc scanUpToString:@"$_POST[" intoString:NULL];
            [sc scanString:@"$_POST[" intoString: NULL];
            [sc scanUpToString: @"]" intoString: &parmName];

            NSString *cleanedLine = [parmName cleanLine];
            NSMutableArray *array = [dict objectForKey:apiName];
            [array addObject: cleanedLine];
        }
    }

    return dict;
}

@end
