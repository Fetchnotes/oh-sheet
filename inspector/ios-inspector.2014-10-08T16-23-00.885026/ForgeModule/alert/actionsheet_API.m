//
//  alert_API.m
//  ForgeInspector
//
//  Created by Connor Dunn on 27/07/2012.
//  Copyright (c) 2012 Trigger Corp. All rights reserved.
//

#import "actionsheet_API.h"
#import <QuartzCore/QuartzCore.h>

@implementation actionsheet_API

+ (void)show:(ForgeTask*)task text:(NSString *)text destructiveTitle:(NSString *)destructiveTitle cancelTitle:(NSString *)cancelTitle {
	UIActionSheet *actionSheet = [[UIActionSheet alloc]
                                  initWithTitle:text
                                  delegate:self
                                  cancelButtonTitle:cancelTitle
                                  destructiveButtonTitle:destructiveTitle
                                  otherButtonTitles:nil];
    [actionSheet showInView:[[[UIApplication sharedApplication] delegate] window]];
	[task success:nil];
}
+ (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    [[[ForgeApp sharedApp] webView] setKeyboardDisplayRequiresUserAction:NO];
    
    if (buttonIndex == 0) {
        [[ForgeApp sharedApp] event:@"actionsheet.destructive" withParam:nil];
    } else if (buttonIndex == 1) {
        [[ForgeApp sharedApp] event:@"actionsheet.cancel" withParam:nil];
    }
}

@end
