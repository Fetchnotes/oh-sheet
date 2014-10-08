//
//  newActionSheet.h
//  ForgeModule
//
//  Created by Giles Van Gruisen on 8/21/13.
//  Copyright (c) 2013 Trigger Corp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface newActionSheet : UIActionSheet
{
    NSArray *actions;
}
@property (nonatomic, retain) NSArray *actions;
@end
