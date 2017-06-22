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
@property (nonatomic, strong) NSArray *messages;

@property (nonatomic, strong) UIImageView *status;
@property (nonatomic, assign) CGPoint statusPosition;
@property (nonatomic, strong) UILabel *label;

@end

@implementation ViewController
{
    BOOL _requestLogin;
}



- (void)viewDidLoad {
    
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.messages = @[@"Connecting ...", @"Authorizing ...", @"Sending credentials ...", @"Failed"];
    
    self.loginButton.layer.cornerRadius = 8.0;
    self.loginButton.layer.masksToBounds = YES;
    
    self.spinner = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    self.spinner.frame = CGRectMake(-20, 6, 20, 20);
    self.spinner.alpha = 0.0;
    [self.spinner startAnimating];
    [self.loginButton addSubview:self.spinner];
    
    UIImage *image = [UIImage imageNamed:@"banner"];
    self.status = [[UIImageView alloc] initWithImage:image];
    self.status.frame = CGRectMake(0, 0, image.size.width, image.size.height);
    self.status.hidden = YES;
    self.status.center = self.loginButton.center;
    [self.view addSubview:self.status];
    
    
    self.label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.status.frame.size.width, self.status.frame.size.height)];
    self.label.font = [UIFont fontWithName:@"HelveticaNeue" size:18.0];
    self.label.textColor = [UIColor colorWithRed:0.89 green:0.38 blue:0.0 alpha:1.0];
    self.label.textAlignment = NSTextAlignmentCenter;
    [self.status addSubview:self.label];
    
    self.statusPosition = self.status.center;

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
    
    
    [self animateCloud:self.cloud1];
    [self animateCloud:self.cloud2];
    [self animateCloud:self.cloud3];
    [self animateCloud:self.cloud4];
}

- (IBAction)login:(UIButton *)sender {
    
    if (_requestLogin) {
        return;
    }
    
    _requestLogin = YES;
    
    [UIView animateWithDuration:1.5 delay:0.0 usingSpringWithDamping:0.2 initialSpringVelocity:0.0 options:NO animations:^{
        
        CGRect bounds = self.loginButton.bounds;
        bounds.size.width += 80;
        self.loginButton.bounds = bounds;
        
    } completion:^(BOOL finished) {
        
    }];
    
    
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
    
    [self showMessage:0];
    
}

- (void)showMessage:(NSInteger)index
{
    self.label.text = self.messages[index];

    [UIView transitionWithView:self.status duration:0.5 options:UIViewAnimationOptionCurveEaseOut | UIViewAnimationOptionTransitionCurlDown animations:^{
        self.status.hidden = NO;
    } completion:^(BOOL finished) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            if (index < [self.messages count] - 1) {
                [self removeMessage:index];
            }else{
                [self resetForm];
                 _requestLogin = NO;
            }
        });
    }];
}

- (void)removeMessage:(NSInteger)index
{
    [UIView animateWithDuration:0.3 delay:0 options:0 animations:^{
        
        CGPoint center =  self.status.center;
        center.x += self.view.frame.size.width;
        self.status.center = center;
        
    } completion:^(BOOL finished) {
        self.status.hidden = YES;
        self.status.center = self.statusPosition;
        [self showMessage:index+1];
    }];
}


- (void)animateCloud:(UIImageView *)cloud
{
    CGFloat cloudSpeed = 80/(self.view.bounds.size.width);
    NSTimeInterval duration = cloudSpeed * (self.view.frame.size.width - cloud.frame.origin.x) * cloudSpeed;
    [UIView animateWithDuration:duration delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
        
        CGPoint origin = cloud.frame.origin;
        origin.x = self.view.frame.size.width;
        cloud.frame = CGRectMake(origin.x, origin.y, cloud.bounds.size.width, cloud.bounds.size.height);
        
    } completion:^(BOOL finished) {
        
        //再次循环
        CGPoint origin = cloud.frame.origin;
        origin.x -= self.view.frame.size.width;
        cloud.frame = CGRectMake(origin.x, origin.y, cloud.bounds.size.width, cloud.bounds.size.height);
        [self animateCloud:cloud];
    }];
}


- (void)resetForm
{
    [UIView transitionWithView:self.status duration:0.3 options:UIViewAnimationOptionTransitionFlipFromTop animations:^{
        self.status.hidden = YES;
        self.status.center = self.statusPosition;
    } completion:nil];
    
    [UIView animateWithDuration:0.2 delay:0 options:0 animations:^{
        
        self.spinner.center = CGPointMake(-20, 16);
        self.spinner.alpha = 0.0;
        self.loginButton.backgroundColor = [UIColor colorWithRed:0.63 green:0.84 blue:0.35 alpha:1];
        
        CGRect bounds = self.loginButton.bounds;
        bounds.size.width -= 80;
        self.loginButton.bounds = bounds;
        
        CGPoint centerButton = self.loginButton.center;
        centerButton.y -= 60;
        self.loginButton.center = centerButton;
        
    } completion:nil];
}

@end
