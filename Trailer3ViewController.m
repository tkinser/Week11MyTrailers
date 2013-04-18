//
//  Trailer3ViewController.m
//  MyMovies
//
//  Created by Thomas Kinser on 4/18/13.
//  Copyright (c) 2013 RVC Student. All rights reserved.
//

#import "Trailer3ViewController.h"

@interface Trailer3ViewController ()

@end

@implementation Trailer3ViewController

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
    //Change to match you video filename in supporting files
    NSString *url = [[NSBundle mainBundle]
                     pathForResource:@"Trailer3"
                     ofType:@"mp4"];
    
    player = [[MPMoviePlayerController alloc]
              initWithContentURL:[NSURL fileURLWithPath:url]];
    
    [[NSNotificationCenter defaultCenter]
     addObserver:self
     selector:@selector(movieFinishedCallback:)
     name:MPMoviePlayerPlaybackDidFinishNotification
     object:player];
    
    //—set the size of the movie view and then add it to the View window—
    player.view.frame = CGRectMake(10, 40, 550,250);
    [self.view addSubview:player.view];
    
    //—play movie—
    [player play];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
//copy paste right below viewdidload
- (void) movieFinishedCallback:(NSNotification*) aNotification {
    MPMoviePlayerController *moviePlayer = [aNotification object];
    [[NSNotificationCenter defaultCenter]
     removeObserver:self
     name:MPMoviePlayerPlaybackDidFinishNotification
     object:moviePlayer];
    [moviePlayer.view removeFromSuperview];
    [player release];
}
-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}
- (void)viewDidUnload
{
    
    [super viewDidUnload];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    //Stop Player when Back button  caused view to disappear
    //[player stop];
    [super viewDidDisappear:animated];
}

/*- (void)viewDidLoad
 {
 [super viewDidLoad];
 // Do any additional setup after loading the view.
 }
 */
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end