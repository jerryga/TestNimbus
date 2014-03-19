//
//  TNPageIndexPath.h
//  TestNimbus
//
//  Created by Static Ga on 14-3-19.
//  Copyright (c) 2014年 Static Ga. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TNPageIndexPath : NSObject
@property (nonatomic, assign) NSInteger page;
@property (nonatomic, assign) NSInteger row;
@property (nonatomic, assign) NSInteger section;
+ (instancetype)pageIndexPathForPage:(NSInteger)page row:(NSInteger)row section:(NSInteger)section ;
@end
