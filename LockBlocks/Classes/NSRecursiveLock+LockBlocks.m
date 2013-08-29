//
//  NSRecursiveLock+LockBlocks.m
//  DRReadWriteLock
//
//  Created by Nate Petersen on 8/29/13.
//  Copyright (c) 2013 Digital Rickshaw. All rights reserved.
//

#import "NSRecursiveLock+LockBlocks.h"

@implementation NSRecursiveLock (LockBlocks)

- (void)executeInLock:(void(^)())block {
	[self lock];
	block();
	[self unlock];
}

- (BOOL)tryToExecuteInLock:(void(^)())block {
	if ([self tryLock]) {
		block();
		[self unlock];
		return YES;
	} else {
		return NO;
	}
}

@end
