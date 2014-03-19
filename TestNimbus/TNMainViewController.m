//
//  TNMainViewController.m
//  TestNimbus
//
//  Created by Static Ga on 14-3-19.
//  Copyright (c) 2014年 Static Ga. All rights reserved.
//

#import "TNMainViewController.h"
#import "NIPagingScrollView.h"
#import "NIPagingScrollViewPage.h"
#import "TNTableViewPage.h"

@interface TNMainViewController ()<NIPagingScrollViewDelegate, NIPagingScrollViewDataSource,TNTableViewDataSource,TNTableViewDelegate>
{
    NIPagingScrollView *scrollView_;
}
@property (weak, nonatomic) IBOutlet UIView *containerView;
- (IBAction)btnClicked:(id)sender;


@end

@implementation TNMainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    scrollView_ = [[NIPagingScrollView alloc] initWithFrame:self.containerView.bounds];
    scrollView_.dataSource = self;
    scrollView_.delegate = self;
    [scrollView_ reloadData];
    scrollView_.backgroundColor = [UIColor orangeColor];
    
    
    [self.containerView addSubview:scrollView_];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - NIPagingScrollViewDataSource

- (NSInteger)numberOfPagesInPagingScrollView:(NIPagingScrollView *)pagingScrollView {
    return 13;
}

- (UIView<NIPagingScrollViewPage> *)pagingScrollView:(NIPagingScrollView *)pagingScrollView pageViewForIndex:(NSInteger)pageIndex {

    static NSString *ReusableIdentifier = @"IntroPage";
    //If you want to custom interface, Please SubClass NIPagingScrollViewPage
    TNTableViewPage *pageView = (TNTableViewPage *)[scrollView_ dequeueReusablePageWithIdentifier:ReusableIdentifier];
    if (!pageView) {
        pageView = [[TNTableViewPage alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
        pageView.dataSource = self;
        pageView.delegate = self;
        pageView.reuseIdentifier = ReusableIdentifier;
        pageView.backgroundColor = [UIColor redColor];

    }

    pageView.pageIndex = pageIndex;

    [pageView reloadData];
    
    return pageView;
    
}
#pragma mark - NIPagingScrollViewDelegate

- (void)pagingScrollViewDidChangePages:(NIPagingScrollView *)pagingScrollView {

}

#pragma mark - pageViewDataSource

- (NSInteger)tableView:(TNTableViewPage *)tableView numberOfRowsInIndexPath:(TNPageIndexPath *)indexPath {
    NSLog(@"section %d",indexPath.section);
    return indexPath.page + 1 ;
}

- (UITableViewCell *)tableView:(TNTableViewPage *)tableView cellForRowAtIndexPath:(TNPageIndexPath *)indexPath {
    static NSString *identity = @"UITableViewCell";
	UITableViewCell *cell = (UITableViewCell*)[tableView.tableView dequeueReusableCellWithIdentifier:identity];
	if (cell == nil) {
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identity];
	}
	[[cell textLabel] setText:[NSString stringWithFormat:@"contentView %i section %i row %i", indexPath.page, indexPath.section, indexPath.row+1]];
	return cell;

}

#define kBaseTag 1000

- (IBAction)btnClicked:(id)sender {
    UIButton *btn = sender;
    int tag = btn.tag - kBaseTag;
    [scrollView_ moveToPageAtIndex:tag animated:NO];
}
@end
