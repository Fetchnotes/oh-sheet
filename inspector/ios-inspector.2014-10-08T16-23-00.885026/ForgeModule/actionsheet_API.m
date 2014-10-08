//
//  actionsheet_API.m
//  oh-sheet Forge/Trigger module
//
//  Created by Giles Van Gruisen
//  Copyright (c) 2013 Fetchnotes. All rights reserved.
//

#import "newActionSheet.h"
#import "actionsheet_API.h"

@implementation actionsheet_API

+ (void)show:(ForgeTask*)task text:(NSString *)text destructiveTitle:(NSString *)destructiveTitle cancelTitle:(NSString *)cancelTitle otherButtons:(NSDictionary *)otherButtons {
	newActionSheet *actionSheet = [newActionSheet alloc];
    
    
    actionSheet = [actionSheet initWithTitle:text
                                    delegate:self
                           cancelButtonTitle:nil
                      destructiveButtonTitle:nil
                           otherButtonTitles:nil];
    
    NSArray *otherButtonsKeys = [otherButtons allKeys];
    [actionSheet setActions:otherButtonsKeys];
    
    int max = 8;
    if ([destructiveTitle length] > 0) {
        max--;
    } else if ([cancelTitle length] > 0) {
        max--;
    }
    
    for (int i=0; i < [otherButtons count]; i++) {
        NSDictionary *button = [otherButtons objectForKey:[otherButtonsKeys objectAtIndex:i]];
        if ([button objectForKey:@"label"] != nil && [otherButtons count] < max) {
            [actionSheet addButtonWithTitle:@""];
            
            UIView *newView = [[UIView alloc] initWithFrame:CGRectMake(10,0,260,35)];
            newView.userInteractionEnabled = NO;
            
            UILabel *buttonLabel = [[UILabel alloc] initWithFrame:CGRectMake(0.0, 0.0, 65.0, 44.0)];
            buttonLabel.backgroundColor = [UIColor clearColor];
            buttonLabel.textColor = [UIColor darkGrayColor];
            buttonLabel.textAlignment = UITextAlignmentRight;
            buttonLabel.text = [button objectForKey:@"label"];
            buttonLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:16];
            
            UILabel *buttonText = [[UILabel alloc] initWithFrame:CGRectMake(75.0, 0.0, 185.0, 44.0)];
            buttonText.backgroundColor = [UIColor clearColor];
            buttonText.textColor = [UIColor blackColor];
            buttonText.textAlignment = NSTextAlignmentLeft;
            buttonText.text = [button objectForKey:@"text"];
            buttonText.font = [UIFont fontWithName:@"Helvetica-Bold" size:16];
            
            [newView addSubview:buttonLabel];
            [newView addSubview:buttonText];
            
            [[[actionSheet valueForKey:@"_buttons"] objectAtIndex:i] addSubview:newView];
        } else {
            if ([button objectForKey:@"label"] != nil) {
                [actionSheet addButtonWithTitle:[NSString stringWithFormat:@"%@  %@",[button objectForKey:@"label"],[button objectForKey:@"text"]]];
            } else {
                [actionSheet addButtonWithTitle:[button objectForKey:@"text"]];
            }
            
        }
    }
    if ([destructiveTitle length] > 0) {
        [actionSheet addButtonWithTitle:destructiveTitle];
        actionSheet.destructiveButtonIndex = actionSheet.numberOfButtons - 1;
    }
    if ([cancelTitle length] > 0) {
        [actionSheet addButtonWithTitle:cancelTitle];
        actionSheet.cancelButtonIndex = actionSheet.numberOfButtons - 1;
    }
    [actionSheet showInView:[[[UIApplication sharedApplication] delegate] window]];
	[task success:nil];
}

+ (void)actionSheet:(newActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    [[[ForgeApp sharedApp] webView] setKeyboardDisplayRequiresUserAction:NO];

    if (buttonIndex == [actionSheet destructiveButtonIndex]) {
        [[ForgeApp sharedApp] event:@"actionsheet.destructive" withParam:nil];
    } else if (buttonIndex == [actionSheet cancelButtonIndex]) {
        [[ForgeApp sharedApp] event:@"actionsheet.cancel" withParam:nil];
    } else {
        NSString *action = [[actionSheet actions] objectAtIndex:buttonIndex];
        [[ForgeApp sharedApp] event:[NSString stringWithFormat:@"actionsheet.%@",action] withParam:[NSString stringWithFormat:@"%d",buttonIndex]];
    }
}
@end
