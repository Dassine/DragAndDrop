//
//  ViewController.m
//  DragAndDrop
//
//  Created by Lilia Dassine BELAID on 2017-03-31.
//  Copyright © 2017 Lilia Dassine BELAID. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIGestureRecognizerDelegate> {
    UIPanGestureRecognizer *panRecognizer;
    float firstX;
    float firstY;
    
}

@property (nonatomic, strong) UIImageView *photoImageView;
@property (nonatomic, strong) UIImageView *trashcanImageView;

@end

@implementation ViewController


-(void)viewDidLoad {
    
    [super viewDidLoad];
    
    UIImage *image = [UIImage imageNamed:@"photo.png"];
    _photoImageView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 20, image.size.width, image.size.height)];
    [_photoImageView setImage:image];
    [_photoImageView setUserInteractionEnabled:YES];
    [self.view addSubview:_photoImageView];
    
    image = [UIImage imageNamed:@"trashcan.png"];
    _trashcanImageView = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetWidth([[UIScreen mainScreen] bounds])-image.size.width-20, CGRectGetHeight([[UIScreen mainScreen] bounds])-image.size.width-20, image.size.width, image.size.height)];
    [_trashcanImageView setImage:image];
    [self.view addSubview:_trashcanImageView];
    
    panRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(move:)];
    [panRecognizer setMinimumNumberOfTouches:1];
    [panRecognizer setMaximumNumberOfTouches:1];
    [panRecognizer setDelegate:self];
    [_photoImageView addGestureRecognizer:panRecognizer];
    
}

-(void)move:(id)sender {
    
    CGPoint translatedPoint = [(UIPanGestureRecognizer*)sender translationInView:self.view];
    
    if([(UIPanGestureRecognizer*)sender state] == UIGestureRecognizerStateBegan) {
        
        firstX = [[sender view] center].x;
        firstY = [[sender view] center].y;
    }
    
    translatedPoint = CGPointMake(firstX + translatedPoint.x, firstY + translatedPoint.y);
    [[sender view] setCenter:translatedPoint];
    
    CGPoint pointInTrash = [panRecognizer locationInView:_trashcanImageView];
    if ([_trashcanImageView pointInside:pointInTrash withEvent:nil])
        [_photoImageView removeFromSuperview];
        
    
}

@end
