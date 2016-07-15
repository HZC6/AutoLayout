//
//  ViewController.m
//  AutoLayout
//
//  Created by mac1 on 16/7/15.
//  Copyright © 2016年 mac1. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //1 创建3个view
    [self createThreeViews];
    
}
#pragma mark - 创建3个view的方法
- (void)createThreeViews{
    
    //1 创建3个view的对象
    UIView *leftView = [[UIView alloc]init];
    UIView *rightView = [[UIView alloc]init];
    UIView *bottomView = [[UIView alloc]init];
    //2 设置背景颜色
    leftView.backgroundColor = [UIColor greenColor];
    rightView.backgroundColor = [UIColor purpleColor];
    bottomView.backgroundColor = [UIColor orangeColor];
    //3 添加视图上显示
    [self.view addSubview:leftView];
    [self.view addSubview:rightView];
    [self.view addSubview:bottomView];
    //4 关闭系统的自定义布局
    leftView.translatesAutoresizingMaskIntoConstraints = NO;
    rightView.translatesAutoresizingMaskIntoConstraints = NO;
    bottomView.translatesAutoresizingMaskIntoConstraints = NO;
    
    
    //-----------------自动布局方法1 ----------------
    /**
     [NSLayoutConstraint constraintWithItem:(id)item
     attribute:(NSLayoutAttribute)attribute
     relatedBy:(NSLayoutRelation)relation
     toItem:(id)otherItem
     attribute:(NSLayoutAttribute)otherAttribute
     multiplier:(CGFloat)multiplier
     constant:(CGFloat)constant]
     
     1.参数说明:
     第一个参数:指定约束左边的视图view1
     第二个参数:指定view1的属性attr1
     第三个参数:指定左右两边的视图的关系relation
     第四个参数:指定约束右边的视图view2
     第五个参数:指定view2的属性attr2
     第六个参数:指定一个与view2属性相乘的乘数multiplier
     第七个参数:指定一个与view2属性相加的浮点数constant
     
     
     2.NSLayoutAttribute的类型：
     NSLayoutAttributeLeft 视图的左边
     NSLayoutAttributeRight 视图的右边
     NSLayoutAttributeTop 视图的上边
     NSLayoutAttributeBottom 视图的下边
     NSLayoutAttributeLeading 视图的前边
     NSLayoutAttributeTrailing 视图的后边
     NSLayoutAttributeWidth 视图的宽度
     NSLayoutAttributeHeight 视图的高度
     NSLayoutAttributeCenterX 视图的中点的X值
     NSLayoutAttributeCenterY 视图中点的Y值
     NSLayoutAttributeBaseline 视图的基准线
     NSLayoutAttributeNotAnAttribute 无属性
     
     3.NSLayoutRelation的类型：
     NSLayoutRelationLessThanOrEqual 视图关系小于或等于
     NSLayoutRelationEqual       视图关系等于
     NSLayoutRelationGreaterThanOrEqual      视图关系大于或等于
     
     
     
     **/
    //leftView的上 = self.view的上+20
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:leftView
                                                          attribute:NSLayoutAttributeTop
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeTop
                                                         multiplier:1.
                                                           constant:20]];
    // leftView的左 = self.view的左 + 20
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:leftView
                                                          attribute:NSLayoutAttributeLeft
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeLeft
                                                         multiplier:1.
                                                           constant:20]];
    
    
    // rightView的上 = leftView的上
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:rightView
                                                          attribute:NSLayoutAttributeTop
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:leftView
                                                          attribute:NSLayoutAttributeTop
                                                         multiplier:1.
                                                           constant:0]];
    
    // rightView的左 = leftView的右 + 20
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:rightView
                                                          attribute:NSLayoutAttributeLeft
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:leftView
                                                          attribute:NSLayoutAttributeRight
                                                         multiplier:1.
                                                           constant:20]];
    
    // rightView的右 = self.view的右 - 20
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:rightView
                                                          attribute:NSLayoutAttributeRight
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeRight
                                                         multiplier:1.
                                                           constant:-20]];
    
    // rightView的高 = leftView的高
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:rightView
                                                          attribute:NSLayoutAttributeHeight
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:leftView
                                                          attribute:NSLayoutAttributeHeight
                                                         multiplier:1.
                                                           constant:0]];
    
    // rightView的宽 = leftView的宽
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:rightView
                                                          attribute:NSLayoutAttributeWidth
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:leftView
                                                          attribute:NSLayoutAttributeWidth
                                                         multiplier:1.0
                                                           constant:0]];
    //bottomView的左 = self.view的左 + 20
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:bottomView
                                                          attribute:NSLayoutAttributeLeft
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeLeft
                                                         multiplier:1
                                                           constant:20]];
    //bottomView的右 = self.view的右 - 20
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:bottomView
                                                          attribute:NSLayoutAttributeRight
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeRight
                                                         multiplier:1
                                                           constant:-20]];
    //bottomView的上 = leftView的下 + 20
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:bottomView
                                                          attribute:NSLayoutAttributeTop
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:leftView
                                                          attribute:NSLayoutAttributeBottom
                                                         multiplier:1
                                                           constant:20]];
    //bottomView的高 = leftView的高
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:bottomView
                                                          attribute:NSLayoutAttributeHeight
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:leftView
                                                          attribute:NSLayoutAttributeHeight
                                                         multiplier:1
                                                           constant:0]];
    //bottomView的下 = self.view的下 + 20
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:bottomView
                                                          attribute:NSLayoutAttributeBottom
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeBottom
                                                         multiplier:1
                                                           constant:-20]];
    
    //-----------------自动布局方法2 ----------------
    /*
     * 1. 自动布局使用可视化语言:VFL(Visual Format Language)
     
     2. 自动布局的相关参数
     NSArray *constrArray = [NSLayoutConstraint constraintsWithVisualFormat:@"string类型"
     options:
     metrics:
     views:]；
     3. 解释：
     a) 第一个参数：使用VFL格式化的字符串，可以参见官方的帮助文档；
     b) 第二个参数：指定VFL中所有对象的布局属性和方向。举例：有2个视图使用VFL进行布局，可以使用NSLayoutFormatAlignAllLeft，就让两个视图左对齐；
     c) 第三个参数：度量或者指标的字典，字典里面有相关的键值对来控制相关的度量指标，通过key获取；
     d) 第四个参数：指定约束的视图：一个或多个。
     
     4. VFL语言的规则
     a) "H" 表示水平方向，"V"表示垂直方向；
     b) "|" 表示superview的边界；
     c) "[]" 表示view，"()"表示尺寸，它们可以多个条件组合，中间使用逗号分隔，举例：[view(>=70, <=100)];
     d) "-" 表示间隙；
     e) "@"表示优先级。举例：V:|-50@750-[view(55)]
     
     */
    
    /**
     //创建VFL约束字符串
     NSString *hVFL = @"H:|-space-[leftView(==rightView)]-space1-[rightView]-space-|";
     NSString *hVFL1 = @"H:|-space-[bottomView]-space-|";
     NSString *vVFL = @"V:|-space-[leftView(==bottomView)]-space-[bottomView]-space-|";
     NSString *vVFL1 = @"V:|-space-[rightView(==bottomView)]-space-[bottomView]-space-|";
     //创建键值映射
     NSDictionary *metircs = @{@"space":@20,@"space1":@30};
     NSDictionary *views = NSDictionaryOfVariableBindings(leftView,rightView,bottomView);
     //创建约束
     NSArray *hconstraint = [NSLayoutConstraint constraintsWithVisualFormat:hVFL options:NSLayoutFormatDirectionLeadingToTrailing metrics:metircs views:views];
     NSArray *hconstraint1 = [NSLayoutConstraint constraintsWithVisualFormat:hVFL1 options:NSLayoutFormatDirectionLeadingToTrailing metrics:metircs views:views];
     NSArray *vconstraint = [NSLayoutConstraint constraintsWithVisualFormat:vVFL options:NSLayoutFormatDirectionLeadingToTrailing metrics:metircs views:views];
     NSArray *vconstraint1 = [NSLayoutConstraint constraintsWithVisualFormat:vVFL1 options:NSLayoutFormatDirectionLeadingToTrailing metrics:metircs views:views];
     //添加约束
     [self.view addConstraints:hconstraint];
     [self.view addConstraints:hconstraint1];
     [self.view addConstraints:vconstraint];
     [self.view addConstraints:vconstraint1];
     **/
    
}


@end
