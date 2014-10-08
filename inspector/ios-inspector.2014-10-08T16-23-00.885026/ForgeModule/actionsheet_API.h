#import <Foundation/Foundation.h>

@interface actionsheet_API : NSObject <UIActionSheetDelegate>

+ (void)show:(ForgeTask*)task text:(NSString *)text destructiveTitle:(NSString *)destructiveTitle cancelTitle:(NSString *)cancelTitle otherButtons:(NSDictionary *)otherButtons;
+ (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex;

@end
