//
//  KLProgressHUD.m
//  KLProgressHUD
//
//  Created by Logic on 2019/11/19.
//

#import "KLProgressHUD.h"
#import <MBProgressHUD/MBProgressHUD.h>

@implementation KLProgressHUD

+ (instancetype)share {
    static KLProgressHUD *hud;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        hud = [[self alloc] init];
    });
    return hud;
}

+ (void)showIndicator
{
    [self showIndicatorTo:nil];
}

+ (void)showIndicatorTo:(nullable UIView *)view
{
    if (view == nil) {
        view = UIApplication.sharedApplication.keyWindow;
    }
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    [self diyconfig:hud];
    hud.minSize = CGSizeMake(90, 90);
}

+ (void)showIndicator:(nullable UIColor *)color
{
    [self showIndicator:color to:nil];
}

+ (void)showIndicator:(nullable UIColor *)color to:(nullable UIView *)view
{
    if (view == nil) {
        view = UIApplication.sharedApplication.keyWindow;
    }
    [UIActivityIndicatorView appearanceWhenContainedInInstancesOfClasses:@[MBProgressHUD.class]]
    .color = color ? : UIColor.blackColor;
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    [self diyconfig:hud];
    hud.mode = MBProgressHUDModeIndeterminate;
    hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
    hud.bezelView.color = UIColor.clearColor;
    hud.minSize = CGSizeMake(90, 90);
}

+ (void)showIndicatorText:(NSString *)text
{
    [self showIndicatorText:text to:nil];
}

+ (void)showIndicatorText:(NSString *)text to:(nullable UIView *)view
{
    if (view == nil) {
        view = UIApplication.sharedApplication.keyWindow;
    }
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    [self diyconfig:hud];
    hud.mode = MBProgressHUDModeIndeterminate;
    hud.label.text = text;
    hud.minSize = CGSizeMake(90, 90);
}

+ (void)showText:(NSString *)text
{
    [self showText:text to:nil];
}

+ (void)showText:(NSString *)text delay:(NSTimeInterval)time
{
    [self showText:text delay:time to:nil];
}

+ (void)showText:(NSString *)text to:(nullable UIView *)view
{
    if (view == nil) {
        view = UIApplication.sharedApplication.keyWindow;
    }
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    [self diyconfig:hud];
    hud.mode = MBProgressHUDModeText;
    hud.label.text = text;
    [hud hideAnimated:YES afterDelay:1.5];
}

+ (void)showText:(NSString *)text delay:(NSTimeInterval)time to:(nullable UIView *)view
{
    if (view == nil) {
        view = UIApplication.sharedApplication.keyWindow;
    }
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    [self diyconfig:hud];
    hud.mode = MBProgressHUDModeText;
    hud.label.text = text;
    [hud hideAnimated:YES afterDelay:time];
}

+ (void)showBottomText:(NSString *)text
{
    [self showBottomText:text to:nil];
}

+ (void)showBottomText:(NSString *)text to:(nullable UIView *)view
{
    if (view == nil) {
        view = UIApplication.sharedApplication.keyWindow;
    }
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    [self diyconfig:hud];
    hud.mode = MBProgressHUDModeText;
    hud.label.text = text;
    hud.offset = CGPointMake(0, view.bounds.size.height * 0.4);
    [hud hideAnimated:YES afterDelay:1.5];
}

static MBProgressHUD *pgshub = nil;

+ (void)showProgress:(CGFloat)progress
{
    [self showProgress:progress with:nil to:nil];
}

+ (void)showProgress:(CGFloat)progress with:(UIColor *)color
{
    [self showProgress:progress with:nil color:color to:nil];
}

+ (void)showProgress:(CGFloat)progress with:(NSString *)text to:(UIView *)view
{
    [self showProgress:progress with:text color:nil to:view];
}

+ (void)showProgress:(CGFloat)progress with:(nullable NSString *)text color:(nullable UIColor *)color to:(nullable UIView *)view
{
    if (view == nil) {
        view = UIApplication.sharedApplication.keyWindow;
    }
    dispatch_async(dispatch_get_main_queue(), ^{
        if (pgshub == nil) {
            pgshub = [MBProgressHUD showHUDAddedTo:view animated:YES];
            [self diyconfig:pgshub];
            pgshub.mode = MBProgressHUDModeDeterminateHorizontalBar;
            pgshub.bezelView.layer.cornerRadius = 3;
            pgshub.bezelView.layer.masksToBounds = YES;
            pgshub.contentColor = color ? : UIColor.blackColor;
            if (text == nil) {
                pgshub.bezelView.backgroundColor = UIColor.clearColor;
            }
        }
        pgshub.label.text = text;
        pgshub.progress = progress;
    });
}

