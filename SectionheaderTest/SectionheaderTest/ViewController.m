//
//  ViewController.m
//  SectionheaderTest
//
//  Created by luozg on 2017/11/1.
//  Copyright © 2017年 luozg. All rights reserved.
//

#import "ViewController.h"
#import "TestSectionView.h"

@interface ViewController ()

@property (nonatomic,strong)TestSectionView *sectionView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.sectionView = [[TestSectionView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 20.0f)];
    self.sectionView.backgroundColor = [UIColor redColor];
    self.sectionView.tableView = self.tableView;
    self.sectionView.section = 0;
    if(@available(iOS 11.0, *))
    {
        self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        self.tableView.estimatedSectionFooterHeight = 0;
        self.tableView.estimatedSectionFooterHeight = 0;
        self.tableView.estimatedRowHeight = 0;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 20.0f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44.0f;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 100;
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return self.sectionView;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    cell.textLabel.text = [NSString stringWithFormat:@"%d",(int)indexPath.row];
    return cell;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGRect sectionRect = [self.tableView rectForSection:self.sectionView.section];
    if(self.tableView.contentOffset.y >= sectionRect.origin.y)
    {
        self.sectionView.frame = CGRectMake(self.sectionView.frame.origin.x, self.tableView.contentOffset.y, CGRectGetWidth(self.sectionView.frame), CGRectGetHeight(self.sectionView.frame));
    }
}

@end
