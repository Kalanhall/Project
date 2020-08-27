//
//  KLProgressHUD.h
//  KLProgressHUD
//
//  Created by Logic on 2019/11/19.
//  采用自定义API，分类不便于后台依赖库修改

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface KLProgressHUD : NSObject

/** 文本字体*/
@property (strong, nonatomic) UIFont *textFont;
/** 内容颜色：文本，进度条等 默认白色*/
@property (strong, nonatomic) UIColor *contentColor;
/** 提示框背景色， 默认黑色0.7透明度*/
@property (strong, nonatomic) UIColor *backgroundColor;
/** 提示框内间距*/
@property (assign, nonatomic) CGFloat margin;
/** 提示框圆角*/
@property (assign, nonatomic) CGFloat cornerRadius;

/** 用于配置显示参数的单例*/
+ (instancetype)share;

// 菊花
+ (void)showIndicator;
+ (void)showIndicatorTo:(nullable UIView *)view;
// 透明背景菊花
+ (void)showIndicator:(nullable UIColor *)color;
+ (void)showIndicator:(nullable UIColor *)color to:(nullable UIView *)view;
// 文本 + 菊花
+ (void)showIndicatorText:(NSString *)text;
+ (void)showIndicatorText:(NSString *)text to:(nullable UIView *)view;
// 文本，不设置delay时，默认停留1.5s
+ (void)showText:(NSString *)text;
+ (void)showText:(NSString *)text delay:(NSTimeInterval)time;
+ (void)showText:(NSString *)text to:(nullable UIView *)view;
+ (void)showText:(NSString *)text delay:(NSTimeInterval)time to:(nullable UIView *)view;
+ (void)showBottomText:(NSString *)text;
+ (void)showBottomText:(NSString *)text to:(nullable UIView *)view;

// 进度条，全局仅支持单个展示，多个视图需要使用MBProgress提供的demo方法
+ (void)showProgress:(CGFloat)progress;
+ (void)showProgress:(CGFloat)progress with:(UIColor *)color;
+ (void)showProgress:(CGFloat)progress with:(nullable NSString *)text to:(nullable UIView *)view;
+ (void)showProgress:(CGFloat)progress with:(nullable NSString *)text color:(nullable UIColor *)color to:(nullable UIView *)view;

// 自定义视图
+ (void)showView:(UIView *)customView;
+ (void)showView:(UIView *)customView to:(nullable UIView *)view;
+ (void)showView:(UIView *)customView backgroundColor:(UIColor *)color;
+ (void)showView:(UIView *)customView backgroundColor:(UIColor *)color to:(nullable UIView *)view;
+ (void)showImage:(UIImage *)image;
+ (void)showImage:(UIImage *)image to:(nullable UIView *)view;
+ (void)showImage:(UIImage *)image backgroundColor:(UIColor *)color;
+ (void)showImage:(UIImage *)image backgroundColor:(UIColor *)color to:(nullable UIView *)view;

// 序列帧动画,仅支持png,命名格式 image0@2x~image10@2x, image0~image10
// imageName = @"image"
+ (void)showAnimationWithImageName:(NSString *)imageName;
+ (void)showAnimationWithImageName:(NSString *)imageName to:(nullable UIView *)view;

// 隐藏
+ (void)hide;
+ (void)hideFrom:(nullable UIView *)view;

@end

NS_ASSUME_NONNULL_END
