#import "InfoView.h"

@interface InfoView()

@end

@implementation InfoView

-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self) {
//        _disLb = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 10)];
//        _disLb.textAlignment=NSTextAlignmentCenter;
//        _disLb.textColor = [UIColor redColor];
//        //        _disLb.backgroundColor = [UIColor colorWithRed:0.99 green:0.38 blue:0.42 alpha:0.6];
//        _disLb.font = [UIFont boldSystemFontOfSize:7];
//        _disLb.backgroundColor = [UIColor clearColor];
//        [self addSubview:_disLb];
        
        UIView *infoBar = [[UIView alloc] initWithFrame:CGRectMake(0, 10, 50, 10)];
        infoBar.backgroundColor = [UIColor clearColor];
        infoBar.layer.cornerRadius=0;
        infoBar.layer.masksToBounds=YES;
        infoBar.layer.borderColor = [[UIColor colorWithRed:1 green:1 blue:1 alpha:0.4]CGColor];
        infoBar.layer.borderWidth=1;
        [self addSubview:infoBar];
        
        _xueBar = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 50, 10)];
        _xueBar.backgroundColor = [UIColor colorWithRed:0.99 green:0.38 blue:0.42 alpha:0.4];
        [infoBar addSubview:_xueBar];
        
        _teamLb = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 10, 10)];
        _teamLb.textAlignment=NSTextAlignmentCenter;
        _teamLb.textColor = [UIColor whiteColor];
        _teamLb.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.2];
        _teamLb.font = [UIFont boldSystemFontOfSize:4];
        [infoBar addSubview:_teamLb];
        
        _nameLb = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, 40, 10)];
        //        _nameLb.textAlignment=NSTextAlignmentCenter;
        _nameLb.textColor = [UIColor whiteColor];
        _nameLb.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.1];
        _nameLb.font = [UIFont boldSystemFontOfSize:4];
        [infoBar addSubview:_nameLb];
    }
    return self;
}
#pragma mark----实现类方法
+(instancetype)infoViewWithName:(NSString *)name
                           isAI:(Boolean *)isAI
                           team:(UInt8) team
                            xue:(CGFloat) xue
                            dis:(CGFloat) dis
                          point:(CGPoint) point;
{
    InfoView *infoView=[[InfoView alloc]initWithFrame:CGRectMake(0, 0, 50, 15)];
     infoView.backgroundColor=[UIColor clearColor];
    infoView.center=point;
//    infoView.layer.cornerRadius= 0;
    infoView.layer.masksToBounds=YES;
    infoView.dis=dis;
    infoView.team=team;
    infoView.name=name;
    return infoView;
}
#pragma mark--给属性重新赋值
-(void)setDis:(CGFloat)dis
{
    _disLb.text=[NSString stringWithFormat:@"[%3.1f米]",dis];
}

-(void)setName:(NSString *)name
{
    _nameLb.text=[NSString stringWithFormat:@" %@",name];
}

-(void)setTeam:(UInt8)team
{
    _teamLb.text=[NSString stringWithFormat:@"%d队",team];
}

-(void)setPoint:(CGPoint)point
{
    self.center=point;
}

-(void)setXue:(CGFloat)xue
{
    _xueBar.frame = CGRectMake(0, 0, xue, 10);
}

-(void)setAi:(Boolean)ai
{
    if(ai) {
        _xueBar.backgroundColor = [UIColor colorWithRed:0.07 green: 0.79 blue: 0.68 alpha:0.4];
    } else {
        _xueBar.backgroundColor = [UIColor colorWithRed:0.99 green:0.38 blue:0.42 alpha:0.4];
    }
}

@end
