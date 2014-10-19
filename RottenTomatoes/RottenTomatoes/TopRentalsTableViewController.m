//
//  TopRentalsTableViewController.m
//  RottenTomatoes
//
//  Created by Mel on 10/18/14.
//  Copyright (c) 2014 Melinda Po. All rights reserved.
//

#import "TopRentalsTableViewController.h"

@interface TopRentalsTableViewController ()

@end

@implementation TopRentalsTableViewController

- (void)viewDidLoad {
    self.movieListURL = [NSURL URLWithString:@"http://api.rottentomatoes.com/api/public/v1.0/lists/dvds/top_rentals.json?apikey=dmy6mm7zz4ykrzpvejdsgbd2"];
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
