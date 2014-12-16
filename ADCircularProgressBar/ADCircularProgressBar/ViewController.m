//
//  ViewController.m
//  ADCircularProgressBar
//
//  Created by Aditya Deshmane on 08/12/14.
//  Copyright (c) 2014 Aditya Deshmane. All rights reserved.
//

#import "ViewController.h"
#import "ADCircularProgressView.h"//STEP 1: IMPORT

@interface ViewController ()
{
    ADCircularProgressView* _adCircularProgressView;
    NSTimer* _timer;
    int _iPercentageToShow;
}

@property (strong, nonatomic) IBOutlet UIView *viewForCircularProgress;

@end

@implementation ViewController


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _iPercentageToShow = 0;
    _adCircularProgressView = [[ADCircularProgressView alloc] initWithFrame:_viewForCircularProgress.bounds];//STEP 2: CREATE INSTANCE
    [_viewForCircularProgress addSubview:_adCircularProgressView];//STEP 3: ADD AS SUBVIEW
    [_adCircularProgressView updatePecentage:0];//STEP 4: SET INITIAL PERCENTAGE
    
    _timer = [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(incrementPercentage) userInfo:nil repeats:YES];
}


- (void)incrementPercentage
{
    if(_iPercentageToShow < 100)
    {
        _iPercentageToShow ++;
        [_adCircularProgressView updatePecentage:_iPercentageToShow];//STEP 5 : UPDATE WHENEVER REQUIRED
    }
    else
    {
        [_timer invalidate];
        _timer = nil;
    }
}

@end
