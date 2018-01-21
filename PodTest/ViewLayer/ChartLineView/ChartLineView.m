//
//  ChartLineView.m
//  PodTest
//
//  Created by 宁云峰 on 2018/1/16.
//  Copyright © 2018年 RT. All rights reserved.
//

#import "ChartLineView.h"

@interface ChartLineView(){
    
    CGFloat bounceX ;
    CGFloat bounceY ;
    NSInteger countq;
}
@property (nonatomic, strong) CAShapeLayer *lineChartLayer;
@property (nonatomic, strong)UIBezierPath * path1;
/** 渐变背景视图 */
@property (nonatomic, strong) UIView *gradientBackgroundView;
/** 渐变图层 */
@property (nonatomic, strong) CAGradientLayer *gradientLayer;
/** 颜色数组 */
@property (nonatomic, strong) NSMutableArray *gradientLayerColors;

@end

@implementation ChartLineView


-(instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    
    if (self) {
        bounceX = 20;
        bounceY = 20;
        countq = 0;
        [self createLabelX];
        [self createLabelY];
        [self drawGradientBackgroundView];
        [self setLineDash];
//        [self dravLine];
    }
    
    return self;
}

-(void)drawRect:(CGRect)rect{
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 2.0);
    CGContextSetRGBStrokeColor(context, 1, 0, 0, 1);
    CGContextMoveToPoint(context, 20, 20);
    CGContextAddLineToPoint(context, 20, rect.size.height - 20);
    CGContextAddLineToPoint(context, rect.size.width - 20, rect.size.height - 20);
    CGContextStrokePath(context);
}

#pragma mark 创建x轴的数据
- (void)createLabelX{
    CGFloat  month = 12;
    for (NSInteger i = 0; i < month; i++) {
        UILabel * LabelMonth = [[UILabel alloc]initWithFrame:CGRectMake((self.frame.size.width - 2*bounceX)/month * i + bounceX, self.frame.size.height - bounceY + bounceY*0.3, (self.frame.size.width - 2*bounceX)/month- 5, bounceY/2)];
        //       LabelMonth.backgroundColor = [UIColor greenColor];
        LabelMonth.tag = 1000 + i;
        LabelMonth.text = [NSString stringWithFormat:@"%ld月",i+1];
        LabelMonth.font = [UIFont systemFontOfSize:8];
        LabelMonth.transform = CGAffineTransformMakeRotation(M_PI * 0.3);
        [self addSubview:LabelMonth];
    }
    
}
#pragma mark 创建y轴数据
- (void)createLabelY{
    CGFloat Ydivision = 6;
    for (NSInteger i = 0; i < Ydivision; i++) {
        UILabel * labelYdivision = [[UILabel alloc]initWithFrame:CGRectMake(0, (self.frame.size.height - 2 * bounceY)/Ydivision *i + bounceX, bounceY, bounceY/2.0)];
        //   labelYdivision.backgroundColor = [UIColor greenColor];
        labelYdivision.tag = 2000 + i;
        labelYdivision.text = [NSString stringWithFormat:@"%.0f",(Ydivision - i)*100];
        labelYdivision.font = [UIFont systemFontOfSize:10];
        [self addSubview:labelYdivision];
    }
}

-(void)drawGradientBackgroundView{
   
    self.gradientBackgroundView = [[UIView alloc] initWithFrame:CGRectMake(bounceX, bounceY, self.bounds.size.width - bounceX*2, self.bounds.size.height - 2*bounceY)];
    [self addSubview:self.gradientBackgroundView];
    
    self.gradientLayer = [CAGradientLayer layer];
    self.gradientLayer.frame = self.gradientBackgroundView.bounds;
    self.gradientLayer.startPoint = CGPointMake(0.0, 0.0);
    self.gradientLayer.endPoint = CGPointMake(1.0, 0.0);
    //设置颜色的渐变过程
    self.gradientLayerColors = [NSMutableArray arrayWithArray:@[(__bridge id)[UIColor colorWithRed:253 / 255.0 green:164 / 255.0 blue:8 / 255.0 alpha:1.0].CGColor, (__bridge id)[UIColor colorWithRed:251 / 255.0 green:37 / 255.0 blue:45 / 255.0 alpha:1.0].CGColor]];
    self.gradientLayer.colors = self.gradientLayerColors;
    //将CAGradientlayer对象添加在我们要设置背景色的视图的layer层
    [self.gradientBackgroundView.layer addSublayer:self.gradientLayer];

    
}

