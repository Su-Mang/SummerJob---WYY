//
//  Find.m
//  Wangyii MUsic
//
//  Created by 岳靖翔 on 2019/7/25.
//  Copyright © 2019 岳靖翔. All rights reserved.
//

#import "Find.h"

@interface Find ()
#define WIDRH self.view.frame.size.width
#define HEIGHT self.view.frame.size.height/2
{
    UIPageControl * pc;
    UIScrollView * sV;
    NSTimer* tm;
}
@end

@implementation Find

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIImage* image = [UIImage imageNamed:@"1.png"];
    UITabBarItem *tab1 = [[UITabBarItem alloc]initWithTitle:@"发现" image:image tag:1];
    tab1.badgeValue =@"99+";
    self.tabBarItem =tab1;
    sV = [[ UIScrollView alloc]initWithFrame:CGRectMake(0, 0, WIDRH, HEIGHT)];
    sV.backgroundColor= [UIColor whiteColor];
    [self.view addSubview:sV];
    for(int i = 0;i<6;i++)
    {
        
        UIImageView *imageview = [[UIImageView alloc]initWithFrame:CGRectMake( i*WIDRH, 30, WIDRH, HEIGHT)];
        NSString *imagename = [NSString stringWithFormat:@"a%d.jpg",i ];
        if(i==0)
        {
            imagename  = @"a4.jpg";
        }
        else if(i==5)
        {
            imagename = @"a1.jpg";
        }
        imageview.image = [UIImage imageNamed:imagename];
        [sV addSubview:imageview];
       
    }
    sV.contentSize = CGSizeMake(6*WIDRH, HEIGHT-20);
    sV.pagingEnabled = YES;
    pc = [[UIPageControl alloc]initWithFrame:CGRectMake(150, 300, 50, 50)];
// pc.backgroundColor = [UIColor redColor];
    pc.numberOfPages = 4;
    [self.view addSubview:pc];
    sV.delegate = self;
    [self creatt];
    
}
-(void)creatt
{
    tm = [NSTimer scheduledTimerWithTimeInterval:3.0 target:self selector:@selector(ran) userInfo:nil repeats:YES];
}
-(void)ran
{
    [sV setContentOffset:CGPointMake((pc.currentPage+2)*WIDRH, 0) animated:YES];
}

-(void)scrollViewDidBeginDragging:(UIScrollView *)scrollView
{
    
    [tm setFireDate:[NSDate distantFuture]];
}
-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView
     {
        
         [tm setFireDate:[NSDate distantPast]];
     }
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{   if(sV.contentOffset.x==0)
    {
        sV.contentOffset =CGPointMake(4*WIDRH, 0);
    }
    else if (sV.contentOffset.x == 5*WIDRH)
    {
        sV.contentOffset = CGPointMake(WIDRH, 0);
        
    } 
    pc.currentPage = sV.contentOffset.x/WIDRH-1;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
