//
//  Created by azu on 12/03/05.
//


#import <Foundation/Foundation.h>


@interface CountManager : NSObject

@property(nonatomic, readonly) NSInteger count;


- (void)countUp;

- (void)saveCount;


+ (CountManager *)sharedManager;


@end