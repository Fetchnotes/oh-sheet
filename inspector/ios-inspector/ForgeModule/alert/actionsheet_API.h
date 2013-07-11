//
//  alert_API.h
//  ForgeInspector
//
//  Created by Connor Dunn on 27/07/2012.
//  Copyright (c) 2012 Trigger Corp. All rights reserved.
//


#import <Foundation/Foundation.h>

@interface actionsheet_API : NSObject

+ (void)show:(ForgeTask*)task text:(NSString *)text destructiveTitle:(NSString *)destructiveTitle cancelTitle:(NSString *)cancelTitle;
+ (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex;


@end
