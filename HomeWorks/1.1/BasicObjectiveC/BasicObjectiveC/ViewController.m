//
//  ViewController.m
//  BasicObjectiveC
//
//  Created by 武田 祐一 on 2013/04/16.
//  Copyright (c) 2013年 武田 祐一. All rights reserved.
//

#import "ViewController.h"
#import "TestQueue.h"
#import "TestStack.h"

@interface ViewController ()

@end

@implementation ViewController

NSArray* getSampleArray() {
    NSDictionary *dic1 = @{@"domain":@"mixi.jp",
                           @"entry" :@[@"list_voice.pl", @"list_diary.pl", @"list_mymall_item.pl"]};
    NSDictionary *dic21 = @{@"path" :@"add_diary.pl",
                            @"query":@[@{@"tag_id":@7}]};
    NSDictionary *dic2 = @{@"domain":@"mmall.jp",
                           @"entry" :@[dic21]};
    NSDictionary *dic3 = @{@"domain":@"itunes.apple.com"};

    return @[dic1, dic2, dic3];
}

NSMutableArray* getSampleMutableArray() {
    NSMutableArray *mArr1 = [NSMutableArray array];
    NSMutableDictionary *mDic1 = [[NSMutableDictionary alloc] init];
    mDic1[@"domain"] = @"mixi.jp";
    mDic1[@"entry"]  = @[ @"list_voice.pl", @"list_diary.pl", @"list_mymall_item.pl" ];

    NSMutableDictionary *mDic21 = [[NSMutableDictionary alloc] init];
    mDic21[@"path"]  = @"add_diary.pl";
    mDic21[@"query"] = @[ @{ @"tag_id": @7 } ];

    NSMutableDictionary *mDic2 = [[NSMutableDictionary alloc] init];
    mDic2[@"domain"] = @"mmall.jp";
    mDic2[@"entry"]  = @[ mDic21 ];

    NSMutableDictionary *mDic3 = [[NSMutableDictionary alloc] init];
    mDic3[@"domain"] = @"itunes.apple.com";

    [mArr1 addObject:mDic1];
    [mArr1 addObject:mDic2];
    [mArr1 addObject:mDic3];

    return mArr1;
}

void testTestQueue() {
    TestQueue *queue = [[TestQueue alloc ]init];

    [queue push:@1];
    [queue push:@"2"];
    [queue push:@[ @1, @2, @"3" ]];

    NSLog(@"queue: %@, size: %d", queue, [queue size]);

    NSLog(@"pop: %@, size: %d", [queue pop], [queue size]);
    NSLog(@"pop: %@, size: %d", [queue pop], [queue size]);
    NSLog(@"pop: %@, size: %d", [queue pop], [queue size]);
    NSLog(@"pop: %@, size: %d", [queue pop], [queue size]);
}

void testTestStack() {
    TestStack *stack = [[TestStack alloc ]init];

    [stack push:@1];
    [stack push:@"2"];
    [stack push:@[ @1, @2, @"3" ]];

    NSLog(@"stack: %@, size: %d", stack, [stack size]);

    NSLog(@"pop: %@, size: %d", [stack pop], [stack size]);
    NSLog(@"pop: %@, size: %d", [stack pop], [stack size]);
    NSLog(@"pop: %@, size: %d", [stack pop], [stack size]);
    NSLog(@"pop: %@, size: %d", [stack pop], [stack size]);
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // TODO ここに課題を書き進めていってください

    NSArray *arr = getSampleArray();
    NSMutableArray *mArr = getSampleMutableArray();

    NSLog(@"\n%@\n%@", arr, mArr);

    NSLog(@"test TestQueue");
    testTestQueue();

    NSLog(@"test TestStack");
    testTestStack();
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
