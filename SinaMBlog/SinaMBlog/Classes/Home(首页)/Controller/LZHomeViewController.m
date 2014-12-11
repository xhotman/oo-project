//
//  LZHomeViewController.m
//  SinaWeibo
//
//  Created by mac on 14-12-9.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import "LZHomeViewController.h"
#import "LZTitleButton.h"


@interface LZHomeViewController ()

@property (weak, nonatomic) UIButton *cover;
@property (weak, nonatomic) UIImageView *container;

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
    UITableView *tableView = [[UITableView alloc] init];
    tableView.size = CGSizeMake(150, 200);
    [self popFrom:titleButton content:tableView];
    
//    [titleButton setImage:[UIImage imageNamed:@"navigationbar_arrow_up"] forState:UIControlStateNormal];
    titleButton.selected = !titleButton.isSelected;
    LZLog(@"中间按钮!");
}


- (void)popFrom:(UIView *)from content:(UIView *)contentView
{
    UIWindow *window = self.view.window;
//    UIWindow *window = [[UIApplication sharedApplication] keyWindow];
//    UIWindow *window = [[[UIApplication sharedApplication] windows] lastObject];
    
    //蒙版
    UIButton *cover = [[UIButton alloc] init];
    cover.backgroundColor = [UIColor blackColor];
    cover.alpha = 0.5;
    cover.frame = [UIScreen mainScreen].bounds;
    [cover addTarget:self action:@selector(coverClick) forControlEvents:UIControlEventTouchUpInside];
    self.cover = cover;
    [window addSubview:cover];
    
    //弹出框-容器
    UIImageView *container = [[UIImageView alloc] init];
    container.userInteractionEnabled = YES; //默认是关闭交互的.
    container.image = [UIImage imageNamed:@"popover_background"];
//    container.width = 100;
//    container.height = 100;
//    container.centerX = from.width * 0.5;
//    container.y = 50;
    LZLog(@"%f", from.centerX);
    container.centerX = from.centerX - 100;
    container.y = CGRectGetMaxY(from.frame);
    LZLog(@"前:%@",NSStringFromCGRect(container.frame));
//    container.frame = [window convertRect:container.frame fromView:from.superview];
    container.center = [window convertPoint:container.center fromView:from.superview];
    LZLog(@"后:%@",NSStringFromCGRect(container.frame));
    self.container = container;
    [window addSubview:container];
    
    //弹出框-内容
    contentView.x = 10;
    contentView.y = 15;
    [container addSubview:contentView];
    
    //容器尺寸, 依内容大小而定
    container.width = CGRectGetMaxX(contentView.frame) + contentView.x;  //子控件以父控件为坐标参照
    container.height = CGRectGetMaxY(contentView.frame) + contentView.y;
}










- (void)coverClick
{
    [self.cover removeFromSuperview];
    [self.container removeFromSuperview];
    LZTitleButton *titleButton = (LZTitleButton *)self.navigationItem.titleView;
//    [titleButton setImage:[UIImage imageNamed:@"navigationbar_arrow_down"] forState:UIControlStateNormal];
    titleButton.selected = !titleButton.isSelected;
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
