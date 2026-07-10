#import <Foundation/Foundation.h>
#import "ESPPPP.h"
#import "ESP.h"
#import "CaptainHook.h"
#define kWidth  [UIScreen mainScreen].bounds.size.width
#define kHeight [UIScreen mainScreen].bounds.size.height
#define kScale [UIScreen mainScreen].scale
#define kTest   0
#define g 0.86602540378444


@interface ESPPPP()
@property (nonatomic,  strong) UILabel *numberLabel;
@property (nonatomic,  strong) CAShapeLayer *rsLayer;//人数
@property (nonatomic,  strong) CAShapeLayer *drawLayer;//射线
@property (nonatomic,  strong) CAShapeLayer *hpLayer;//血量
@property (nonatomic,  strong) CAShapeLayer *disLayer;//距离
@property (nonatomic,  strong) CAShapeLayer *wjLayer;//方框
@property (nonatomic,  strong) CAShapeLayer *ggLayer;//骨骼
@property (nonatomic,  strong) CAShapeLayer *mzLayer;//名字
@property (nonatomic,  strong) NSArray *rects;
@property (nonatomic,  strong) NSArray *hpData;
@property (nonatomic,  strong) NSArray *disData;
@property (nonatomic,  strong) NSArray *data1;
@property (nonatomic,  strong) NSArray *data2;
@property (nonatomic,  strong) NSArray *data3;
@property (nonatomic,  strong) NSArray *data4;
@property (nonatomic,  strong) NSArray *data5;
@property (nonatomic,  strong) NSArray *data6;
@property (nonatomic,  strong) NSArray *data7;
@property (nonatomic,  strong) NSArray *data8;
@property (nonatomic,  strong) NSArray *nameData;
@property (nonatomic,  weak) NSTimer *timer;
@property (nonatomic, copy) NSString *Name;
@end
static CATextLayer *mzLabel[100];//名字
static CATextLayer *disLabel[100];//距离
static CATextLayer *tsLabel[100];
static CAShapeLayer *drawLayer[100];
//static InfoView *infoView[100];
NSMutableDictionary *newActions;
static UIBezierPath *Path[100];
CGRect rect ;
CGFloat xue;
CGFloat dis ;
UIButton *closeButton;
UIView *menuView;



BOOL kaiguan1 = NO;
BOOL kaiguan2 = NO;
BOOL kaiguan3 = NO;
BOOL kaiguan4 = NO;
BOOL kaiguan5 = NO;
BOOL kaiguan6 = NO;
BOOL kaiguan7 = NO;


//UIButton *closeButton;
//UIView *menuView;
//UIButton *menuButton;
//UIButton *menuButton

@implementation ESPPPP
#pragma mark -------------------------------------视图-------------------------------------------

