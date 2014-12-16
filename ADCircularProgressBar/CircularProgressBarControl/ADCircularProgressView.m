//
//  ADCircularProgressView.m
//  ADCircularProgressBar
//
//  Created by Aditya Deshmane on 08/12/14.
//  Copyright (c) 2014 Aditya Deshmane. All rights reserved.
//

#import "ADCircularProgressView.h"


@interface ADCircularProgressView ()
{
    CGFloat _fStartAngle;//Start angle of progress
    CGFloat _fEndAngle;//End angle of progress (start angle + 360 deg)
    UILabel *_lblPercentage;//Text label showing precentage
    NSUInteger _iPercent;
    float _fBarThickness;
    
    UIColor *_colorText;
    UIColor *_colorProgressBar;
    UIColor *_colorViewBackground;
    
    UIFont *_fontPercentageText;
}

-(void)setupData;
-(void)setupUI;

@end



@implementation ADCircularProgressView


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];

    if (self)
    {
        [self setupData];
        [self setupUI];
    }
    
    return self;
}


-(void)setupData
{
    _fStartAngle = M_PI + 0.6;
    _fEndAngle = _fStartAngle + (M_PI * 2);
    _fBarThickness = 3.0;
    
    _colorText = [UIColor darkGrayColor];
    _colorProgressBar = [UIColor darkGrayColor];
    _colorViewBackground = [UIColor clearColor];
    
    _fontPercentageText = [UIFont fontWithName: @"HelveticaNeue-UltraLight" size: 60];
}


-(void)setupUI
{
    [self setBackgroundColor:_colorViewBackground];
    _lblPercentage = [[UILabel alloc] initWithFrame:self.frame];
    _lblPercentage.textAlignment = NSTextAlignmentCenter;
    _lblPercentage.font = _fontPercentageText;
    _lblPercentage.textColor = _colorText;
    [self addSubview:_lblPercentage];
}


- (void)drawRect:(CGRect)rect
{
    //1. Draw Curve
    UIBezierPath* bezierPath = [UIBezierPath bezierPath];
    [bezierPath addArcWithCenter:CGPointMake(rect.size.width / 2, rect.size.height / 2)
                          radius:(rect.size.width/2 > 10 ? rect.size.width/2 - 10 : rect.size.width)
                      startAngle:_fStartAngle
                        endAngle:(_fEndAngle - _fStartAngle) * (_iPercent / 100.0) + _fStartAngle
                       clockwise:YES];
    
    bezierPath.lineWidth = _fBarThickness;
    [_colorProgressBar setStroke];
    [bezierPath stroke];
    
    //2. Set Percentage Text
    [_lblPercentage setText:[NSString stringWithFormat:@"%d", (int)_iPercent]];
}


- (void)updatePecentage:(NSUInteger) percent
{
    //Force Main thread
    if([NSThread currentThread] != [NSThread mainThread])
    {
        dispatch_async(dispatch_get_main_queue(),
        ^{
            [self updatePecentage:percent];
            return;
        });
    }
    
    if(percent <= 100)
    {
        _iPercent = percent;
        [self setNeedsDisplay];
    }
}


@end
