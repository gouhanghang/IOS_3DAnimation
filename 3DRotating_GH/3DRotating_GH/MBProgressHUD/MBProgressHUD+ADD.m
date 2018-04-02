
#import "MBProgressHUD+ADD.h"

@implementation MBProgressHUD (ADD)

+ (MBProgressHUD *)showInformation:(NSString *)information toView:(UIView *)view andAfterDelay:(float)afterDelay{
    
    if (view == nil) view = [UIApplication sharedApplication].keyWindow;
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    ;
    
    hud.mode = MBProgressHUDModeText;
    
    hud.label.text = information;
    
    hud.label.numberOfLines = 0;
    
    hud.offset = CGPointMake(0.f, MBProgressMaxOffset);
    
    [hud hideAnimated:YES afterDelay:afterDelay];
    
    return hud;
    
    
}
+ (MBProgressHUD *)showInformationCenter:(NSString *)information toView:(UIView *)view andAfterDelay:(float)afterDelay{
    
    
    if (view == nil) view = [UIApplication sharedApplication].keyWindow;
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    ;
    
    hud.mode = MBProgressHUDModeText;
    
    hud.label.text = information;
    
    hud.label.numberOfLines = 0;
    
    hud.offset = CGPointMake(0.f, 0);
    
    [hud hideAnimated:YES afterDelay:afterDelay];
    
    return hud;
    
    
}

+ (void)showCustomview:(UIView *)customview andTextString:(NSString *)textString toView:(UIView *)view andAfterDelay:(float)afterDelay{
    
    if (view == nil) view = [UIApplication sharedApplication].keyWindow;
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    
    hud.mode = MBProgressHUDModeCustomView;
    
    hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
    
    hud.bezelView.color = [UIColor clearColor];
    
    hud.customView = customview;
    
    hud.square = YES;
    
    hud.label.text = textString;
    
    [hud hideAnimated:YES afterDelay:afterDelay];
    
}

@end
