//
//  TableViewController.m
//  NavigationItem
//
//  Created by yaoxiaobing on 16/3/2.
//  Copyright © 2016年 yaoxiaobing. All rights reserved.
//

#import "TableViewController.h"
#import "ViewController.h"

@interface TableViewController ()

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 
    ViewController *vc = segue.destinationViewController;
    
    NSString *identifier = segue.identifier;
    if ([identifier isEqualToString:@"custom"]) {
        vc.navigationBarButtonType = 1;
    } else {
        vc.navigationBarButtonType = 0;
    }    
}


@end
