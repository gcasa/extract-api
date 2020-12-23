//
//  main.m
//  extract-api
//
//  Created by Gregory Casamento on 12/23/20.
//

#import <Foundation/Foundation.h>
#import "ParseFile.h"
#import "Transform.h"

int main(int argc, const char * argv[])
{
    @autoreleasepool
    {
        NSMutableDictionary *d = [NSMutableDictionary dictionaryWithCapacity: 10];
        NSString *dirname = @"/Users/heron/Development/fixx/Application/prebuilts/requests";
        NSFileManager *fm = [NSFileManager defaultManager];
        NSError *e = nil;
        NSArray *array = [fm contentsOfDirectoryAtPath: dirname
                                                 error: &e];
        
        // Check error...
        if (e != nil)
        {
            NSLog(@"Error = %@",e.localizedDescription);
        }

        // Iterate through files...
        for(NSString *file in array)
        {
            NSString *fileName = [dirname stringByAppendingPathComponent:file];
            ParseFile *parse = [[ParseFile alloc] initWithFilename: fileName];
            NSDictionary *dict = [parse parseToDictionary];
            // NSLog(@"dict = %@", dict);
            [d setObject: dict forKey: file];
        }
        
        Transform *t = [[Transform alloc] initWithDictionary: d];
        NSString *output = [t transformToMarkdown];
        puts([[NSString stringWithFormat: @"%@",output] cStringUsingEncoding:NSUTF8StringEncoding]);
    }

    return 0;
}
