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

- (void)updateViews;
- (void)addImageView;

@end

@implementation ViewController

CGFloat imageHeight = 300;
CGFloat buttonheight = 60;
CGFloat textFieldHeight = 40;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self updateViews];
    [self addImageView];

}

- (void)updateViews {
    
    // ADD SCROLL VIEW
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectZero];
    scrollView.translatesAutoresizingMaskIntoConstraints = NO;
    scrollView.alwaysBounceVertical = YES;
    scrollView.keyboardDismissMode = UIScrollViewKeyboardDismissModeInteractive;
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
    
    [scrollView addSubview:contentView];
    
    // Content View Constraints
    [contentView.widthAnchor constraintEqualToAnchor:self.view.widthAnchor].active = YES;
    //[contentView.heightAnchor constraintEqualToAnchor:self.view.heightAnchor].active = YES;
    
    // ADD STACK VIEW FOR CONTENT VIEW
    UIStackView *stackView = [[UIStackView alloc] init];
    stackView.translatesAutoresizingMaskIntoConstraints = NO;
    stackView.axis = UILayoutConstraintAxisVertical;
    stackView.alignment = UIStackViewAlignmentFill;
    stackView.spacing = 8;
    stackView.directionalLayoutMargins = NSDirectionalEdgeInsetsMake(20, 20, 20, 20);
    stackView.layoutMarginsRelativeArrangement = YES;

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
    
    // Text Field Constraints
    [nameTextField.heightAnchor constraintEqualToConstant:textFieldHeight].active = YES;
    [passwordTextField.heightAnchor constraintEqualToConstant:textFieldHeight].active = YES;
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setBackgroundImage:[UIImage imageNamed:@"blue-button"] forState:UIControlStateNormal];
    [button setTitle:@"Log In" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:24 weight:UIFontWeightBold];
    button.adjustsImageWhenHighlighted = YES;
    
    [stackView addArrangedSubview:nameTextField];
    [stackView addArrangedSubview:passwordTextField];
    [stackView addArrangedSubview:button];
    
}

- (void)addImageView {
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"kalen-emsley-mountain"]];
    
    imageView.frame = CGRectMake(0, 0, self.view.bounds.size.width, imageHeight);
    
    [self.view addSubview:imageView];
    
}


@end
