//
//  TestStack.m
//  BasicObjectiveC
//
//  Created by 李 泳浴 on 2013/04/17.
//  Copyright (c) 2013年 武田 祐一. All rights reserved.
//

#import "TestStack.h"

@implementation TestStack

- (id) init {
    if(self = [super init]) {
        _container = [NSMutableArray array];
    }

    return self;
}

- (void) push:(id)object {
    [_container addObject:object];
}

- (id) pop {
    if(![self size]) {
        NSLog(@"No more element");
        return nil;
    }

    id lastObj = [_container lastObject];
    [_container removeLastObject];
    return lastObj;
}

- (NSInteger) size {
    return [_container count];
}

- (NSString *) description {
    return [_container description];
}

@end
