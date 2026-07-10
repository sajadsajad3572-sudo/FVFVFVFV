//
//  JHCJDrawView.h
//  JHCJDraw
//
//  Created by 佚名 on 2021/1/7.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface JHCJDrawView : UIView


+ (instancetype)cjDrawView;
- (void)clear;
- (void)show;
- (void)hide;
- (void)configWithData:(NSArray *)rects hpData:(NSArray *)hpData disData:(NSArray *)disData;
+ (void)closeMenu;
+ (void)expand;
+ (void)feature1:(UISwitch *)SW1;
+ (void)feature2:(UISwitch *)SW2;
+ (void)feature3:(UISwitch *)SW3;
+ (void)feature4:(UISwitch *)SW4;
+ (void)buttonDragged:(UIButton *)button withEvent:(UIEvent *)event;
@end

NS_ASSUME_NONNULL_END
