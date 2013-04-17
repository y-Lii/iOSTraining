//
//  EFMSecondViewController.h
//  EternalForceModal
//
//  Created by 武田 祐一 on 2013/04/16.
//  Copyright (c) 2013年 武田 祐一. All rights reserved.
//

#import <UIKit/UIKit.h>

// TODO
// delegateのためのプロトコルを定義
@protocol EFMSecondViewControllerDelegate <NSObject>

// ここにDelegateメソッドの定義
- (void) pressedCloseModalBtn;

@end


@interface EFMSecondViewController : UIViewController

@property (nonatomic, weak) id<EFMSecondViewControllerDelegate> delegate;

- (IBAction)closeButtonTapped:(id)sender;

@end
