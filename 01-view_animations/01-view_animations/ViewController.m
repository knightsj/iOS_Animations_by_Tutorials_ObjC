//
//  ViewController.m
//  01-view_animations
//
//  Created by Sun Shijie on 2017/6/21.
//  Copyright © 2017年 Shijie. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *heading;
@property (weak, nonatomic) IBOutlet UITextField *username;
@property (weak, nonatomic) IBOutlet UITextField *password;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;

@property (weak, nonatomic) IBOutlet UIImageView *cloud1;
@property (weak, nonatomic) IBOutlet UIImageView *cloud2;
@property (weak, nonatomic) IBOutlet UIImageView *cloud3;
@property (weak, nonatomic) IBOutlet UIImageView *cloud4;

@property (nonatomic, strong) UIActivityIndicatorView *spinner;

@end

@implementation ViewController

- (IBAction)login:(UIButton *)sender {
 
    [UIView animateWithDuration:1.5 delay:0.0 usingSpringWithDamping:0.2 initialSpringVelocity:0.0 options:NO animations:^{
        
        CGRect bounds = self.loginButton.bounds;
        bounds.size.width += 80;
        self.loginButton.bounds = bounds;
        
    } completion:nil];
    
    
    [UIView animateWithDuration:0.33 delay:0.0 usingSpringWithDamping:0.7 initialSpringVelocity:0.0 options:NO animations:^{
        
        CGPoint centerButton = self.loginButton.center;
        centerButton.y += 60;
        self.loginButton.center = centerButton;
        self.loginButton.backgroundColor = [UIColor colorWithRed:0.85 green:0.83 blue:0.45 alpha:1.0];
        
        CGPoint center = CGPointMake(40, self.loginButton.frame.size.height/2);
        self.spinner.center = center;
        self.spinner.alpha = 1.0;
        self.spinner.hidden = NO;
        
    } completion:nil];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.loginButton.layer.cornerRadius = 8.0;
    self.loginButton.layer.masksToBounds = YES;
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    CGPoint centerHeader = self.heading.center;
    centerHeader.x -= self.view.bounds.size.width;
    self.heading.center = centerHeader;
    
    CGPoint centerUserName = self.username.center;
    centerUserName.x -= self.view.bounds.size.width;
    self.username.center = centerUserName;
    
    CGPoint centerPassword = self.password.center;
    centerPassword.x -= self.view.bounds.size.width;
    self.password.center = centerPassword;
    
    self.cloud1.alpha = 0.0;
    self.cloud2.alpha = 0.0;
    self.cloud3.alpha = 0.0;
    self.cloud4.alpha = 0.0;
    
    
    CGPoint centerButton = self.loginButton.center;
    centerButton.y += 30;
    self.loginButton.center = centerButton;
    self.loginButton.alpha = 0.0;
    
    
    self.spinner = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    self.spinner.frame = CGRectMake(-20, 6, 20, 20);
    self.spinner.alpha = 0.0;
    [self.spinner startAnimating];
    [self.loginButton addSubview:self.spinner];
    
}


- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [UIView animateWithDuration:0.5 animations:^{
        CGPoint centerHeader = self.heading.center;
        centerHeader.x += self.view.bounds.size.width;
        self.heading.center = centerHeader;
    }];
    
    
    [UIView animateWithDuration:0.5 delay:0.3 usingSpringWithDamping:0.6 initialSpringVelocity:0.0 options:NO animations:^{
        CGPoint centerUserName = self.username.center;
        centerUserName.x += self.view.bounds.size.width;
        self.username.center = centerUserName;
        
    } completion:nil];
    
    [UIView animateWithDuration:0.5 delay:0.4 usingSpringWithDamping:0.6 initialSpringVelocity:0.0 options:NO animations:^{
        CGPoint centerPassword = self.password.center;
        centerPassword.x += self.view.bounds.size.width;
        self.password.center = centerPassword;
        
    } completion:nil];
    
    
    [UIView animateWithDuration:0.5 delay:0.5 options:0 animations:^{
        self.cloud1.alpha = 1.0;
    } completion:nil];
    
    [UIView animateWithDuration:0.5 delay:0.7 options:0 animations:^{
        self.cloud2.alpha = 1.0;
    } completion:nil];
    
    
    [UIView animateWithDuration:0.5 delay:1.0 options:0 animations:^{
        self.cloud3.alpha = 1.0;
    } completion:nil];
    
    
    [UIView animateWithDuration:0.5 delay:1.3 options:0 animations:^{
        self.cloud4.alpha = 1.0;
    } completion:nil];
    
    
    [UIView animateWithDuration:1.0 delay:0.5 usingSpringWithDamping:0.5 initialSpringVelocity:0.0 options:NO animations:^{
        CGPoint centerButton = self.loginButton.center;
        
        centerButton.y -= 30;
        self.loginButton.center = centerButton;
        self.loginButton.alpha = 1.0;
        
    } completion:nil];
}



@end
