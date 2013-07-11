//
//  alert_EventListener.m
//  ForgeInspector
//
//  Created by Connor Dunn on 09/10/2012.
//  Copyright (c) 2012 Trigger Corp. All rights reserved.
//

#import "actionsheet_EventListener.h"

@implementation actionsheet_EventListener

+ (void)applicationWillEnterForeground:(UIApplication *)application {
	[[ForgeApp sharedApp] event:@"actionsheet.resume" withParam:nil];
}

@end
