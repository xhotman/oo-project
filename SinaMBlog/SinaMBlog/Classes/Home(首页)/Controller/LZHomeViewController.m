//
//  LZHomeViewController.m
//  SinaWeibo
//
//  Created by mac on 14-12-9.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import "LZHomeViewController.h"
#import "LZTitleButton.h"
#import "LZPopMenu.h"
#import "LZTitleMenuViewController.h"


@interface LZHomeViewController ()

//@property (weak, nonatomic) UIButton *cover;
//@property (weak, nonatomic) UIImageView *container;

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
    
    //导航栏左右按钮
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithBg:@"navigationbar_friendsearch" BgSelected:@"navigationbar_friendsearch_highlighted" action:@selector(friendSearch) target:self];
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithBg:@"navigationbar_pop" BgSelected:@"navigationbar_pop_highlighted" action:@selector(pop) target:self];
    
    //导航栏中间标题
    LZTitleButton *titleButton = [[LZTitleButton alloc] init];
    [titleButton setTitle:@"首页" forState:UIControlStateNormal];
    [titleButton setImage:[UIImage imageNamed:@"navigationbar_arrow_down"] forState:UIControlStateNormal];
    [titleButton setImage:[UIImage imageNamed:@"navigationbar_arrow_up"] forState:UIControlStateSelected];
    [titleButton addTarget:self action:@selector(titleClick:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.titleView = titleButton;
}

- (void)titleClick:(LZTitleButton *)titleButton
{
    LZTitleMenuViewController *titleMenuVC = [[LZTitleMenuViewController alloc] init];
    titleMenuVC.view.autoresizingMask = UIViewAutoresizingNone; //禁止控制器view自动拉伸!否则设置view大小失效!
    titleMenuVC.view.size = CGSizeMake(150, 200);

    [LZPopMenu popFrom:titleButton contentVC:titleMenuVC dismiss:^(NSString *s){
    titleButton.selected = !titleButton.isSelected;
//        LZLog(@"%@",s);
    }];
    
    titleButton.selected = !titleButton.isSelected;
//    LZLog(@"中间按钮!");
}



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
