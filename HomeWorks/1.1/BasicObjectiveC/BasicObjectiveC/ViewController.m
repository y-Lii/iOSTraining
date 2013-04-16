//
//  ViewController.m
//  BasicObjectiveC
//
//  Created by 武田 祐一 on 2013/04/16.
//  Copyright (c) 2013年 武田 祐一. All rights reserved.
//

#import "ViewController.h"

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
    NSMutableArray *mArr1 = [[NSMutableArray alloc] init];
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

- (void)viewDidLoad
{
    [super viewDidLoad];

    // TODO ここに課題を書き進めていってください

    NSArray *arr = getSampleArray();
    NSMutableArray *mArr = getSampleMutableArray();

    NSLog(@"\n%@\n%@", arr, mArr);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
