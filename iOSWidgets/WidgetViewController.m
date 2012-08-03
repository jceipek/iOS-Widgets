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
    MessageBubble *messageLayer = [[MessageBubble alloc] initWithText:@"12:50" originX:150.0 y:200.0 fontSize:20.0f radius:5.0f];
    [[[self view] layer] addSublayer: messageLayer];
    [messageLayer setNeedsDisplay];
    
    PatternedPill *pillLayer = [[PatternedPill alloc] initWithTop:100.0f left:100.0f width:100.0f height:30.0f roundLeft:TRUE right:TRUE];
    [[[self view] layer] addSublayer: pillLayer];
    [pillLayer setNeedsDisplay];
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
