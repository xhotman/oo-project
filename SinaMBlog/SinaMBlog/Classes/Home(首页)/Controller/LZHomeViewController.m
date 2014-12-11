//
//  LZHomeViewController.m
//  SinaWeibo
//
//  Created by mac on 14-12-9.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import "LZHomeViewController.h"


@interface LZHomeViewController ()

@end

@implementation LZHomeViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    
//    UIButton *leftButton = [[UIButton alloc] init];
//    [leftButton setBackgroundImage:[UIImage imageNamed:@"navigationbar_friendsearch"] forState:UIControlStateNormal];
//    [leftButton setBackgroundImage:[UIImage imageNamed:@"navigationbar_friendsearch_highlighted"] forState:UIControlStateHighlighted];
//    CGSize sizeL = leftButton.currentBackgroundImage.size;
//    leftButton.bounds = CGRectMake(0, 0, sizeL.width, sizeL.height);
////    leftButton.size = leftButton.currentBackgroundImage.size;
//    [leftButton addTarget:self action:@selector(friendSearch) forControlEvents:UIControlEventTouchUpInside];
//    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftButton];
    
//    self.navigationItem.leftBarButtonItem = [self itemWithBg:@"navigationbar_friendsearch" BgSelected:@"navigationbar_friendsearch_highlighted" action:@selector(friendSearch)];
    
    
//    UIButton *rightButton = [[UIButton alloc] init];
//    [rightButton setBackgroundImage:[UIImage imageNamed:@"navigationbar_pop"] forState:UIControlStateNormal];
//    [rightButton setBackgroundImage:[UIImage imageNamed:@"navigationbar_pop_highlighted"] forState:UIControlStateHighlighted];
//    CGSize sizeR = rightButton.currentBackgroundImage.size;
//    rightButton.bounds = CGRectMake(0, 0, sizeR.width, sizeR.height);
//    //    leftButton.size = leftButton.currentBackgroundImage.size;
//    [rightButton addTarget:self action:@selector(pop) forControlEvents:UIControlEventTouchUpInside];
//    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightButton];
    
//    self.navigationItem.rightBarButtonItem = [self itemWithBg:@"navigationbar_pop" BgSelected:@"navigationbar_pop_highlighted" action:@selector(pop)];
    
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithBg:@"navigationbar_friendsearch" BgSelected:@"navigationbar_friendsearch_highlighted" action:@selector(friendSearch) target:self];
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithBg:@"navigationbar_pop" BgSelected:@"navigationbar_pop_highlighted" action:@selector(pop) target:self];
}

//- (UIBarButtonItem *)itemWithBg:(NSString *)bg BgSelected:(NSString *)bgSelected action:(SEL)action
//{
//    UIButton *aButton = [[UIButton alloc] init];
//    [aButton setBackgroundImage:[UIImage imageNamed:bg] forState:UIControlStateNormal];
//    [aButton setBackgroundImage:[UIImage imageNamed:bgSelected] forState:UIControlStateHighlighted];
////    CGSize sizeL = leftButton.currentBackgroundImage.size;
////    leftButton.bounds = CGRectMake(0, 0, sizeL.width, sizeL.height);
//    aButton.size = aButton.currentBackgroundImage.size;
//    [aButton addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
//    return [[UIBarButtonItem alloc] initWithCustomView:aButton];
//}






- (void)friendSearch
{
    LZLog(@"=================");
}


- (void)pop
{
    LZLog(@"<<<<<<<<");
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 0;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
