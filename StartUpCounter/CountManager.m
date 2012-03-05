//
//  Created by azu on 12/03/05.
//


#import "CountManager.h"


@implementation CountManager {
    NSInteger count_;
}

@synthesize count = count_;


- (void)countUp {
    count_ += 1;
}

- (NSInteger)loadCount {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults registerDefaults:[NSDictionary
                                   dictionaryWithObject:[NSNumber numberWithInteger:0] forKey:@"StartUpCount"]];
    return [defaults integerForKey:@"StartUpCount"];
}

- (void)saveCount {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:count_ forKey:@"StartUpCount"];
    [defaults synchronize];
}

- (id)init {
    self = [super init];
    if (self){
        count_ = [self loadCount];
    }

    return self;
}

#pragma mark - Singleton methods

static CountManager *sharedManager_ = nil;

+ (CountManager *)sharedManager {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedManager_ = [[self alloc] init];
    });
    return sharedManager_;
}

- (id)copyWithZone:(NSZone *)zone {
    return self;
}

- (id)retain {
    return self;
}

- (unsigned)retainCount {
    return UINT_MAX;
}

- (oneway void)release {
    // don't release
}

- (id)autorelease {
    return self;
}
@end