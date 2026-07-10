#import "ESPView.h"
#import "ESP.h"


#define g 0.86602540378444
#define kWidth  [UIScreen mainScreen].bounds.size.width
#define kHeight [UIScreen mainScreen].bounds.size.height

@interface JHCJDrawView()
@property (nonatomic,  strong) UILabel *numberLabel;
@property (nonatomic,  strong) CAShapeLayer *drawLayer;
@property (nonatomic,  strong) CAShapeLayer *hpLayer;
@property (nonatomic,  strong) CAShapeLayer *wjLayer;

@property (nonatomic) CATextLayer * textLayer;
@property (nonatomic,  strong) NSArray *rects;
@property (nonatomic,  strong) NSArray *hpData;
@property (nonatomic,  strong) NSArray *disData;
@property (nonatomic,  weak) NSTimer *timer;
@end
static CATextLayer *tsLabel[100];
static CAShapeLayer *drawLayer[100];
NSMutableDictionary *newActions;
static UIBezierPath *Path[100];
CGRect rect ;
CGFloat xue;
CGFloat dis ;

BOOL kaiguan1 = YES;
BOOL kaiguan2 = YES;
BOOL kaiguan3 = YES;
BOOL kaiguan4 = YES;
UIButton *closeButton;
UIView *menuView;
UIButton *menuButton;

@implementation JHCJDrawView

#pragma mark -------------------------------------视图-------------------------------------------
//这里开始


+ (instancetype)cjDrawView
{
    return [[JHCJDrawView alloc] initWithFrame:[UIScreen mainScreen].bounds];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.userInteractionEnabled = NO;
        [self.layer addSublayer:self.drawLayer];
        [self.layer addSublayer:self.hpLayer];
        [self.layer addSublayer:self.wjLayer];
        [self addSubview:self.numberLabel];
        for(NSInteger i = 0; i < 100; i++){
            
            drawLayer[i] = [CAShapeLayer layer];
            drawLayer[i].frame = self.bounds;
            drawLayer[i].fillColor = [UIColor clearColor].CGColor;
            
            [self.layer addSublayer:drawLayer[i]];
        }
        
    }
    return self;
}

#pragma mark -------------------------------------事件-------------------------------------------

- (void)dealloc
{
    NSLog(@"--%s--", __func__);
}


- (void)clear{
    
    for (NSInteger i = 0; i < 100; i++) {
        
        
        
        tsLabel[i].string = @"";
        drawLayer[i].strokeColor =  [UIColor clearColor].CGColor;
        
    }
}

- (void)show
{
    self.hidden = NO;
    self.timer.fireDate = [NSDate distantPast];
}

- (void)hide
{
    self.hidden = YES;
    self.timer.fireDate = [NSDate distantFuture];
}

- (void)configWithData:(NSArray *)rects hpData:(NSArray *)hpData disData:(NSArray *)disData
{
    _rects = rects;
    _hpData = hpData;
    _disData = disData;
    if(kaiguan1==YES){
    _numberLabel.text =  [ NSString stringWithFormat:@"%d" ,(int)(_rects.count)];  //
    
}

    //@(_rects.count).stringValue;
    
    [self clear];
    [self drawAction];
}

//----------------------------------------------------------------------------------------------------------


//开始绘制
- (void)drawAction
{
    
    if(kaiguan1==NO) return;
    UIBezierPath *path = [UIBezierPath bezierPath];
    UIBezierPath *hpPath = [UIBezierPath bezierPath];
    UIBezierPath *wjPath = [UIBezierPath bezierPath];
    float wanjia =0;
    
    for (NSInteger i = 0; i < _rects.count; i++) {
        
        Path[i] = [UIBezierPath bezierPath];
        
        NSValue *val0  = _rects[i];
        NSNumber *val1 = _hpData[i];
        NSNumber *val2 = _disData[i];
        
        rect = [val0 CGRectValue];
        xue = [val1 floatValue];
        dis = [val2 floatValue];
        float xd = rect.origin.x+rect.size.width/2;//人物X坐标
        float yd = rect.origin.y;//人物Y坐标
//         CGFloat w = rect.size.width;
//         CGFloat h = rect.size.height;
//         CGFloat x = rect.origin.x;
//         CGFloat y = rect.origin.y;
        


        // 射线
        UIBezierPath *line = [UIBezierPath bezierPath];
        [line moveToPoint:CGPointMake(kWidth*0.5, 45)];
        [line addLineToPoint:CGPointMake(xd, yd-18)];
        [path appendPath:line];

if(kaiguan2==YES){
        //方框
        // 方框
        UIBezierPath *sub = [UIBezierPath bezierPathWithRect:rect];
        [path appendPath:sub];

}
 
if(kaiguan3==YES){
        
        // 血量
        CGRect hpRect = CGRectMake(xd-20, yd-18, xue*0.4,  3);
        UIBezierPath *hpBz = [UIBezierPath bezierPathWithRect:hpRect];
        [hpPath appendPath:hpBz];

}
        if(kaiguan4==YES){
            
        //玩家框+距离
        //玩家框+距离
        wanjia+=1;
        tsLabel[i] .string = [NSString stringWithFormat:@"[%d 米]",(int)dis];
        tsLabel[i] .position = CGPointMake(xd, yd);
        CGRect wjRect = CGRectMake(xd-0, yd-0, 0, 0);
        UIBezierPath *wjBz = [UIBezierPath bezierPathWithRect:wjRect];
        [wjPath appendPath:wjBz];
}
        
        
    }
    
    self.drawLayer.path = path.CGPath;
    self.hpLayer.path = hpPath.CGPath;
    self.wjLayer.path = wjPath.CGPath;
}

