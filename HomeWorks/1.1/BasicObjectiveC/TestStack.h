//
//  TestStack.h
//  BasicObjectiveC
//
//  Created by 李 泳浴 on 2013/04/17.
//  Copyright (c) 2013年 武田 祐一. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TestStack : NSObject
{
    NSMutableArray *_container;
}

@property (nonatomic, strong) NSMutableArray *container;

- (id) init;

- (void) push:(id) object;
- (id) pop;
- (NSInteger) size;

@end
