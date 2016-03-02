

//
//  CustomTitleView.m
//  NavigationItem
//
//  Created by yaoxiaobing on 16/3/1.
//  Copyright © 2016年 yaoxiaobing. All rights reserved.
//

#import "CustomTitleView.h"
#import "Masonry.h"



@interface CustomTitleView ()
@property(nonatomic,strong)UILabel * titleLabel;//标题label
@property(nonatomic,strong)UILabel * countLbbel;//数字label
@property(nonatomic,strong)UIImageView * notDisturbIcon;
@property (nonatomic,strong) UIView *contentView;


@end

@implementation CustomTitleView

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        
        [self addSubview:self.contentView];
        [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.greaterThanOrEqualTo(self);
            make.right.lessThanOrEqualTo(self);
            make.center.equalTo(self);
            make.bottom.top.equalTo(self);
        }];
        
        
        [self.contentView addSubview:self.titleLabel];
        [self.contentView addSubview:self.countLbbel];
        [self.contentView addSubview:self.notDisturbIcon];

        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView);
            make.centerY.equalTo(self.contentView);
        }];
        
        [self.countLbbel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.titleLabel.mas_right);
            make.centerY.equalTo(self.contentView);
        }];
        
        [self.notDisturbIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.contentView);
            make.left.equalTo(self.countLbbel.mas_right).offset(6);
            make.size.mas_equalTo(CGSizeMake(12,14));
            make.centerY.equalTo(self);
        }];
    }
    return self;
}

- (void)setFrame:(CGRect)frame
{
    [super setFrame:frame];
    [self layoutIfNeeded];
}

- (UIView *)contentView
{
    if (!_contentView) {
        _contentView = [UIView new];
    }
    return _contentView;
}


-(UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textColor = [UIColor whiteColor];
        _titleLabel.font = [UIFont boldSystemFontOfSize:17];
        _titleLabel.lineBreakMode = NSLineBreakByTruncatingTail;
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        [_titleLabel setContentCompressionResistancePriority:UILayoutPriorityDefaultLow forAxis:UILayoutConstraintAxisHorizontal];
        _titleLabel.backgroundColor = [UIColor redColor];
    }
    return _titleLabel;
}

-(UILabel *)countLbbel
{
    if (!_countLbbel) {
        _countLbbel = [[UILabel alloc] init];
        _countLbbel.font = [UIFont boldSystemFontOfSize:17];
        _countLbbel.textColor = [UIColor whiteColor];
        _countLbbel.backgroundColor = [UIColor grayColor];
    }
    return _countLbbel;
}

-(UIImageView *)notDisturbIcon
{
    if (!_notDisturbIcon) {
        _notDisturbIcon = [[UIImageView alloc] init];
        _notDisturbIcon.backgroundColor = [UIColor cyanColor];
    }
    return _notDisturbIcon;
}

- (void)setTitle:(NSString *)title
{
    self.titleLabel.text = title;
}


-(void)setCount:(NSInteger)count
{
    NSString * countString = nil;
    if (count) {
        countString = [NSString stringWithFormat:@"(%i)",(int)count];
    }
    self.countLbbel.text = countString;
}

- (void)setIconHidden:(BOOL)iconHidden
{
    _iconHidden = iconHidden;
    if (iconHidden) {
        self.notDisturbIcon.image = nil;
        [self.notDisturbIcon mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.countLbbel.mas_right);
            make.size.mas_equalTo(CGSizeMake(0, 0));
        }];
    }else{
        self.notDisturbIcon.image = [UIImage imageNamed:@"chat_not_disturb"];
        [self.notDisturbIcon mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.countLbbel.mas_right).offset(6);
            make.size.mas_equalTo(CGSizeMake(12, 14));
        }];
    }
    
//    [self layoutIfNeeded];
    
}



@end