+ (void)load
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        ESPPPP *view = [ESPPPP Radar];
        [view Show];
        
        
        //人数按钮====================
        UISwitch*_swit1 = [[UISwitch alloc] initWithFrame:CGRectMake(10, 20, 20, 20)];
        _swit1.frame = CGRectMake(10, 20, 20, 20);
        _swit1.thumbTintColor = [UIColor colorWithRed:arc4random()%256/255.0 green:arc4random()%256/255.0 blue:arc4random()%256/255.0 alpha:1];
        _swit1.transform = CGAffineTransformMakeScale(0.75,0.75);
        [_swit1 addTarget:self action:@selector(ts1:) forControlEvents:UIControlEventValueChanged];
        [[[[UIApplication sharedApplication] windows]lastObject] addSubview:_swit1];
        //UILabel 人数
        UILabel* AL1 = [[UILabel alloc] initWithFrame:CGRectMake(20, -10, 60, 40)];
        [AL1 setText:@"人数"];
        [AL1 setTextColor:[UIColor redColor]];
        [AL1 setBackgroundColor:[UIColor clearColor]];
        AL1.font = [UIFont systemFontOfSize:9];
        [[[[UIApplication sharedApplication] windows]lastObject] addSubview:AL1];
        ESPPPP *view1 = [ESPPPP Radar];
        [view1 Show];
        [[[[UIApplication sharedApplication]windows]lastObject]addSubview:view1];
        
        
        
        //血条按钮====================
        UISwitch*_swit2 = [[UISwitch alloc] initWithFrame:CGRectMake(10, 70, 20, 20)];
        _swit2.frame = CGRectMake(10, 70, 20, 20);
        _swit2.thumbTintColor = [UIColor colorWithRed:arc4random()%256/255.0 green:arc4random()%256/255.0 blue:arc4random()%256/255.0 alpha:1];
        _swit2.transform = CGAffineTransformMakeScale(0.75,0.75);
        [_swit2 addTarget:self action:@selector(ts2:) forControlEvents:UIControlEventValueChanged];
        [[[[UIApplication sharedApplication] windows]lastObject] addSubview:_swit2];
        //血条
        UILabel* AL2 = [[UILabel alloc] initWithFrame:CGRectMake(20, 40, 60, 40)];
        [AL2 setText:@"血条"];
        [AL2 setTextColor:[UIColor redColor]];
        [AL2 setBackgroundColor:[UIColor clearColor]];
        AL2.font = [UIFont systemFontOfSize:9];
        [[[[UIApplication sharedApplication] windows]lastObject] addSubview:AL2];
        ESPPPP *view2 = [ESPPPP Radar];
        [view2 Show];
        [[[[UIApplication sharedApplication]windows]lastObject]addSubview:view2];
        
        
        //射线按钮====================
        UISwitch* _swit3 = [[UISwitch alloc] initWithFrame:CGRectMake(10, 120, 20, 20)];
        _swit3.frame = CGRectMake(10, 120, 20, 20);
        _swit3.thumbTintColor = [UIColor colorWithRed:arc4random()%256/255.0 green:arc4random()%256/255.0 blue:arc4random()%256/255.0 alpha:1];
        _swit3.transform = CGAffineTransformMakeScale(0.75,0.75);
        [_swit3 addTarget:self action:@selector(ts3:) forControlEvents:UIControlEventValueChanged];
        [[[[UIApplication sharedApplication] windows]lastObject] addSubview:_swit3];
        //射线
        UILabel* AL3 = [[UILabel alloc] initWithFrame:CGRectMake(20, 90, 60, 40)];
        [AL3 setText:@"射线"];
        [AL3 setTextColor:[UIColor redColor]];
        [AL3 setBackgroundColor:[UIColor clearColor]];
        AL3.font = [UIFont systemFontOfSize:9];
        [[[[UIApplication sharedApplication] windows]lastObject] addSubview:AL3];
        ESPPPP *view3 = [ESPPPP Radar];
        [view3 Show];
        [[[[UIApplication sharedApplication]windows]lastObject]addSubview:view3];
        
        
        //名字按钮====================
        UISwitch*_swit4 = [[UISwitch alloc] init];
        _swit4.frame = CGRectMake(10, 170, 20, 20);
        _swit4.thumbTintColor = [UIColor colorWithRed:arc4random()%256/255.0 green:arc4random()%256/255.0 blue:arc4random()%256/255.0 alpha:1];
        _swit4.transform = CGAffineTransformMakeScale(0.75,0.75);
        [_swit4 addTarget:self action:@selector(ts4:) forControlEvents:UIControlEventValueChanged];
        [[[[UIApplication sharedApplication] windows]lastObject] addSubview:_swit4];
        // 名字
        UILabel* AL4 = [[UILabel alloc] initWithFrame:CGRectMake(20, 140, 60, 40)];
        [AL4 setText:@"名字"];
        [AL4 setTextColor:[UIColor redColor]];
        [AL4 setBackgroundColor:[UIColor clearColor]];
        AL4.font = [UIFont systemFontOfSize:9];
        [[[[UIApplication sharedApplication] windows]lastObject] addSubview:AL4];
        ESPPPP *view4 = [ESPPPP Radar];
        [view4 Show];
        [[[[UIApplication sharedApplication]windows]lastObject]addSubview:view4];
        
        
        //方框按钮====================
       UISwitch*_swit5 = [[UISwitch alloc] init];
        _swit5.frame = CGRectMake(10, 220, 20, 20);
        _swit5.thumbTintColor = [UIColor colorWithRed:arc4random()%256/255.0 green:arc4random()%256/255.0 blue:arc4random()%256/255.0 alpha:1];
        _swit5.transform = CGAffineTransformMakeScale(0.75,0.75);
        [_swit5 addTarget:self action:@selector(ts5:) forControlEvents:UIControlEventValueChanged];
        [[[[UIApplication sharedApplication] windows]lastObject] addSubview:_swit5];
        //方框==
         UILabel* AL5 = [[UILabel alloc] initWithFrame:CGRectMake(20, 190, 60, 40)];
         [AL5 setText:@"方框"];
         [AL5 setTextColor:[UIColor redColor]];
         [AL5 setBackgroundColor:[UIColor clearColor]];
         AL5.font = [UIFont systemFontOfSize:9];
         [[[[UIApplication sharedApplication] windows]lastObject] addSubview:AL5];
         ESPPPP *view5 = [ESPPPP Radar];
         [view5 Show];
         [[[[UIApplication sharedApplication]windows]lastObject]addSubview:view5];
        
        
         //骨骼按钮====================
         UISwitch*_swit6 = [[UISwitch alloc] init];
         _swit6.frame = CGRectMake(10, 270, 20, 20);
         _swit6.thumbTintColor = [UIColor colorWithRed:arc4random()%256/255.0 green:arc4random()%256/255.0 blue:arc4random()%256/255.0 alpha:1];
         _swit6.transform = CGAffineTransformMakeScale(0.75,0.75);
         [_swit6 addTarget:self action:@selector(ts6:) forControlEvents:UIControlEventValueChanged];
         [[[[UIApplication sharedApplication] windows]lastObject] addSubview:_swit6];
         //距离
          UILabel* AL6 = [[UILabel alloc] initWithFrame:CGRectMake(20, 240, 60, 40)];
          [AL6 setText:@"骨骼"];
          [AL6 setTextColor:[UIColor redColor]];
          [AL6 setBackgroundColor:[UIColor clearColor]];
          AL6.font = [UIFont systemFontOfSize:9];
          [[[[UIApplication sharedApplication] windows]lastObject] addSubview:AL6];
          ESPPPP *view6 = [ESPPPP Radar];
          [view6 Show];
          [[[[UIApplication sharedApplication]windows]lastObject]addSubview:view6];
        
        
        //距离按钮====================
        UISwitch*_swit7 = [[UISwitch alloc] init];
        _swit7.frame = CGRectMake(10, 320, 20, 20);
        _swit7.thumbTintColor = [UIColor colorWithRed:arc4random()%256/255.0 green:arc4random()%256/255.0 blue:arc4random()%256/255.0 alpha:1];
        _swit7.transform = CGAffineTransformMakeScale(0.75,0.75);
        [_swit7 addTarget:self action:@selector(ts7:) forControlEvents:UIControlEventValueChanged];
        [[[[UIApplication sharedApplication] windows]lastObject] addSubview:_swit7];
        //距离
         UILabel* AL7 = [[UILabel alloc] initWithFrame:CGRectMake(20, 290, 60, 40)];
         [AL7 setText:@"距离"];
         [AL7 setTextColor:[UIColor redColor]];
         [AL7 setBackgroundColor:[UIColor clearColor]];
         AL7.font = [UIFont systemFontOfSize:9];
         [[[[UIApplication sharedApplication] windows]lastObject] addSubview:AL7];
         ESPPPP *view7 = [ESPPPP Radar];
         [view7 Show];
         [[[[UIApplication sharedApplication]windows]lastObject]addSubview:view7];
         
        
        
        for(NSInteger i = 0; i < 100; i++){
            newActions = [[NSMutableDictionary alloc] initWithObjectsAndKeys:[NSNull null], @"position", [NSNull null], @"bounds", nil]; tsLabel[i] = [CATextLayer layer];
            tsLabel[i].actions = newActions;
            tsLabel[i].string = @"";
            tsLabel[i].bounds = CGRectMake(0, 0, 160, 30);
            tsLabel[i].fontSize = 9;//字体的大小
            tsLabel[i].wrapped = YES;//默认为No.  当Yes时，字符串自动适应layer的bounds大小
            tsLabel[i].alignmentMode = kCAAlignmentCenter;//字体的对齐方式
            tsLabel[i].position = CGPointMake(-100, -100);//layer在view的位置 适用于跟随摸一个不固定长的的控件后面需要的
            tsLabel[i].contentsScale = [UIScreen mainScreen].scale;//解决文字模糊
            tsLabel[i].foregroundColor =[UIColor colorWithRed: 1 green: 1 blue: 0 alpha: 1].CGColor;//字体的颜色
            [[[[UIApplication sharedApplication] windows]lastObject].layer addSublayer:tsLabel[i]];
            
        }
        
    });
}
-(void)initTapGes
{
    UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc] init];
    tap1.numberOfTapsRequired = 2; // 点击次数
    tap1.numberOfTouchesRequired = 3; // 手指数
    [[[[UIApplication sharedApplication] windows] objectAtIndex:0].rootViewController.view addGestureRecognizer:tap1];
    [tap1 addTarget:self action:@selector(Hz)];
}


