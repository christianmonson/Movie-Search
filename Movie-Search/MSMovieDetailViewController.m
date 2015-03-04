//
//  MSMovieDetailViewController.m
//  Movie-Search
//
//  Created by Joshua Howland on 6/18/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import "MSMovieDetailViewController.h"
#import "MovieController.h"
#import <UIImageView+AFNetworking.h>

@interface MSMovieDetailViewController ()

@property (weak, nonatomic) IBOutlet UILabel *taglineLabel;
@property (weak, nonatomic) IBOutlet UILabel *releaseDateLabel;
@property (weak, nonatomic) IBOutlet UILabel *overviewLabel;
@property (weak, nonatomic) IBOutlet UIImageView *posterImageView;
@property (weak, nonatomic) IBOutlet UILabel *genreLabel;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *voteLabel;

@end

@implementation MSMovieDetailViewController

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
    // Do any additional setup after loading the view from its nib.
    
    [[MovieController sharedInstance] retrieveMovieWithID:self.movieID completion:^(NSDictionary *dictionary) {
        self.taglineLabel.text = dictionary[@"tagline"];
        self.releaseDateLabel.text = dictionary[@"release_date"];
        self.overviewLabel.text = dictionary[@"overview"];
        self.genreLabel.text = dictionary[@"genres"][0][@"name"];
        self.titleLabel.text = dictionary[@"title"];
        self.voteLabel.text = [NSString stringWithFormat:@"%@", dictionary[@"vote_average"]];
        [self.posterImageView setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://image.tmdb.org/t/p/w92%@", [dictionary objectForKey:@"poster_path"]]]];
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
