//
//  TVSViewController.m
//  TableViewSample
//
//  Created by 武田 祐一 on 2013/04/22.
//  Copyright (c) 2013年 武田 祐一. All rights reserved.
//

#import "TVSViewController.h"

#import "TVSCustomCell.h"

@interface TVSViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray *texts;
@end

@implementation TVSViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    _tableView.dataSource = self;
    _tableView.delegate = self;
    [_tableView registerNib:[UINib nibWithNibName:@"TVSCustomCell" bundle:nil] forCellReuseIdentifier:@"maimai"];

    //TODO : samplData.plist から NSArray を作成しましょう [1]
    NSString* plistPath = [[NSBundle mainBundle] pathForResource:@"sampleData" ofType:@"plist"];
    _texts = [NSArray arrayWithContentsOfFile:plistPath];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //TODO : cellForCalcHeight の高さ計算メソッドを使って高さを計算しましょう
    return [TVSCustomCell calculateCellHeightWithText:(NSString *)_texts[indexPath.row]];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_texts count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *identifier = @"maimai";
    TVSCustomCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    cell.bodyLabel.text = _texts[indexPath.row];
    [cell.bodyLabel sizeToFit];
    return cell;
}

@end
