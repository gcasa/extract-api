//
//  main.m
//  extract-api
//
//  Created by Gregory Casamento on 12/23/20.
//

#import <Foundation/Foundation.h>
#import "ParseFile.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSString *dirname = @"/Users/heron/Development/fixx/Application/prebuilts/requests";
        NSFileManager *fm = [NSFileManager defaultManager];
        NSError *e = nil;
        NSArray *array = [fm contentsOfDirectoryAtPath: dirname
                                                 error: &e];
        
        if (e != nil)
        {
            NSLog(@"Error = %@",e.localizedDescription);
        }
        
        for(NSString *file in array)
        {
            NSString *fileName = [dirname stringByAppendingPathComponent:file];
            ParseFile *parse = [[ParseFile alloc] initWithFilename: fileName];
            NSDictionary *dict = [parse parseToDictionary];
            NSLog(@"dict = %@", dict);
        }
    }
    return 0;
}
