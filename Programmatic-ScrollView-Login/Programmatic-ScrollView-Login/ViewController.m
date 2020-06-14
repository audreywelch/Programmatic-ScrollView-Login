//
//  ViewController.m
//  Programmatic-ScrollView-Login
//
//  Created by Audrey Welch on 6/13/20.
//  Copyright © 2020 Audrey Welch. All rights reserved.
//

#import "ViewController.h"
#import "Programmatic_ScrollView_Login-Swift.h"

static const CGFloat imageHeight = 300;
static const CGFloat buttonheight = 60;
static const CGFloat textFieldHeight = 40;
static const CGFloat stackViewPadding = 20;

// Class Extension
@interface ViewController () <UITextFieldDelegate, UIScrollViewDelegate>

@property (nonatomic) PaddedTextField *nameTextField;
@property (nonatomic) PaddedTextField *passwordTextField;
@property (nonatomic) UIImageView *topImageView;

- (void)updateViews;
- (void)addImageView;

@end

@implementation ViewController

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
    scrollView.delaysContentTouches = NO;
    scrollView.contentInset = UIEdgeInsetsMake(imageHeight, 0, 0, 0);
    scrollView.delegate = self;
    scrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    
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
    stackView.spacing = 16;
    stackView.directionalLayoutMargins = NSDirectionalEdgeInsetsMake(stackViewPadding, stackViewPadding, stackViewPadding, stackViewPadding);
    stackView.layoutMarginsRelativeArrangement = YES;

    [contentView addSubview:stackView];
    
    // Stack View Constraints
    [stackView.topAnchor constraintEqualToAnchor:contentView.topAnchor].active = YES;
    [stackView.leadingAnchor constraintEqualToAnchor:contentView.leadingAnchor].active = YES;
    [stackView.trailingAnchor constraintEqualToAnchor:contentView.trailingAnchor].active = YES;
    [stackView.bottomAnchor constraintEqualToAnchor:contentView.bottomAnchor].active = YES;
    
    // ADD TEXT FIELDS
    self.nameTextField = [[PaddedTextField alloc] init];
    self.nameTextField.translatesAutoresizingMaskIntoConstraints = NO;
    self.nameTextField.placeholder = @"Name";
    self.nameTextField.delegate = self;
    [self.view addSubview:self.nameTextField];
    
    self.passwordTextField = [[PaddedTextField alloc] init];
    self.passwordTextField.translatesAutoresizingMaskIntoConstraints = NO;
    self.passwordTextField.placeholder = @"Password";
    self.passwordTextField.delegate = self;
    self.passwordTextField.secureTextEntry = YES;
    
    // Text Field Constraints
    [self.nameTextField.heightAnchor constraintEqualToConstant:textFieldHeight].active = YES;
    [self.passwordTextField.heightAnchor constraintEqualToConstant:textFieldHeight].active = YES;
    
    self.nameTextField.nextView = self.passwordTextField;
    self.passwordTextField.nextView = nil;
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setBackgroundImage:[UIImage imageNamed:@"blue-button"] forState:UIControlStateNormal];
    [button setTitle:@"Log In" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:24 weight:UIFontWeightBold];
    button.adjustsImageWhenHighlighted = YES;
    [button addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    [stackView addArrangedSubview:self.nameTextField];
    [stackView addArrangedSubview:self.passwordTextField];
    [stackView addArrangedSubview:button];
    
}

- (void)buttonPressed:(UIButton *)button {
    
    NSLog(@"Log In!");
    [self.view endEditing:YES];
}

- (void)addImageView {
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"kalen-emsley-mountain"]];
    
    imageView.frame = CGRectMake(0, 0, self.view.bounds.size.width, imageHeight);
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    imageView.clipsToBounds = YES;
    
    _topImageView = imageView;
    
    [self.view addSubview:imageView];
    
}

#pragma mark - UITextFieldDelegate Methods

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if ([textField conformsToProtocol:@protocol(NextView)]) {
        id<NextView> view = (id<NextView>)textField;
        if (view.nextView) {
            [view.nextView becomeFirstResponder];
        } else {
            [textField resignFirstResponder];
            NSLog(@"Log in with user: %@, password: %@", self.nameTextField.text, self.passwordTextField.text);
        }
    }
    return YES;
}

#pragma mark - UIScrollViewDelegate Methods

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    CGFloat height = -scrollView.contentOffset.y;
    
    if (height > imageHeight) {
        // stretch it longer using contentFill
        CGRect rect = _topImageView.frame;
        rect.size.height = height;
        _topImageView.frame = rect;
        
    } else {
        // push it offscreen by changing the y coordinate
        CGRect frame = _topImageView.frame;
        frame.origin.y = height - imageHeight;
        _topImageView.frame = frame;
        
    }
}


@end


