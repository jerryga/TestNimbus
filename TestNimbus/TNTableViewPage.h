//
//  TNTableViewPage.h
//  TestNimbus
//
//  Created by Static Ga on 14-3-19.
//  Copyright (c) 2014年 Static Ga. All rights reserved.
//

#import "NIPagingScrollViewPage.h"
#import "TNPageIndexPath.h"

@class TNPageIndexPath, TNTableViewPage;

@protocol TNTableViewDataSource <NSObject>

@required
- (NSInteger)tableView:(TNTableViewPage *)tableView numberOfRowsInIndexPath:(TNPageIndexPath *)indexPath;
- (UITableViewCell *)tableView:(TNTableViewPage *)tableView cellForRowAtIndexPath:(TNPageIndexPath *)indexPath;

@optional
- (NSInteger)numberOfSectionsInTableView:(TNTableViewPage *)tableView;
@end

@protocol TNTableViewDelegate <NSObject>

@optional

- (CGFloat)tableView:(TNTableViewPage *)tableView heightForRowAtIndexPath:(TNPageIndexPath *)indexPath;
- (CGFloat)tableView:(TNTableViewPage *)tableView heightForHeaderInSectionOfPage:(TNPageIndexPath *)indexPath;
- (CGFloat)tableView:(TNTableViewPage *)tableView heightForFooterInSectionOfPage:(TNPageIndexPath *)indexPath;
- (UIView *)tableView:(TNTableViewPage *)tableView viewForHeaderInSectionOfPage:(TNPageIndexPath *)section;
- (void)tableView:(TNTableViewPage *)tableView didSelectRowAtIndexPathOfPage:(TNPageIndexPath *)indexPath;

@end

@interface TNTableViewPage : NIPagingScrollViewPage

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, weak) id<TNTableViewDataSource>dataSource;
@property (nonatomic, weak) id<TNTableViewDelegate>delegate;

- (id)initWithFrame:(CGRect)frame;

- (void)reloadData;

@end
