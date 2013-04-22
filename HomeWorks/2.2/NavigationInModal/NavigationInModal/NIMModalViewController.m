//
//  NIMModalViewController.m
//  NavigationInModal
//
//  Created by 武田 祐一 on 2013/04/17.
//  Copyright (c) 2013年 武田 祐一. All rights reserved.
//

#import "NIMModalViewController.h"

@interface NIMModalViewController ()

@end

@implementation NIMModalViewController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

    // TODO ここに navigation bar の右上をpushするボタンを配置するコードを書く
    self.title = [NSString stringWithFormat:@"%d", self.navigationController.viewControllers.count];
    UIBarButtonItem *rightBtn = [[UIBarButtonItem alloc] initWithTitle:@"push"
                                                                 style:UIBarButtonItemStylePlain
                                                                target:self
                                                                action:@selector(pressPushBtn)];
    self.navigationItem.rightBarButtonItem = rightBtn;
    
    // TODO さらに、一番先頭に戻るボタンを左に配置する
    UIBarButtonItem *leftBtn = [[UIBarButtonItem alloc] initWithTitle:@"root"
                                                                style:UIBarButtonItemStylePlain
                                                               target:self
                                                               action:@selector(pressRootBtn)];
    self.navigationItem.leftBarButtonItem = leftBtn;
    self.navigationItem.leftItemsSupplementBackButton = YES;
}

- (void) pressPushBtn {
    NIMModalViewController *viewController = [[NIMModalViewController alloc] init];
    [self.navigationController pushViewController:viewController animated:YES];
}

- (void) pressRootBtn {
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
