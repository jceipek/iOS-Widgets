//
//  WidgetViewController.m
//  iOSWidgets
//
//  Created by Julian Ceipek on 7/31/12.
//  Copyright (c) 2012 Julian Ceipek. All rights reserved.
//

#import "WidgetViewController.h"

@interface WidgetViewController ()

@end

@implementation WidgetViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    MessageBubble *newLayer = [[MessageBubble alloc] initWithText:@"12:50" originX:150.0 y:200.0 fontSize:20.0f radius:5.0f];
    [[[self view] layer] addSublayer: newLayer];
    //[newLayer setNeedsLayout];

    [newLayer setNeedsDisplay];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
