//
//  SVSViewController.m
//  scrollViewSample
//
//  Created by 武田 祐一 on 2013/04/19.
//  Copyright (c) 2013年 武田 祐一. All rights reserved.
//

#import "SVSViewController.h"

@interface SVSViewController () <UIScrollViewDelegate>

@end

@implementation SVSViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"big_image.jpg"]];
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.view.frame];
    [scrollView addSubview:imageView];
    scrollView.contentSize = imageView.frame.size;
    scrollView.maximumZoomScale = 3.0;
    scrollView.minimumZoomScale = 0.5;
    scrollView.delegate = self;
    [self.view addSubview:scrollView];

    [self moveContent:scrollView toPoint:(CGPoint){480.0, 52.0}];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIView *) viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    UIView *view = [scrollView.subviews count] > 0 ? scrollView.subviews[0] : nil;
    return view && [view isKindOfClass:[UIImageView class]] ? view : nil;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    NSLog(@"x=%.2f, y=%.2f", scrollView.contentOffset.x, scrollView.contentOffset.y);
}

- (void) moveContent:(UIScrollView *)scrollView toPoint:(CGPoint)point {
    [UIView animateWithDuration:5.0f
                          delay:0.0f
                        options:UIViewAnimationOptionTransitionCurlUp
                     animations:^{
                         scrollView.contentOffset = point;
                     }
                     completion:nil];
}

- (BOOL)scrollViewShouldScrollToTop:(UIScrollView *)scrollView {
    return YES;
}

@end