- (void)doTheJob
{
    NSLog(@"*** doTheJob");
    [[JHCJDrawDataFactory] 
fetchData:^(NSArray * _Nonnull data, NSArray * _Nonnull hpData, NSArray * _Nonnull disData) {
        [self configWithData:data hpData:hpData disData:disData];
    }];
}

#pragma mark -------------------------------------懒加载-----------------------------------------

//人数
- (UILabel *)numberLabel{
    if (!_numberLabel) {
        UILabel *label = [[UILabel alloc] init];
        label.frame = CGRectMake(kWidth/2-75, 20, 150, 40);
        label.text = @"Sakura";
     //   label.textColor = [UIColor colorWithRed: 0.86 green: 0.24 blue: 0.00 alpha: 1.00];
        label.textColor = [UIColor yellowColor];
        label.font = [UIFont boldSystemFontOfSize:20];
        label.shadowColor = [UIColor whiteColor];
        label.shadowOffset = CGSizeMake(0.5,1.1);
        label.textAlignment = 1;
        
        _numberLabel = label;
    }
    return _numberLabel;
}



//射线
- (CAShapeLayer *)disLayer{
    if (!_drawLayer) {
        CAShapeLayer *shapeLayer = [CAShapeLayer layer];
        shapeLayer.frame = self.bounds;
        shapeLayer.strokeColor = [UIColor colorWithRed:0.00 green:0.50 blue:0.10 alpha:1.00].CGColor;
        shapeLayer.fillColor = [UIColor clearColor].CGColor;
        _drawLayer = shapeLayer;
    }
    return _drawLayer;
}

//血量
- (CAShapeLayer *)hpLayer{
    if (!_hpLayer) {
        CAShapeLayer *shapeLayer = [CAShapeLayer layer];
        shapeLayer.frame = self.bounds;
        shapeLayer.strokeColor = [UIColor greenColor].CGColor;
        shapeLayer.fillColor = [UIColor greenColor].CGColor;
        _hpLayer = shapeLayer;
    }
    return _hpLayer;
}


- (CAShapeLayer *)drawLayer{
    if (!_drawLayer) {
        CAShapeLayer *shapeLayer = [CAShapeLayer layer];
        shapeLayer.frame = self.bounds;
        shapeLayer.strokeColor = [UIColor colorWithRed:0.99 green:0.80 blue:0.00 alpha:1.00].CGColor;
        shapeLayer.fillColor = [UIColor clearColor].CGColor;
        _drawLayer = shapeLayer;
    }
    return _drawLayer;
}

//玩家框
- (CAShapeLayer *)wjLayer{
    if (!_wjLayer) {
        CAShapeLayer *shapeLayer = [CAShapeLayer layer];
        shapeLayer.frame = self.bounds;
        shapeLayer.strokeColor = [UIColor colorWithRed: 0.99 green: 0.80 blue: 0.00 alpha: 1.00].CGColor;
        shapeLayer.fillColor = [UIColor clearColor].CGColor;
        _wjLayer = shapeLayer;
    }
    return _wjLayer;
}

- (NSTimer *)timer{
    if (!_timer) {
        _timer = [NSTimer scheduledTimerWithTimeInterval:0.01 repeats:YES block:^(NSTimer * _Nonnull timer) {
            [self doTheJob];
        }];
    }
    return _timer;
}