-(void)setLineDash{
    
    for (int i = 0; i < 6; i++) {
        
        CAShapeLayer *dashLayer = [CAShapeLayer layer];
        dashLayer.strokeColor = [[UIColor whiteColor] CGColor];
        dashLayer.fillColor = [[UIColor clearColor] CGColor];
        dashLayer.lineWidth = 1.0;
        
        UIBezierPath * path = [[UIBezierPath alloc]init];
        path.lineWidth = 1.0;
        UIColor * color = [UIColor blueColor];
        [color set];
        UILabel * label = (UILabel *)[self viewWithTag:2000+i];
        [path moveToPoint:(CGPointMake(0, label.frame.origin.y - bounceY))];
        [path addLineToPoint:(CGPointMake(self.frame.size.width - 2*bounceX, label.frame.origin.y - bounceY))];
//        CGFloat dash[] = {3,1};
//        [path setLineDash:dash count:2 phase:10];
        [dashLayer setLineDashPattern:@[@8,@16]]; //画虚线 1.实线长2.虚线长
        [path stroke];
        dashLayer.path = path.CGPath;
        [self.gradientBackgroundView.layer addSublayer:dashLayer];
        
        
    }
}

-(void)dravLine{
    
    UILabel * label =(UILabel *)[self viewWithTag:1000];
    UIBezierPath * path = [[UIBezierPath alloc]init];
    path.lineWidth = 1.0;
    self.path1 = path;
    UIColor * color = [UIColor greenColor];
    [color set];
    [path moveToPoint:(CGPointMake(label.frame.origin.x - bounceX, (600 -arc4random()%600) /600.0 * (self.frame.size.height - bounceY*2 )))];
    //创建折现点标记
    for (NSInteger i = 1; i< 12; i++) {
        UILabel * label1 = (UILabel*)[self viewWithTag:1000 + i];
        CGFloat  arc = arc4random()%600;  //折线点目前给的是随机数
        [path addLineToPoint:CGPointMake(label1.frame.origin.x - bounceX,  (600 -arc) /600.0 * (self.frame.size.height - bounceY*2 ) )];
        
//        UIBezierPath * circlePath = [UIBezierPath bezierPathWithArcCenter:_center radius:_radius startAngle:startAngle endAngle:endAngle clockwise:YES];
        
        UILabel * falglabel = [[UILabel alloc]initWithFrame:CGRectMake(label1.frame.origin.x , (600 -arc) /600.0 * (self.frame.size.height - bounceY*2 )+ bounceY  , 30, 15)];
        //  falglabel.backgroundColor = [UIColor blueColor];
        falglabel.tag = 3000+ i;
        falglabel.text = [NSString stringWithFormat:@"%.1f",arc];
        falglabel.font = [UIFont systemFontOfSize:8.0];
        [self addSubview:falglabel];
    }
    // [path stroke];
    
    self.lineChartLayer = [CAShapeLayer layer];
    self.lineChartLayer.path = path.CGPath;
    self.lineChartLayer.strokeColor = [UIColor whiteColor].CGColor;
    self.lineChartLayer.fillColor = [[UIColor clearColor] CGColor];
    // 默认设置路径宽度为0，使其在起始状态下不显示
    self.lineChartLayer.lineWidth = 0;
    self.lineChartLayer.lineCap = kCALineCapRound;
    self.lineChartLayer.lineJoin = kCALineJoinRound;
    
    [self.gradientBackgroundView.layer addSublayer:self.lineChartLayer];//直接添加导视图上
    
//    UILabel * label_Y = (UILabel *)[self viewWithTag:2010];
//    UILabel * label_X = (UILabel *)[self viewWithTag:1006];
//
//    CAShapeLayer * layer = [CAShapeLayer layer];
//    [layer setFrame:(CGRectMake(label_Y.frame.origin.x, label_X.frame.origin.y, label_Y.frame.size.width, self.frame.size.height))];
//    [layer setBackgroundColor:[UIColor blackColor].CGColor];
//    [self.layer addSublayer:layer];
    
    UILabel * label_X = (UILabel *)[self viewWithTag:2000];
    UILabel * label_Y = (UILabel *)[self viewWithTag:1010];
    
    CAShapeLayer * layer = [CAShapeLayer layer];
    [layer setFrame:(CGRectMake(label_Y.frame.origin.x, label_X.frame.origin.y, label_Y.frame.size.width, label_Y.frame.origin.y-label_X.frame.origin.y))];
    [layer setBackgroundColor:[UIColor blueColor].CGColor];
    [self.layer addSublayer:layer];
    
    

}

#pragma mark 点击重新绘制折线和背景
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    countq++;
    if (countq%2 == 0) {
        //点一下删除折线 和转折点数据
        [self.lineChartLayer removeFromSuperlayer];
        for (NSInteger i = 0; i < 12; i++) {
            UILabel * label = (UILabel*)[self viewWithTag:3000 + i];
            [label removeFromSuperview];
        }
    }else{

        [self dravLine];

        self.lineChartLayer.lineWidth = 2;
        CABasicAnimation *pathAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
        pathAnimation.duration = 3;
        pathAnimation.repeatCount = 1;
        pathAnimation.removedOnCompletion = YES;
        pathAnimation.fromValue = [NSNumber numberWithFloat:0.0f];
        pathAnimation.toValue = [NSNumber numberWithFloat:1.0f];
        // 设置动画代理，动画结束时添加一个标签，显示折线终点的信息
        pathAnimation.delegate = self;
        [self.lineChartLayer addAnimation:pathAnimation forKey:@"strokeEnd"];
        //[self setNeedsDisplay];
    }
    


}


@end
