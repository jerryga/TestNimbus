//
//  TNTableViewPage.m
//  TestNimbus
//
//  Created by Static Ga on 14-3-19.
//  Copyright (c) 2014年 Static Ga. All rights reserved.
//

#import "TNTableViewPage.h"

#define kDefaultRowHeight 44.0f
#define kDefaultHeaderSectionHeight 23.0f
#define kDefaultFootSectionHeight 23.0f

@interface TNTableViewPage ()<UITableViewDataSource,UITableViewDelegate>


@end

@implementation TNTableViewPage

- (id)initWithFrame:(CGRect)frame  {
    if (self = [super initWithFrame:frame]) {
        [self configureSubViews:frame];
    }
    
    return self;
}

#pragma mark - private

- (void)configureSubViews :(CGRect)frame{
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height) style:UITableViewStylePlain];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self addSubview:self.tableView];
}

#pragma mark - public

- (void)reloadData {
    [self.tableView reloadData];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

#pragma mark - tableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (self.dataSource && [self.dataSource respondsToSelector:@selector(tableView:numberOfRowsInIndexPath:)]) {
      return  [self.dataSource tableView:self numberOfRowsInIndexPath:[TNPageIndexPath pageIndexPathForPage:self.pageIndex row:0 section:section]];
    }
    
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.dataSource && [self.dataSource respondsToSelector:@selector(tableView:cellForRowAtIndexPath:)]) {
    return [self.dataSource tableView:self cellForRowAtIndexPath:[TNPageIndexPath pageIndexPathForPage:self.pageIndex row:indexPath.row section:indexPath.section]];
    }
    
    return nil;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    if (self.dataSource && [self.dataSource respondsToSelector:@selector(numberOfSectionsInTableView:)]) {
       return  [self.dataSource numberOfSectionsInTableView:self];
    }
    return 1;
}
#pragma mark - tableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.delegate && [self.delegate respondsToSelector:@selector(tableView:heightForRowAtIndexPath:)]) {
        return [self.delegate tableView:self heightForRowAtIndexPath:[TNPageIndexPath pageIndexPathForPage:self.pageIndex row:indexPath.row section:indexPath.section]];
    }
    return kDefaultRowHeight;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (self.delegate && [self.delegate respondsToSelector:@selector(tableView:heightForHeaderInSectionOfPage:)]) {
        return [self.delegate tableView:self heightForHeaderInSectionOfPage:[TNPageIndexPath pageIndexPathForPage:self.pageIndex row:0 section:section]];
    }
    return kDefaultHeaderSectionHeight;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    if (self.delegate && [self.delegate respondsToSelector:@selector(tableView:heightForFooterInSectionOfPage:)]) {
        return [self.delegate tableView:self heightForFooterInSectionOfPage:[TNPageIndexPath pageIndexPathForPage:self.pageIndex row:0 section:section]];
    }
    return kDefaultFootSectionHeight;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (self.delegate && [self.delegate respondsToSelector:@selector(tableView:viewForHeaderInSectionOfPage:)]) {
        return [self.delegate tableView:self viewForHeaderInSectionOfPage:[TNPageIndexPath pageIndexPathForPage:self.pageIndex row:0 section:section]];
    }
    return nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(tableView:didSelectRowAtIndexPathOfPage:)]) {
        [self.delegate tableView:self didSelectRowAtIndexPathOfPage:[TNPageIndexPath pageIndexPathForPage:self.pageIndex row:indexPath.row section:indexPath.section]];
    }
}

@end
