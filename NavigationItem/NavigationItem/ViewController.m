//
//  ViewController.m
//  NavigationItem
//
//  Created by yaoxiaobing on 16/3/1.
//  Copyright © 2016年 yaoxiaobing. All rights reserved.
//

#define KScreenSize     [UIScreen mainScreen].bounds.size


#import "ViewController.h"
#import "CustomTitleView.h"
#import "Masonry.h"

@interface ViewController ()

@property (nonatomic, strong) CustomTitleView *titleView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CustomTitleView *titleView = [[CustomTitleView alloc] init];
    titleView.title = @"聊天测试测试群12345678910111213";
    titleView.count = 15;
    titleView.iconHidden = NO;
    titleView.backgroundColor = [UIColor greenColor];
    titleView.frame = CGRectMake(0, 0, KScreenSize.width, 44);
    self.navigationItem.titleView = titleView;
    self.titleView = titleView;
}



#pragma mark - Actions
- (IBAction)titleOnly:(id)sender {
    
    self.titleView.iconHidden = YES;
    self.titleView.count = 0;
    
}

- (IBAction)titleAndCount:(id)sender {
    self.titleView.iconHidden = YES;
    self.titleView.count = 15;
}

- (IBAction)titleAndIcon:(id)sender {
    
    self.titleView.iconHidden = NO;
    self.titleView.count = 0;
}

- (IBAction)titleAndCountAndIcon:(id)sender {
    
    self.titleView.iconHidden = NO;
    self.titleView.count = 15;
}


- (void)backAction:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}


- (void)rightAction:(id)sender{}

- (IBAction)showRightBar:(id)sender {
    
    
    if (self.navigationBarButtonType == 0) {
        //system
        UIImage *image = [UIImage imageNamed:@"group_icon"];
        UIBarButtonItem *item = self.navigationItem.rightBarButtonItem;
        [item setImage:image];
        item.enabled = YES;
    } else {
        //custom
        UIView *view = self.navigationItem.rightBarButtonItem.customView;
        view.hidden = NO;
    }
}
- (IBAction)hideRightBar:(id)sender {
    
    if (self.navigationBarButtonType == 0) {
        //system
        UIImage *image = [self imageWithSize:CGSizeMake(22, 22) color:[UIColor clearColor]];
        UIBarButtonItem *item = self.navigationItem.rightBarButtonItem;
        [item setImage:image];
        item.enabled = NO;
    } else {
        //custom
        UIView *view = self.navigationItem.rightBarButtonItem.customView;
        view.hidden = YES;
    }
    
}

- (IBAction)removeLeft:(id)sender {
    
    self.navigationItem.leftBarButtonItem = nil;
    //此时失去自定义的返回按钮，会暴露系统的返回按钮出来
}

- (IBAction)removeRight:(id)sender {

    self.navigationItem.rightBarButtonItem = nil;
}

- (IBAction)addLeft:(id)sender {
    
    if (self.navigationBarButtonType == 0) {
        [self addLeftItemWithSystemType];
    } else {
        [self addLeftItemWithCustomType];
    }
    
}

- (IBAction)addRight:(id)sender {
    
    if (self.navigationBarButtonType == 0) {
        [self addRightItemWithSystemType];
    } else {
        [self addRightItemWithCustomType];
    }
}

- (IBAction)longTitle:(id)sender {
    
    self.titleView.title = @"A long long title for testing,tail will be truncated";
    
    
}
- (IBAction)shortTitle:(id)sender {
    
    self.titleView.title = @"A short title";
}

#pragma mark - create image with size and color
- (UIImage *)imageWithSize:(CGSize)size color:(UIColor *)color
{
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context =UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, rect);
    UIImage *myImage =UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return myImage;

}


- (void)setNavigationBarButtonType:(NSInteger)navigationBarButtonType
{
    _navigationBarButtonType = navigationBarButtonType;
    
    if (navigationBarButtonType == 0) {
        
        [self createNaviagtionBarButtonItemWithSystemType];
        
    } else {
    
        [self createNaviagtionBarButtonItemWithCustomType];
    }

}
#pragma mark - customType
- (void)createNaviagtionBarButtonItemWithCustomType

{
    [self addLeftItemWithCustomType];
    [self addRightItemWithCustomType];
}

//-------------------------------custom left barButtonItem---------------
- (void)addLeftItemWithCustomType
{
    UIButton *leftButton = [UIButton new];
    [leftButton setFrame:CGRectMake(0, 0, 59, 30)];
    [leftButton setImage:[UIImage imageNamed:@"icon_back"] forState:UIControlStateNormal];
    leftButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    leftButton.backgroundColor = [UIColor brownColor];
    [leftButton addTarget:self action:@selector(backAction:)
         forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftBarButtonItem = [[UIBarButtonItem alloc]
                                          initWithCustomView:leftButton];
    self.navigationItem.leftBarButtonItem = leftBarButtonItem;
}

//-------------------------------custom right barButtonItem---------------
-(void)addRightItemWithCustomType
{
    UIButton *rightButton = [[UIButton alloc] init];
    [rightButton setFrame:CGRectMake(0, 0, 59, 30)];
    [rightButton setImage:[UIImage imageNamed:@"group_icon"] forState:UIControlStateNormal];
    rightButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    rightButton.backgroundColor = [UIColor brownColor];
    [rightButton addTarget:self action:@selector(rightAction:)
          forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightBarButtonItem = [[UIBarButtonItem alloc]
                                           initWithCustomView:rightButton];
    self.navigationItem.rightBarButtonItem = rightBarButtonItem;
}


#pragma mark - systemType
- (void)createNaviagtionBarButtonItemWithSystemType
{
    
    [self addLeftItemWithSystemType];
    [self addRightItemWithSystemType];
}

//-------------------------------system left barButtonItem---------------

- (void)addLeftItemWithSystemType
{
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"icon_back"]
                                                                             style:UIBarButtonItemStylePlain
                                                                            target:self
                                                                            action:@selector(backAction:)];
}

//-------------------------------system right barButtonItem---------------
- (void)addRightItemWithSystemType
{
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"group_icon"]
                                                                              style:UIBarButtonItemStylePlain
                                                                             target:self
                                                                             action:@selector(rightAction:)];

}


@end