+ (void)ts1: (UISwitch*) zhuangtai1 {
    if(zhuangtai1.isOn) {
        kaiguan1 = YES;
    } else {
        kaiguan1 = NO;
    }
}
+ (void)ts2: (UISwitch*) zhuangtai2 {
    if(zhuangtai2.isOn) {
        kaiguan2 = YES;
    } else {
        kaiguan2 = NO;
    }
}
+ (void)ts3: (UISwitch*) zhuangtai3 {
    if(zhuangtai3.isOn) {
        kaiguan3 = YES;
    } else {
        kaiguan3 = NO;
    }
}
+ (void)ts4: (UISwitch*) zhuangtai4 {
    if(zhuangtai4.isOn) {
        kaiguan4 = YES;
    } else {
        kaiguan4 = NO;
    }
}
+ (void)ts5: (UISwitch*) zhuangtai5 {
    if(zhuangtai5.isOn) {
        kaiguan5 = YES;
    } else {
        kaiguan5 = NO;
    }
}
+ (void)ts6: (UISwitch*) zhuangtai6 {
    if(zhuangtai6.isOn) {
        kaiguan6 = YES;
    } else {
        kaiguan6 = NO;
    }
}
+ (void)ts7: (UISwitch*) zhuangtai7 {
    if(zhuangtai7.isOn) {
        kaiguan7 = YES;
    } else {
        kaiguan7 = NO;
    }
}
+ (instancetype)Radar
{
    return [[ESPPPP alloc] initWithFrame:[UIScreen mainScreen].bounds];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.userInteractionEnabled = NO;
        [self addSubview:self.numberLabel];
        [self.layer addSublayer:self.rsLayer];
        [self.layer addSublayer:self.hpLayer];
        [self.layer addSublayer:self.drawLayer];
        [self.layer addSublayer:self.mzLayer];
        [self.layer addSublayer:self.wjLayer];
        [self.layer addSublayer:self.ggLayer];
        [self.layer addSublayer:self.disLayer];
        
        
        
        for (NSInteger i = 0; i < 100; i++) {

      NSMutableDictionary*newActions = [[NSMutableDictionary alloc] initWithObjectsAndKeys:[NSNull null], @"position", [NSNull null], @"bounds", nil];

            //距离
            disLabel[i] = [CATextLayer layer];
            disLabel[i].actions = newActions;
            disLabel[i].string = @"NENO";
            disLabel[i].bounds = CGRectMake(0, 0, 300, 30);//160
            disLabel[i].fontSize = 9;//字体的大小
            disLabel[i].wrapped = YES;//默认为No.  当Yes时，字符串自动适应layer的bounds大小
            disLabel[i].alignmentMode = kCAAlignmentCenter;//字体的对齐方式
            
            disLabel[i].position = CGPointMake(-100, -100);//layer在view的位置 适用于跟随摸一个不固定长的的控件后面需要的
            disLabel[i].contentsScale = [UIScreen mainScreen].scale;//解决文字模糊
            [self.layer addSublayer:disLabel[i]];
            //名字
            mzLabel[i] = [CATextLayer layer];
            mzLabel[i].actions = newActions;
            mzLabel[i].string = @"NENO";
            mzLabel[i].bounds = CGRectMake(0, 0, 300, 30);//160
            mzLabel[i].fontSize = 9;//字体的大小
            mzLabel[i].wrapped = YES;//默认为No.  当Yes时，字符串自动适应layer的bounds大小
            mzLabel[i].alignmentMode = kCAAlignmentCenter;//字体的对齐方式
            mzLabel[i].foregroundColor =[UIColor whiteColor].CGColor;
//            mzLabel[i].backgroundColor =[UIColor yellowColor].CGColor;
            mzLabel[i].position = CGPointMake(-100, -100);//layer在view的位置 适用于跟随摸一个不固定长的的控件后面需要的
            mzLabel[i].contentsScale = [UIScreen mainScreen].scale;//解决文字模糊
            [self.layer addSublayer:mzLabel[i]];
}
    }
    return self;
}

