//
//  TestSectionView.m
//  SectionheaderTest
//
//  Created by luozg on 2017/11/1.
//  Copyright © 2017年 luozg. All rights reserved.
//

#import "TestSectionView.h"

@implementation TestSectionView

- (void)setFrame:(CGRect)frame
{
    CGRect sectionRect = [self.tableView rectForSection:self.section];
    if(self.tableView.contentOffset.y >= sectionRect.origin.y)
    {
        frame = CGRectMake(frame.origin.x, self.tableView.contentOffset.y, CGRectGetWidth(frame), CGRectGetHeight(frame));
    }
    [super setFrame:frame];
}

//hack,系统会自动删除header头,这里把他加回来
- (void)removeFromSuperview
{
    [super removeFromSuperview];
    if(self.superview == nil && self.tableView)
    {
        [self.tableView addSubview:self];
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
