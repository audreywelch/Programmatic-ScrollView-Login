//
//  ViewController.m
//  Programmatic-ScrollView-Login
//
//  Created by Audrey Welch on 6/13/20.
//  Copyright © 2020 Audrey Welch. All rights reserved.
//

#import "ViewController.h"
#import "Programmatic_ScrollView_Login-Swift.h"

@interface ViewController ()

- (void)addScrollView;
- (void)addImageView;

@end

@implementation ViewController

CGFloat imageHeight = 300;
CGFloat buttonheight = 60;
CGFloat textFieldHeight = 40;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addScrollView];
    [self addImageView];

}

- (void)addScrollView {
    
    // ADD SCROLL VIEW
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectZero];
    scrollView.translatesAutoresizingMaskIntoConstraints = NO;
    scrollView.backgroundColor = [UIColor cyanColor];
    scrollView.contentInset = UIEdgeInsetsMake(imageHeight, 0, 0, 0);
    
    [self.view addSubview:scrollView];
    
    // Scroll View Constraints
    UILayoutGuide *edge = self.view.safeAreaLayoutGuide;
    [scrollView.topAnchor constraintEqualToAnchor:edge.topAnchor].active = YES;
    [scrollView.leadingAnchor constraintEqualToAnchor:edge.leadingAnchor].active = YES;
    [scrollView.trailingAnchor constraintEqualToAnchor:edge.trailingAnchor].active = YES;
    [scrollView.bottomAnchor constraintEqualToAnchor:edge.bottomAnchor].active = YES;
    
    // ADD CONTENT VIEW
    UIView *contentView = [[UIView alloc] init];
    contentView.translatesAutoresizingMaskIntoConstraints = NO;
    contentView.backgroundColor = [UIColor systemPinkColor];
    
    [scrollView addSubview:contentView];
    
    // Content View Constraints
    [contentView.widthAnchor constraintEqualToAnchor:self.view.widthAnchor].active = YES;
    //[contentView.heightAnchor constraintEqualToAnchor:self.view.heightAnchor].active = YES;
    
    // ADD STACK VIEW FOR CONTENT VIEW
    UIStackView *stackView = [[UIStackView alloc] init];
    stackView.translatesAutoresizingMaskIntoConstraints = NO;
    stackView.axis = UILayoutConstraintAxisVertical;
    stackView.alignment = UIStackViewAlignmentFill;
    stackView.directionalLayoutMargins = NSDirectionalEdgeInsetsMake(20, 20, 20, 20);

    [contentView addSubview:stackView];
    
    // Stack View Constraints
    [stackView.topAnchor constraintEqualToAnchor:contentView.topAnchor].active = YES;
    [stackView.leadingAnchor constraintEqualToAnchor:contentView.leadingAnchor].active = YES;
    [stackView.trailingAnchor constraintEqualToAnchor:contentView.trailingAnchor].active = YES;
    [stackView.bottomAnchor constraintEqualToAnchor:contentView.bottomAnchor].active = YES;
    
    // ADD TEXT FIELDS
    UITextField *nameTextField = [[PaddedTextField alloc] init];
    nameTextField.translatesAutoresizingMaskIntoConstraints = NO;
    nameTextField.placeholder = @"Name";
    [self.view addSubview:nameTextField];
    
    UITextField *passwordTextField = [[PaddedTextField alloc] init];
    passwordTextField.translatesAutoresizingMaskIntoConstraints = NO;
    passwordTextField.placeholder = @"Password";
    passwordTextField.secureTextEntry = YES;
    
    [stackView addArrangedSubview:nameTextField];
    [stackView addArrangedSubview:passwordTextField];
    
    
    

    
}

- (void)addImageView {
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"kalen-emsley-mountain"]];
    
    imageView.frame = CGRectMake(0, 0, self.view.bounds.size.width, imageHeight);
    imageView.alpha = 0.5;
    
    [self.view addSubview:imageView];
    
}


@end
