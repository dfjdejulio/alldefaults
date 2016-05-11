//
//  main.m
//  alldefaults
//
//  Created by Doug DeJulio on 2016-05-11.
//  Copyright © 2016 Doug DeJulio. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        NSUserDefaults *shared = nil;
        if (argc > 1) {
            shared = [[NSUserDefaults alloc] initWithSuiteName:@(argv[1])];
        }
        NSDictionary *some = [defaults dictionaryRepresentation];
        NSMutableDictionary *all = [[NSMutableDictionary alloc] initWithDictionary: some];
        if (shared) {
            NSDictionary *more = [shared dictionaryRepresentation];
            [all addEntriesFromDictionary: more];
        }
        NSString *output = [NSString stringWithFormat:@"All defaults:\n\n%@\n", all];
        puts([output UTF8String]);
    }
    return 0;
}
