//
//  TNPageIndexPath.m
//  TestNimbus
//
//  Created by Static Ga on 14-3-19.
//  Copyright (c) 2014年 Static Ga. All rights reserved.
//

#import "TNPageIndexPath.h"

@implementation TNPageIndexPath
+ (instancetype)pageIndexPathForPage:(NSInteger)page row:(NSInteger)row section:(NSInteger)section {
    TNPageIndexPath *idx = [[TNPageIndexPath alloc] init];
    idx.page = page;
    idx.row = row;
    idx.section = section;
    
    return idx;
}
@end
