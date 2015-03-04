//
//  MSViewController.m
//  Movie-Search
//
//  Created by Joshua Howland on 6/18/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import "MSViewController.h"
#import "MSResponseTableViewDataSource.h"
#import "MSMovieDetailViewController.h"
#import "MovieController.h"

@interface MSViewController () <UITableViewDelegate>

@property (nonatomic, strong) IBOutlet UITextField *searchField;
@property (nonatomic, strong) IBOutlet UITableView *tableView;
@property (nonatomic, strong) MSResponseTableViewDataSource *dataSource;

@end

@implementation MSViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.dataSource = [MSResponseTableViewDataSource new];
    
    self.tableView.dataSource = self.dataSource;
    self.tableView.delegate = self;
    [self.view addSubview:self.tableView];

}

- (IBAction)search:(id)sender {
    NSString *name = [self.searchField.text stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];

    [[MovieController sharedInstance] retrieveMovieWithName:name completion:^(NSArray *movies) {
        NSString *movieName = movies[0][@"title"];
        NSLog(@"%@",movieName);
        [self.tableView reloadData];
    }];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    MSMovieDetailViewController *detailViewController = [MSMovieDetailViewController new];
    NSNumber *movieID = [MovieController sharedInstance].resultMovies[indexPath.row][@"id"];
    NSString *movieIDString = [NSString stringWithFormat:@"%@", movieID];
    detailViewController.movieID = movieIDString;
    [self.navigationController pushViewController:detailViewController animated:YES];
}

@end
