//
//  MoviesTableViewController.m
//  RottenTomatoes
//
//  Created by Mel on 10/18/14.
//  Copyright (c) 2014 Melinda Po. All rights reserved.
//

#import "MoviesTableViewController.h"

#import "MovieTableViewCell.h"

@interface MoviesTableViewController ()
//Second part create the array of movies - Mel note)
//"strong" means tableviewcontroller class is owning its object. Keep it around.
@property(strong, nonatomic) NSArray *movies;
@end

@implementation MoviesTableViewController

- (void)viewDidLoad {
    
    if(!self.movieListURL) {
        self.movieListURL = [NSURL URLWithString:@"http://api.rottentomatoes.com/api/public/v1.0/lists/movies/in_theaters.json?apikey=dmy6mm7zz4ykrzpvejdsgbd2"];
    }
    
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    
    // Mel note: start of code

    
    NSURLRequest *request = [NSURLRequest requestWithURL:self.movieListURL];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    
    //object that will be intereacting with the request
    NSURLSessionDataTask* task =[session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        //first let's get usable object
        //check if you have a data object. If no data, then it's nil (false).
        if (data){
            NSDictionary *responseDict =[NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
            self.movies = [responseDict[@"movies"] subarrayWithRange:NSMakeRange(0,10)];
            
            //calling a function here for dispatch. tells it to not block this thread until it is complete
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.tableView reloadData];
                 });
        }
    }];
    
    //start a tast with this code (melnote)
    [task resume];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return self.movies.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MovieTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MovieTableViewCell" forIndexPath:indexPath];
    
    // Configure the cell...
    NSDictionary* cellInfo = [self.movies objectAtIndex:indexPath.row];

    cell.movieTitleLabel.text = cellInfo[@"title"];
    cell.descriptionLabel.text = cellInfo[@"synopsis"];
    
    return cell;
}

@end
