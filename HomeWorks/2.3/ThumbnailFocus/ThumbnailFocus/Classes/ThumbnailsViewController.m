//
//  ThumbnailsViewController.m
//  ThumbnailFocus
//
//  Created by 鄭 基旭 on 2013/04/18.
//  Copyright (c) 2013年 鄭 基旭. All rights reserved.
//

#import "ThumbnailsViewController.h"

@interface ThumbnailsViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) FocusManager *focusManager;
@end

@implementation ThumbnailsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.focusManager = [[FocusManager alloc] init];
    self.focusManager.delegate = self;

    if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        for (UIImageView *img in _images) {
            [self.focusManager installOnView:img];
        }
        [self performSelector:@selector(sizeToFitOfImages)
                   withObject:nil
                   afterDelay:0.05f];
        [self sizeToFitOfImages];
    }
}

- (NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskAll;
}

- (void) didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation {
    if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        [self sizeToFitOfImages];
    }
}

- (void) sizeToFitOfImages {
    NSLog(@"fiting");
    float y = 0;
    float x = 10;
    for (UIImageView *img in _images) {
        [img sizeToFit];
        CGRect frame = img.frame;
        if(y + frame.size.height > self.view.frame.size.height) {
            y = 0;
            x += frame.size.width + 10;
        }
        frame.origin.y = y;
        frame.origin.x = x;
        img.frame = frame;

        y += frame.size.height + 10;
    }
}

#pragma mark - FocusDelegate
- (UIViewController *)parentViewControllerForFocusManager
{
    return self.parentViewController;
}

#pragma mark - UITableViewDataSource
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        [self.focusManager installOnView:cell.imageView];
    }
    UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"%d.jpg", indexPath.row + 1]];
    cell.imageView.image = image;
    cell.imageView.tag = indexPath.row + 1;

    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}
@end