#pragma mark -------------------------------------事件-------------------------------------------


- (void)cleee{
    for (NSInteger i = 0; i < 100; i++) {
        mzLabel[i].string = @"NENO";
        disLabel[i].string = @"NENO";
        
    }
}
- (void)Show
{
    self.hidden = NO;
    self.timer.fireDate = [NSDate distantPast];
}


- (void)Hide
{
    self.hidden = YES;
    self.timer.fireDate = [NSDate distantFuture];

}

- (void)conData:(NSArray *)rects hpData:(NSArray *)hpData disData:(NSArray *)disData nameData:(NSArray *)nameData data1:(NSArray *)data1  data2:(NSArray *)data2 data3:(NSArray *)data3 data4:(NSArray *)data4 data5:(NSArray *)data5 data6:(NSArray *)data6 data7:(NSArray *)data7 data8:(NSArray *)data8{
    
    _rects = rects;
    _hpData = hpData;
    _disData = disData;
    _nameData = nameData;
    _data1 =  data1;
    _data2 =  data2;
    _data3 =  data3;
    _data4 =  data4;
    _data5 =  data5;
    _data6 =  data6;
    _data7 =  data7;
    _data8 =  data8;
//   人数
    [self cleee];
    [self Hz];
  

}

- (void)Hz
{
    
 
    UIBezierPath *path = [UIBezierPath bezierPath];//射线
    UIBezierPath *hpPath = [UIBezierPath bezierPath];//血量
    UIBezierPath *disPath = [UIBezierPath bezierPath];//距离
    UIBezierPath *wjPath = [UIBezierPath bezierPath];//方框
    UIBezierPath *mzPath = [UIBezierPath bezierPath];//名字
    UIBezierPath *ggPath = [UIBezierPath bezierPath];//骨骼
    UIBezierPath *rsPath = [UIBezierPath bezierPath];//人数
    
  
    for (NSInteger i = 0; i < _rects.count; i++) {
        
        NSValue *val0  = _rects[i];
        NSNumber *val1 = _hpData[i];
        NSNumber *val2 = _disData[i];
        NSValue *d1  = _data1[i];
        NSValue *d2  = _data2[i];
        NSValue *d3  = _data3[i];
        NSValue *d4  = _data4[i];
        NSValue *d5  = _data5[i];
        NSValue *d6  = _data6[i];
        NSValue *d7  = _data7[i];
        NSValue *d8  = _data8[i];
           _Name = _nameData[i];
        
        
        CGRect rect = [val0 CGRectValue];
        CGFloat xue = [val1 floatValue];
        CGFloat dis = [val2 floatValue];
        CGRect rect1 = [d1 CGRectValue];
        CGRect rect2 = [d2 CGRectValue];
        CGRect rect3 = [d3 CGRectValue];
        CGRect rect4 = [d4 CGRectValue];
        CGRect rect5 = [d5 CGRectValue];
        CGRect rect6 = [d6 CGRectValue];
        CGRect rect7 = [d7 CGRectValue];
        CGRect rect8 = [d8 CGRectValue];
        
        
        
        CGFloat headx = rect1.origin.x/kScale;
        CGFloat heady = rect1.origin.y/kScale;
        CGFloat Spinex = rect1.size.width/kScale;
        CGFloat Spiney = rect1.size.height/kScale;
        CGFloat pelvisx = rect2.origin.x/kScale;
        CGFloat pelvisy = rect2.origin.y/kScale;
        CGFloat leftShoulderx = rect2.size.width/kScale;
        CGFloat leftShouldery = rect2.size.height/kScale;
        CGFloat leftElbowx = rect3.origin.x/kScale;
        CGFloat leftElbowy = rect3.origin.y/kScale;
        CGFloat leftHandx = rect3.size.width/kScale;
        CGFloat leftHandy = rect3.size.height/kScale;
        CGFloat rightShoulderx = rect4.origin.x/kScale;
        CGFloat rightShouldery = rect4.origin.y/kScale;
        CGFloat rightElbowx = rect4.size.width/kScale;
        CGFloat rightElbowy = rect4.size.height/kScale;
        CGFloat rightHandx = rect5.origin.x/kScale;
        CGFloat rightHandy = rect5.origin.y/kScale;
        CGFloat leftPelvisx = rect5.size.width/kScale;
        CGFloat leftPelvisy = rect5.size.height/kScale;
        CGFloat leftKneex = rect6.origin.x/kScale;
        CGFloat leftKneey = rect6.origin.y/kScale;
        CGFloat leftFootx = rect6.size.width/kScale;
        CGFloat leftFooty = rect6.size.height/kScale;
        CGFloat rightPelvisx = rect7.origin.x/kScale;
        CGFloat rightPelvisy = rect7.origin.y/kScale;
        CGFloat rightKneex = rect7.size.width/kScale;
        CGFloat rightKneey = rect7.size.height/kScale;
        CGFloat rightFootx = rect8.origin.x/kScale;
        CGFloat rightFooty = rect8.origin.y/kScale;
       
        
        float xd = rect.origin.x+rect.size.width/2;//人物X坐标
        float yd = rect.origin.y;//人物Y坐标
        
        CGFloat w = rect.size.width;
        CGFloat h = rect.size.height;
        CGFloat x = rect.origin.x;
        CGFloat y = rect.origin.y;
        //人数
        if(kaiguan1==YES){
              if ((int)(_rects.count)==0) {
                   _numberLabel.text =  [ NSString stringWithFormat:@"安全"];
              }
              _numberLabel.text =  [ NSString stringWithFormat:@"附近有%d个玩家" ,(int)(_rects.count)];
          }
        if(kaiguan1==NO){
              _numberLabel.text =  [ NSString stringWithFormat:@" "];
          }
        //血条
        if(kaiguan2==YES){
            //血条 xue数据成语0.8 就是血条
            UIBezierPath *hpBz = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(xd-40, yd-25, xue*0.8, 20) cornerRadius:5.0 ];
            [hpPath appendPath:hpBz];
            //血条背景 默认是80宽度 高度20
            UIBezierPath *hpBz2 = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(xd-40, yd-25, 80, 20) cornerRadius:5.0 ];
            [hpPath appendPath:hpBz2];
           
            
            
            
        }
        //射线
        if(kaiguan3==YES){
        UIBezierPath *line = [UIBezierPath bezierPath];
        [line moveToPoint:CGPointMake(kWidth*0.5, 52)];
        [line addLineToPoint:CGPointMake(headx, heady)];
        [path appendPath:line];
            if((int)dis>0&&(int)dis<=100 ){
                mzLabel[i].foregroundColor =[UIColor colorWithRed: 1.00 green: 0.30 blue: 255.00 alpha: 1.00].CGColor;
                
            }if((int)dis>100&&(int)dis<=150 )
            { mzLabel[i].foregroundColor =[UIColor colorWithRed: 0 green: 00 blue: 0.50 alpha: 1.00].CGColor;
            }
            if((int)dis>150&&(int)dis<=300 )
            { mzLabel[i].foregroundColor =[UIColor colorWithRed: 0.00 green: 0.90 blue: 0.00 alpha: 1.00].CGColor;}
            if((int)dis>300&&(int)dis<=400 )
            { mzLabel[i].foregroundColor =[UIColor colorWithRed: 0.00 green: 1.00 blue: 0.00 alpha: 1.00].CGColor;}
        }
        //名字
        if(kaiguan4==YES){
           
//            [path appendPath:[UIBezierPath bezierPathWithRoundedRect:CGRectMake(xd-40, yd-25, 80, 20) cornerRadius:5.0 ]];
            
            mzLabel[i] .position = CGPointMake(xd-5, yd-7);
            mzLabel[i] .string = [NSString stringWithFormat:@"%d: %@",(int)i+1,_Name];
            CGRect wjName = CGRectMake(xd-0, yd-0,0 , 0);
            UIBezierPath *wjmz = [UIBezierPath bezierPathWithRect:wjName ];
            [mzPath appendPath:wjmz];
            
            
            
        }
        //方框
        if(kaiguan5==YES){
            //这是完整的方框

//            UIBezierPath *line = [UIBezierPath bezierPath];
//            [line moveToPoint:CGPointMake(x, y)];
//            [line addLineToPoint:CGPointMake(x,y+h)];
//            [line addLineToPoint:CGPointMake(x+w,y+h)];
//            [line addLineToPoint:CGPointMake(x+w,y)];
//            [line addLineToPoint:CGPointMake(x, y)];
//            [path appendPath:line];
            //下面取消注释 就4个角
           
//            //左上角
            UIBezierPath *line1 = [UIBezierPath bezierPath];
            [line1 moveToPoint:CGPointMake(x, y)];
            [line1 addLineToPoint:CGPointMake(x-w/2,y)];
            [path appendPath:line1];
            UIBezierPath *line2 = [UIBezierPath bezierPath];
            [line2 moveToPoint:CGPointMake(x-w/2, y)];
            [line2 addLineToPoint:CGPointMake(x-w/2, y+h/4)];
            [path appendPath:line2];
            //右上角
            UIBezierPath *line3 = [UIBezierPath bezierPath];
            [line3 moveToPoint:CGPointMake(x+w*0.75, y)];
            [line3 addLineToPoint:CGPointMake(x+w*1.25, y)];
            [path appendPath:line3];
            UIBezierPath *line4 = [UIBezierPath bezierPath];
            [line4 moveToPoint:CGPointMake(x+w*1.25, y)];
            [line4 addLineToPoint:CGPointMake(x+w*1.25, y+h/4)];
            [path appendPath:line4];
            //左下角
            UIBezierPath *line5 = [UIBezierPath bezierPath];
            [line5 moveToPoint:CGPointMake(x, y+h+4)];
            [line5 addLineToPoint:CGPointMake(x-w/2,y+h+4)];
            [path appendPath:line5];
            UIBezierPath *line6 = [UIBezierPath bezierPath];
            [line6 moveToPoint:CGPointMake(x-w/2, y+h+4)];
            [line6 addLineToPoint:CGPointMake(x-w/2, y+(h+4)*0.75)];
            [path appendPath:line6];
            //右下角
            UIBezierPath *line7 = [UIBezierPath bezierPath];
            [line7 moveToPoint:CGPointMake(x+w*0.75, y+h+4)];
            [line7 addLineToPoint:CGPointMake(x+w*1.25, y+h+4)];
            [path appendPath:line7];
            UIBezierPath *line8 = [UIBezierPath bezierPath];
            [line8 moveToPoint:CGPointMake(x+w*1.25, y+h+4)];
            [line8 addLineToPoint:CGPointMake(x+w*1.25, y+(h+4)*0.75)];
            [path appendPath:line8];
            
        }
        //骨骼
        if(kaiguan6==YES){
          
            UIBezierPath *gg1 = [UIBezierPath bezierPath];
            [gg1 moveToPoint:CGPointMake(headx, heady)];
            [gg1 addLineToPoint:CGPointMake(Spinex, Spiney)];
            [path appendPath:gg1];
            
            UIBezierPath *gg2 = [UIBezierPath bezierPath];
            [gg2 moveToPoint:CGPointMake(Spinex, Spiney)];
            [gg2 addLineToPoint:CGPointMake(pelvisx, pelvisy)];
            [path appendPath:gg2];
            
            
            UIBezierPath *gg3 = [UIBezierPath bezierPath];
            [gg3 moveToPoint:CGPointMake(Spinex, Spiney)];
            [gg3 addLineToPoint:CGPointMake(leftShoulderx, leftShouldery)];
            [path appendPath:gg3];
            
            UIBezierPath *gg4 = [UIBezierPath bezierPath];
            [gg4 moveToPoint:CGPointMake(leftShoulderx, leftShouldery)];
            [gg4 addLineToPoint:CGPointMake(leftElbowx, leftElbowy)];
            [path appendPath:gg4];
            
            UIBezierPath *gg5 = [UIBezierPath bezierPath];
            [gg5 moveToPoint:CGPointMake(leftElbowx, leftElbowy)];
            [gg5 addLineToPoint:CGPointMake(leftHandx, leftHandy)];
            [path appendPath:gg5];
            
            UIBezierPath *gg6 = [UIBezierPath bezierPath];
            [gg6 moveToPoint:CGPointMake(Spinex, Spiney)];
            [gg6 addLineToPoint:CGPointMake(rightShoulderx, rightShouldery)];
            [path appendPath:gg6];
            
            UIBezierPath *gg7 = [UIBezierPath bezierPath];
            [gg7 moveToPoint:CGPointMake(rightShoulderx, rightShouldery)];
            [gg7 addLineToPoint:CGPointMake(rightElbowx, rightElbowy)];
            [path appendPath:gg7];
            
            UIBezierPath *gg8 = [UIBezierPath bezierPath];
            [gg8 moveToPoint:CGPointMake(rightElbowx, rightElbowy)];
            [gg8 addLineToPoint:CGPointMake(rightHandx, rightHandy)];
            [path appendPath:gg8];
            
            UIBezierPath *gg9 = [UIBezierPath bezierPath];
            [gg9 moveToPoint:CGPointMake(pelvisx, pelvisy)];
            [gg9 addLineToPoint:CGPointMake(leftPelvisx, leftPelvisy)];
            [path appendPath:gg9];
            
            UIBezierPath *gg10 = [UIBezierPath bezierPath];
            [gg10 moveToPoint:CGPointMake(leftPelvisx, leftPelvisy)];
            [gg10 addLineToPoint:CGPointMake(leftKneex, leftKneey)];
            [path appendPath:gg10];
            
            UIBezierPath *gg11 = [UIBezierPath bezierPath];
            [gg11 moveToPoint:CGPointMake(leftKneex, leftKneey)];
            [gg11 addLineToPoint:CGPointMake(leftFootx, leftFooty)];
            [path appendPath:gg11];
            
            UIBezierPath *gg12 = [UIBezierPath bezierPath];
            [gg12 moveToPoint:CGPointMake(pelvisx, pelvisy)];
            [gg12 addLineToPoint:CGPointMake(rightPelvisx, rightPelvisy)];
            [path appendPath:gg12];
            
            UIBezierPath *gg13 = [UIBezierPath bezierPath];
            [gg13 moveToPoint:CGPointMake(rightPelvisx, rightPelvisy)];
            [gg13 addLineToPoint:CGPointMake(rightKneex, rightKneey)];
            [path appendPath:gg13];
            
            UIBezierPath *gg14 = [UIBezierPath bezierPath];
            [gg14 moveToPoint:CGPointMake(rightKneex, rightKneey)];
            [gg14 addLineToPoint:CGPointMake(rightFootx, rightFooty)];
            [path appendPath:gg14];
            
            
        }
        //距离
        if(kaiguan7==YES){
            disLabel[i] .position = CGPointMake(xd-5, yd-27);
            disLabel[i] .string = [NSString stringWithFormat:@"[%d米]",(int)dis];
            CGRect wjdis = CGRectMake(xd-0, yd-20,0 , 0);
            UIBezierPath *wjjl = [UIBezierPath bezierPathWithRect:wjdis];
            [disPath appendPath:wjjl];
        }
        if(i==_rects.count){
            self.rsLayer.sublayers = nil;
            self.drawLayer.sublayers = nil;
            self.hpLayer.sublayers = nil;
            self.wjLayer.sublayers = nil;
            self.mzLayer.sublayers = nil;
            self.ggLayer.sublayers = nil;
            self.disLayer.sublayers = nil;
            [self.rsLayer removeFromSuperlayer];
            [self.drawLayer removeFromSuperlayer];
            [self.hpLayer removeFromSuperlayer];
            [self.wjLayer removeFromSuperlayer];
            [self.mzLayer removeFromSuperlayer];
            [self.ggLayer removeFromSuperlayer];
            [self.disLayer removeFromSuperlayer];
            self.rsLayer = nil;
            self.drawLayer = nil;
            self.hpLayer = nil;
            self.wjLayer = nil;
            self.mzLayer = nil;
            self.ggLayer = nil;
            self.disLayer = nil;
        }
    }
    self.rsLayer.path = rsPath.CGPath;//人数
    self.drawLayer.path = path.CGPath;//射线
    self.hpLayer.path = hpPath.CGPath;//血量
    self.wjLayer.path = wjPath.CGPath;//方框
    self.mzLayer.path = mzPath.CGPath;//名字
    self.ggLayer.path = ggPath.CGPath;//骨骼
    self.disLayer.path = disPath.CGPath;//距离
    
    
   
}//;

