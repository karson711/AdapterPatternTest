//
//  ViewController.m
//  AdapterPatternTest
//
//  Created by kunge on 2018/7/2.
//  Copyright © 2018年 kunge. All rights reserved.
//

#import "ViewController.h"

#import "CollectionViewAdapterVC.h"
#import "TableViewAdapterVC.h"

@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"适配器模式";
}

- (IBAction)toTableView {
    [self.navigationController pushViewController:[TableViewAdapterVC new] animated:YES];
}

- (IBAction)toCollectionView {
    [self.navigationController pushViewController:[CollectionViewAdapterVC new] animated:YES];
}

@end