+ (void)expand {

  menuButton.hidden= YES;

    //新建菜单视图
    UIWindow*mainWindow;
    mainWindow = [UIApplication sharedApplication].keyWindow;
    menuView = [[UIView alloc] 
    initWithFrame:CGRectMake(kWidth/2-200,300, 300, 300)];
    menuView.backgroundColor=  [UIColor colorWithRed:0.50 green:0.50 blue:0.00 alpha:0.00];//菜单背景颜色
    menuView.layer.cornerRadius = 10;
    menuView.alpha=1;
    menuView.hidden=NO;
    [mainWindow addSubview:menuView];  
    //创建关闭菜单按钮
   closeButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    closeButton.frame = CGRectMake(100,0, 200, 240);
    [closeButton setTitle:@"❌" forState:UIControlStateNormal];
    [closeButton setTitleColor:[UIColor colorWithRed: 0.72 green: 0.00 blue: 0.00 alpha: 0.50] forState:UIControlStateNormal];
    [closeButton addTarget:self action:@selector(closeMenu) forControlEvents:UIControlEventTouchUpInside];
    closeButton.hidden = NO; 
    [menuView addSubview:closeButton];
 

       //定义储存多个数据
     NSUserDefaults*defaults = [NSUserDefaults standardUserDefaults];
    [defaults synchronize];

    //绘制
    UISwitch* SW1 = [[UISwitch alloc] initWithFrame:CGRectMake(10, 30, 20, 20)];
    SW1.thumbTintColor =[UIColor colorWithRed: 0.98 green: 0.82 blue: 0.76 alpha: 1.00];
    SW1.onTintColor = [UIColor colorWithRed: 0.83 green: 0.77 blue: 0.98 alpha: 1.00];
    SW1.tintColor = [UIColor clearColor];
  
    [SW1 addTarget:self action:@selector(feature1:)  forControlEvents:UIControlEventValueChanged];
    [menuView addSubview:SW1];
   //定义开关默认开启  
     BOOL sw1 = [defaults boolForKey:@"sw1"];
    if (sw1 == YES) { [SW1 setOn:YES];   } 
    else { [SW1 setOn:NO];     }
      UILabel* AL1 = [[UILabel alloc] initWithFrame:CGRectMake(80, 30, 60, 40)];
      [AL1 setText:@"绘制"];
      [AL1 setTextColor:[UIColor colorWithRed: 0.72 green: 0.00 blue: 0.00 alpha: 0.50]];
      [AL1 setBackgroundColor:[UIColor clearColor]];
       AL1.font = [UIFont systemFontOfSize:15];
      [menuView addSubview:AL1];
   
//射线
    UISwitch*SW2 = [[UISwitch alloc] initWithFrame:CGRectMake(10, 90, 20, 20)];
    SW2.thumbTintColor = [UIColor colorWithRed: 1.00 green: 0.95 blue: 0.74 alpha: 1.00];
    SW2.onTintColor = [UIColor colorWithRed: 0.83 green: 0.77 blue: 0.98 alpha: 1.00];
    SW2.tintColor = [UIColor clearColor];
    [SW2 addTarget:self action:@selector(feature2:)  forControlEvents:UIControlEventValueChanged];
    [menuView addSubview:SW2];
   //定义开关默认开启

     BOOL sw2 = [defaults boolForKey:@"sw2"];
    if (sw2 == YES) { [SW2 setOn:YES];   } 
    else { [SW2 setOn:NO];     }
      UILabel* AL2 = [[UILabel alloc] initWithFrame:CGRectMake(80, 90, 60, 40)];
      [AL2 setText:@"方框"];
      [AL2 setTextColor:[UIColor colorWithRed: 0.72 green: 0.00 blue: 0.00 alpha: 0.50]];
      [AL2 setBackgroundColor:[UIColor clearColor]];
       AL2.font = [UIFont systemFontOfSize:15];
      [menuView addSubview:AL2];


//方框
    UISwitch* SW3 = [[UISwitch alloc] initWithFrame:CGRectMake(10, 150, 20, 20)];
    SW3.thumbTintColor = [UIColor colorWithRed: 0.76 green: 0.88 blue: 0.77 alpha: 1.00];
    SW3.onTintColor = [UIColor colorWithRed: 0.83 green: 0.77 blue: 0.98 alpha: 1.00];
    SW3.tintColor = [UIColor clearColor];
    [SW3 addTarget:self action:@selector(feature3:)  forControlEvents:UIControlEventValueChanged];
    [menuView addSubview:SW3];
   //定义开关默认开启
   BOOL sw3 = [defaults boolForKey:@"sw3"];
    if (sw3 == YES) { [SW3 setOn:YES];   } 
    else { [SW3 setOn:NO];     }
      UILabel* AL3 = [[UILabel alloc] initWithFrame:CGRectMake(80, 150, 60, 40)];
      [AL3 setText:@"血量"];
      [AL3 setTextColor:[UIColor colorWithRed: 0.72 green: 0.00 blue: 0.00 alpha: 0.50]];
      [AL3 setBackgroundColor:[UIColor clearColor]];
       AL3.font = [UIFont systemFontOfSize:15];
      [menuView addSubview:AL3];


   
 //载具
    UISwitch* SW4 = [[UISwitch alloc] initWithFrame:CGRectMake(10, 210, 20, 20)];
    SW4.thumbTintColor = [UIColor colorWithRed: 0.33 green: 0.00 blue: 0.92 alpha: 1.00];
    SW4.onTintColor = [UIColor colorWithRed: 0.83 green: 0.77 blue: 0.98 alpha: 1.00];
    SW4.tintColor = [UIColor clearColor];
    [SW4 addTarget:self action:@selector(feature4:)  forControlEvents:UIControlEventValueChanged];
    [menuView addSubview:SW4];
   //定义开关默认开启
   BOOL sw4 = [defaults boolForKey:@"sw4"];
    if (sw4 == YES) { [SW4 setOn:YES];   } 
    else { [SW4 setOn:NO];     }
      UILabel* AL4 = [[UILabel alloc] initWithFrame:CGRectMake(80, 210, 60, 40)];
      [AL4 setText:@"距离"];
      [AL4 setTextColor:[UIColor colorWithRed: 0.72 green: 0.00 blue: 0.00 alpha: 0.50]];
      [AL4 setBackgroundColor:[UIColor clearColor]];
       AL4.font = [UIFont systemFontOfSize:15];
      [menuView addSubview:AL4];




}