- (void)xunhuan
{
    //if (kaiguan==YES){
        [[ESPDDDD data] FaceDDDD:^(NSArray * _Nonnull data, NSArray * _Nonnull hpData, NSArray * _Nonnull disData,  NSArray * _Nonnull nameData,NSArray * _Nonnull data1, NSArray * _Nonnull data2, NSArray * _Nonnull data3, NSArray * _Nonnull data4, NSArray * _Nonnull data5, NSArray * _Nonnull data6, NSArray * _Nonnull data7, NSArray * _Nonnull data8) {
            [self conData:data hpData:hpData disData:disData nameData:nameData
             data1:data1 data2:data2 data3:data3 data4:data4 data5:data5 data6:data6 data7:data7 data8:data8];
        }];
    //}
}
+ (void)closeMenu {   closeButton.hidden= NO; menuView.hidden = YES; }
+ (void)buttonDragged:(UIButton *)button withEvent:(UIEvent *)event {
    UITouch *touch = [[event touchesForView:button] anyObject];
    
    CGPoint previousLocation = [touch previousLocationInView:button];
    CGPoint location = [touch locationInView:button];
    CGFloat delta_x = location.x - previousLocation.x;
    CGFloat delta_y = location.y - previousLocation.y;
    
    button.center = CGPointMake(button.center.x + delta_x, button.center.y + delta_y);
}
#pragma mark -------------------------------------懒加载-----------------------------------------
//人数
- (UILabel *)numberLabel{
    if (!_numberLabel) {
        UILabel *label = [[UILabel alloc] init];
        label.frame = CGRectMake(kWidth/2-75, 20, 150, 40);
        label.text = @"绘制开启";
        label.textColor = [UIColor yellowColor];//人数颜色
        label.font = [UIFont boldSystemFontOfSize:20];
        label.shadowColor = [UIColor whiteColor];

        label.shadowOffset = CGSizeMake(0.5,1.1);
        _numberLabel = label;
    }
    return _numberLabel;
}
//射线
- (CAShapeLayer *)drawLayer{
    if (!_drawLayer) {
        CAShapeLayer *shapeLayer = [CAShapeLayer layer];
        shapeLayer.frame = self.bounds;
        shapeLayer.strokeColor = [UIColor yellowColor].CGColor;//射线颜色
        shapeLayer.fillColor = [UIColor clearColor].CGColor;
        shapeLayer.fillColor = [UIColor colorWithRed: 1 green: 0 blue: 0 alpha: 0.50].CGColor;
        shapeLayer.lineWidth = 0.5;//射线宽度
        _drawLayer = shapeLayer;
    }
    return _drawLayer;
}
//血量
- (CAShapeLayer *)hpLayer{
    if (!_hpLayer) {
        CAShapeLayer *shapeLayer = [CAShapeLayer layer];
        shapeLayer.frame = self.bounds;
        shapeLayer.strokeColor = [UIColor greenColor].CGColor;//血量颜色
        shapeLayer.fillColor = [UIColor colorWithRed: 235/225 green: 81/225 blue: 12/225 alpha: 0.20].CGColor;
        shapeLayer.lineWidth = 0.1;//射线宽度
        _hpLayer = shapeLayer;
    }
    return _hpLayer;
}
//距离
- (CAShapeLayer *)disLayer{
    if (!_disLayer) {
        CAShapeLayer *shapeLayer = [CAShapeLayer layer];
        shapeLayer.frame = self.bounds;
        shapeLayer.strokeColor = [UIColor yellowColor].CGColor;//骨骼颜色
        shapeLayer.fillColor = [UIColor yellowColor].CGColor;
         shapeLayer.lineWidth = 0.5;
        _disLayer = shapeLayer;
    }
    return _disLayer;
}
//玩家框
- (CAShapeLayer *)wjLayer{
    if (!_wjLayer) {
        CAShapeLayer *shapeLayer = [CAShapeLayer layer];
        shapeLayer.frame = self.bounds;
        shapeLayer.strokeColor = [UIColor clearColor].CGColor;//方框颜色
//        shapeLayer.fillColor = [UIColor colorWithRed: 235/225 green: 81/225 blue: 12/225 alpha: 0.30].CGColor;//填充
        _wjLayer = shapeLayer;
    }
    return _wjLayer;
}
//玩家ID名字
- (CAShapeLayer *)mzLayer{
    if (!_mzLayer) {
        CAShapeLayer *shapeLayer = [CAShapeLayer layer];
        shapeLayer.frame = self.bounds;
        shapeLayer.strokeColor = [UIColor greenColor].CGColor;//
        shapeLayer.fillColor = [UIColor colorWithRed: 0.05 green: 0.00 blue: 1.00 alpha: 1].CGColor;
        _mzLayer = shapeLayer;
    }
    return _mzLayer;
}
- (CAShapeLayer *)ggLayer{
    if (!_ggLayer) {
        CAShapeLayer *shapeLayer = [CAShapeLayer layer];
        shapeLayer.frame = self.bounds;
        shapeLayer.strokeColor = [UIColor clearColor].CGColor;
         shapeLayer.fillColor = [UIColor colorWithRed: 0.05 green: 0.00 blue: 1.00 alpha: 1].CGColor;
        
        _ggLayer = shapeLayer;
    }
    return _ggLayer;
}


- (NSTimer *)timer{
    if (!_timer) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            _timer = [NSTimer scheduledTimerWithTimeInterval:0.05 repeats:YES block:^(NSTimer * _Nonnull timer) {
                [self xunhuan];
            }];
        });
    }
    return _timer;
}

@end
