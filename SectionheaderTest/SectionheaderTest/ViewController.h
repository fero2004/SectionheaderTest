//
//  ViewController.h
//  SectionheaderTest
//
//  Created by luozg on 2017/11/1.
//  Copyright © 2017年 luozg. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,weak)IBOutlet UITableView *tableView;

@end