+ (void)showView:(UIView *)customView
{
    [self showView:customView to:nil];
}

+ (void)showView:(UIView *)customView to:(nullable UIView *)view
{
    [self showView:customView backgroundColor:UIColor.clearColor to:view];
}

+ (void)showView:(UIView *)customView backgroundColor:(UIColor *)color
{
    [self showView:customView backgroundColor:color to:nil];
}

+ (void)showView:(UIView *)customView backgroundColor:(UIColor *)color to:(nullable UIView *)view
{
    if (view == nil) {
        view = UIApplication.sharedApplication.keyWindow;
    }
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    [self diyconfig:hud];
    hud.mode = MBProgressHUDModeCustomView;
    hud.customView = customView;
    hud.minSize = CGSizeMake(90, 90);
    hud.bezelView.backgroundColor = color;
}

+ (void)showImage:(UIImage *)image
{
    [self showImage:image to:nil];
}

+ (void)showImage:(UIImage *)image to:(nullable UIView *)view {
    [self showImage:image backgroundColor:UIColor.clearColor to:view];
}

+ (void)showImage:(UIImage *)image backgroundColor:(UIColor *)color
{
    [self showImage:image backgroundColor:color to:nil];
}

+ (void)showImage:(UIImage *)image backgroundColor:(UIColor *)color to:(nullable UIView *)view
{
    UIImageView *customView = UIImageView.alloc.init;
    customView.image = image;
    customView.contentMode = UIViewContentModeCenter;
    customView.bounds = CGRectMake(0, 0, image.size.width, image.size.height);
    [self showView:customView backgroundColor:color to:view];
}

+ (void)showAnimationWithImageName:(NSString *)imageName
{
    [self showAnimationWithImageName:imageName to:nil];
}

+ (void)showAnimationWithImageName:(NSString *)imageName to:(nullable UIView *)view
{
    NSMutableArray <UIImage *> *temp = NSMutableArray.array;
    for (NSInteger i = 0; i <= NSIntegerMax; i ++) {
        NSString *name = [NSString stringWithFormat:@"%@%@@2x", imageName, @(i)];
        NSString *path = [NSBundle.mainBundle pathForResource:name ofType:@"png"];
        if (path == nil) {
            path = [NSBundle.mainBundle pathForResource:[name stringByReplacingOccurrencesOfString:@"@2x" withString:@""] ofType:@"png"];
        }
        UIImage *image = [UIImage imageWithContentsOfFile:path];
        if (image) {
            [temp addObject:image];
        } else {
            if (i > 2) { // 兼容命名 0 1 开始的图片
                break;
            }
        }
    }
    UIImageView *customView = UIImageView.alloc.init;
    customView.contentMode = UIViewContentModeCenter;
    customView.bounds = CGRectMake(0, 0, temp.lastObject.size.width, temp.lastObject.size.height);
    customView.animationImages = temp;
    customView.animationRepeatCount = 0;
    customView.animationDuration = 0.05 * temp.count;
    [customView startAnimating];
    [self showView:customView to:view];
}

+ (void)hide
{
    [self hideFrom:nil];
}

+ (void)hideFrom:(UIView *)view
{
    if (view == nil) {
        view = UIApplication.sharedApplication.keyWindow;
    }
    [MBProgressHUD hideHUDForView:view animated:YES];
    if (pgshub) {
        pgshub = nil;
    }
}

+ (void)diyconfig:(MBProgressHUD *)hud {
    hud.animationType = MBProgressHUDAnimationZoom;
    hud.label.font = KLProgressHUD.share.textFont ? : [UIFont boldSystemFontOfSize:15];
    hud.label.numberOfLines = 0;
    hud.margin = KLProgressHUD.share.margin ? : 10;
    hud.contentColor = KLProgressHUD.share.contentColor ? : UIColor.whiteColor;
    hud.bezelView.layer.cornerRadius = KLProgressHUD.share.cornerRadius ? : 3;
    hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
    hud.bezelView.backgroundColor = KLProgressHUD.share.backgroundColor ? : [UIColor.blackColor colorWithAlphaComponent:0.7];
    hud.removeFromSuperViewOnHide = YES;
}

@end