//绘制
+ (void)feature1:(UISwitch *)SW1 {
    

    if ([SW1 isOn]) {
     kaiguan1 = YES;
 
   
//开启
 
    

  NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];

    [defaults setBool:YES forKey:@"sw1"];

    [defaults synchronize];


    } else {
kaiguan1 = NO;
//关闭

  NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];

    [defaults setBool:NO forKey:@"sw1"];

    [defaults synchronize];

}}


//方框
+ (void)feature2:(UISwitch *)SW2 {
 
    if ([SW2 isOn]) {
kaiguan2 = YES;
//开启

  NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];

    [defaults setBool:YES forKey:@"sw2"];

    [defaults synchronize];
  

    } else {
kaiguan2 = NO;
//关闭
 

  NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];

    [defaults setBool:NO forKey:@"sw2"];

    [defaults synchronize];
}}
//血量
+ (void)feature3:(UISwitch *)SW3 {
    
    if ([SW3 isOn]) {
kaiguan3 = YES;
//开启
 
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];

    [defaults setBool:YES forKey:@"sw3"];

    [defaults synchronize];

//填写功能代码
   

    

    } else {
kaiguan3 = NO;
//关闭
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];

    [defaults setBool:NO forKey:@"sw3"];

    [defaults synchronize];

 


}}

//距离
+ (void)feature4:(UISwitch *)SW4 {
    
    if ([SW4 isOn]) {
kaiguan4 = YES;
 
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];

    [defaults setBool:YES forKey:@"sw4"];

    [defaults synchronize];

//填写功能代码
   
 
    

    } else {
kaiguan4 = NO;
//关闭
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];

    [defaults setBool:NO forKey:@"sw4"];

    [defaults synchronize];

 


}}


//创建关闭菜单
+ (void)closeMenu {   menuButton.hidden= NO; menuView.hidden = YES; } 
+ (void)buttonDragged:(UIButton *)button withEvent:(UIEvent *)event {
    UITouch *touch = [[event touchesForView:button] anyObject];
    
    CGPoint previousLocation = [touch previousLocationInView:button];
    CGPoint location = [touch locationInView:button];
    CGFloat delta_x = location.x - previousLocation.x;
    CGFloat delta_y = location.y - previousLocation.y;
    
    button.center = CGPointMake(button.center.x + delta_x, button.center.y + delta_y);
}



@end
