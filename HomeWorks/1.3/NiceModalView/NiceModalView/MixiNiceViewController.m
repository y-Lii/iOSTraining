//
//  MixiNiceViewController.m
//  NiceModalView
//
//  Created by 鄭 基旭 on 2013/04/15.
//  Copyright (c) 2013年 鄭 基旭. All rights reserved.
//

#import "MixiNiceViewController.h"
#import "UIViewController+NiceAnimation.h"

@interface MixiNiceViewController()

@end

@implementation MixiNiceViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    NSInteger allImageCount = 5;
// なぜ NSArrayじゃなくて　NSMutableArray か？　違いを探してみましょう
    NSMutableArray *sampleImages = [NSMutableArray array];
    for (int currentIndex = 0; currentIndex < allImageCount; currentIndex++)
    {
        NSString *filename = [NSString stringWithFormat:@"%d.jpg", currentIndex];
        UIImage *img = [UIImage imageNamed:filename];
        [sampleImages addObject:img];
    }

    if(self.navigationController) {
        self.navigationItem.title = [NSString stringWithFormat:@"View %d", [self.navigationController.viewControllers count]];
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Close"
                                                                              style:UIBarButtonItemStylePlain
                                                                             target:self
                                                                             action:@selector(clickClose:)];

    }
    
	static int index;
	index++;

    UIImageView *imageView = [[UIImageView alloc] initWithImage:[sampleImages objectAtIndex:index%allImageCount]];
    // insertSubview と addSubViewの違いを探してみましょう
    // 理解
    // [self.view addSubview:imageView]
    //  ==
    // [self.view insertSubview:imageView atIndex:[self.view.subviews count]];
	[self.view insertSubview:imageView atIndex:0];

// TODO: XIB上にある二つの各ボタンのTouchUpInsideイベントに　clickModalView：　と　clickPush:　を連結しましょう
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)viewWillAppear:(BOOL)animated
{
    NSLog(@"viewWillAppear");
	[super viewWillAppear:animated];
// TODO : UIViewController+NiceAnimation にある関数を使って、いい感じの遷移になるようにしましょう
    if(self.navigationController) {
        [self animationPushBackScaleDown];
    }
}

- (void) viewWillDisappear:(BOOL)animated {
    NSLog(@"viewWillDisAppear");
    //効果見えない
    [self animationPopFront];
    [super viewWillDisappear:animated];
}

- (IBAction)clickPush:(id)sender
{
	MixiNiceViewController *viewController = [[MixiNiceViewController alloc] init];

// TODO :　hint-> pushViewController: animation:
    [self.navigationController pushViewController:viewController animated:YES];
}

- (IBAction)clickModalView:(id)sender
{
	MixiNiceViewController *viewController = [[MixiNiceViewController alloc] init];

    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:viewController];
    //UINavigationController *navController = [[UINavigationController alloc] initWithNibName:@"MixiNiceViewController" bundle:nil];
    //[navController pushViewController:viewController animated:YES];

// TODO :　hint-> presentViewController: animation:
    [self presentViewController:navController animated:YES completion:nil];


// TODO : UIViewController+NiceAnimation にある関数を使って、いい感じの遷移になるようにしましょう
    //viewWillAppearの中でanimationがあるから、ここのanimationが不要
    //[viewController animationPushBackScaleDown];
}

- (void)clickClose:(id)sender
{
// TODO : hint-> dismissViewControllerAnimated:
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
