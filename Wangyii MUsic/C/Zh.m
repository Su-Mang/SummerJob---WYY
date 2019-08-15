 //
//  Zh.m
//  Wangyii MUsic
//
//  Created by 岳靖翔 on 2019/7/25.
//  Copyright © 2019 岳靖翔. All rights reserved.
//

#import "Zh.h"
#import"ViewController1.h"
//#import "MytableCellTableViewCell.h"
@interface Zh ()<UITabBarDelegate,UITableViewDataSource>

{
    NSArray*  _dataArray;
    NSArray*  _dataarry;
    UISwitch *uiSwitch;
    UIButton *btt1;
}
@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, copy) NSArray *arr;
@end

@implementation Zh

- (void)viewDidLoad {
    [super viewDidLoad];
    btt1.backgroundColor = [UIColor redColor];
    // Do any additional setup after loading the view.
    UIImage* image = [UIImage imageNamed:@"5.png"];
    UITabBarItem *tab1 = [[UITabBarItem alloc]initWithTitle:@"账号" image:image tag:5];
     UIImage *image1 = [UIImage imageNamed:@"8.png"];
     UIImage *image2 = [UIImage imageNamed:@"9.png"];
    self.tabBarItem =tab1;
    
    UIBarButtonItem * next1 = [[UIBarButtonItem alloc]initWithImage:image2 style:UIBarButtonItemStyleDone target:self action:@selector(pressright)];
    next1.tintColor = [UIColor redColor];
    // self.hidesBottomBarWhenPushed = YES;
    UIBarButtonItem * next2 = [[UIBarButtonItem alloc]initWithImage:image1   style:UIBarButtonItemStyleDone target:self action:@selector(pressright)];
    next2.tintColor = [UIColor redColor];
    self.navigationItem.leftBarButtonItem =
    next2;
    self.navigationItem.rightBarButtonItem = next1;
   
    self.tabBarItem =tab1;
    UIScrollView * sV = [[ UIScrollView alloc]initWithFrame:CGRectMake(0, 0, 200, 80)];
    sV.contentSize= CGSizeMake(800, 100);
    
    //初始化数组
     _dataArray = @[@"",@"",@"我的订单",@"设置",@"夜间模式",@"定时关闭",@"音乐闹钟 ",@"翻唱",@"我收藏的歌单",@"",@"",@"",@"",@""];
    _dataarry =@[@"",@"",@"我的订单",@"设置",@"夜间模式",@"定时关闭",@"音乐闹钟 ",@"翻唱",@"我收藏的歌单"];
    //创建一个tableView
    /*
     UITableViewStylePlain,          // regular table view
     UITableViewStyleGrouped         // preferences style table view
     };
     */
    
  
    UITableView*  tableview = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain ];
   
    //设置代理和数据源
    tableview.delegate = self;
    tableview.dataSource = self;
    [self.view addSubview:tableview];
    tableview.backgroundColor = [UIColor whiteColor];
    
    tableview.estimatedRowHeight = 0;
    
    tableview.estimatedSectionHeaderHeight = 0;
    
    tableview.estimatedSectionFooterHeight = 0;
//    UIScrollView * SV = [[ UIScrollView alloc]initWithFrame:CGRectMake(0, 0, 200, 400)];
//    SV.contentSize= CGSizeMake(800, 500);
//     tableview.tableHeaderView = SV;
   // SV.backgroundColor = [UIColor whiteColor];
     uiSwitch = [[UISwitch alloc]init];
    [ uiSwitch addTarget:self action:@selector(Click:) forControlEvents:UIControlEventValueChanged];
    //[tableview reloadData];
    
    
}
-(void)Click:(UISwitch*)swi
{
    NSLog(@"%d",swi.on);
}
//-(void)pressleft
//{
//    ViewController1 * vc1 = [[ViewController1 alloc]init];
//    self. hidesBottomBarWhenPushed= YES;
//    [self.navigationController pushViewController:vc1 animated:NO];
//    self.hidesBottomBarWhenPushed = NO;
//}
-(void)pressright
{
    ViewController1 * vc1 = [[ViewController1 alloc]init];
    vc1.view.backgroundColor = [UIColor whiteColor];
    self. hidesBottomBarWhenPushed= YES;
    [self.navigationController pushViewController:vc1 animated:NO];
    UIBarButtonItem *btn1 = [[UIBarButtonItem alloc]initWithTitle:@"" style:UIBarButtonItemStyleDone target:self action:@selector(pressleft1)];
    UIImage *image1 = [UIImage imageNamed:@"return.png"];
    btn1.image =image1;
    vc1.navigationItem.leftBarButtonItem = btn1;
    self.hidesBottomBarWhenPushed = NO;
}
-(void)pressleft1
{
    [self.navigationController popViewControllerAnimated:YES];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

-(CGFloat)tableView:(UITableView*)tableView heightForRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    //获取分区
    if (indexPath.section==0&&indexPath.row==0) {
        return 400;
    }
    else if(indexPath.section==0)
    {
        return 60;
    }
    else{
        return 60;
    }
    
}
//设置分区的行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            return 1;
            break;
        case 1:
            return 2;
            break;
        default:
            return 4;
            break;
    }
}


-(UITableViewCell *)tableView:(UITableView *)tableView  cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell*cell = [[UITableViewCell alloc]init];
    cell.textLabel.text = _dataArray[indexPath.section*2+indexPath.row+1];
    if(indexPath.section!=0)
     cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    if (indexPath.section==1&&indexPath.row==1)
    {
   
        cell.accessoryView=uiSwitch;
    }
    if(indexPath.section==0)
    {
//        NSString *str =[ NSString stringWithFormat:@"acc%d.png",indexPath.row+1 ];
//        UIImage *image = [UIImage imageNamed:str];
//        UIImageView* ivew = [[UIImageView alloc]initWithImage:image];
//        cell.imageView.image= image;
    }
    else if(indexPath.row!=4&&indexPath.section!=2)
    {
        NSString *str1 =[ NSString stringWithFormat:@"acc%d.png",indexPath.row+1 ];
        UIImage *image1 = [UIImage imageNamed:str1];
        UIImageView* ivew1 = [[UIImageView alloc]initWithImage:image1];
        cell.imageView.image= image1;
        
    }
    
    if(indexPath.section==0&&indexPath.row==0)
    {
        UIImageView *img = [[UIImageView alloc]initWithFrame:CGRectMake(0, 10, 500, 90)];
        
          UIImageView *img2 = [[UIImageView alloc]initWithFrame:CGRectMake(20, 20, 50, 50)];
        img2.backgroundColor= [UIColor blueColor];
        UILabel *la = [[UILabel alloc]initWithFrame:CGRectMake(100, 0, 90, 70)];
        la.text = @"向景乐";
       // [la setFont:UIFontTextStyleTitle3];
        la.font = [UIFont systemFontOfSize:18];
        UILabel *la1 = [[UILabel alloc]initWithFrame:CGRectMake(100, 10, 100, 100)];
        la1.font = [UIFont boldSystemFontOfSize:15];
        la1.text = @"Lv1";
        btt1 = [UIButton buttonWithType:(UIButtonTypeRoundedRect)];
       btt1.frame=CGRectMake(289, 10, 100, 100);
     
        [btt1 setTitle:@"签到" forState:UIControlStateNormal];
//        [btt1 setTitle:@"yi签到" forState:UIControlEventTouchUpInside];
        [btt1 setTitleColor:([UIColor redColor]) forState:UIControlStateNormal];
        [btt1 setTitleColor:([UIColor clearColor]) forState:UIControlStateHighlighted];
        //[btt1 setBackgroundImage:<#(nullable UIImage *)#> forState:UIControlEventTouchUpInside]
        [btt1 addTarget:self action:@selector(p:) forControlEvents:UIControlEventTouchUpInside];        UIImage *image = [UIImage imageNamed:@"qiandao.png"];
        UIImage*  imgg2= [UIImage imageNamed:@"123.jpg"];
        [img2 setImage:imgg2];
//        //设置按钮背景图片
        [btt1 setImage:image forState:UIControlStateNormal];
//        [img addSubview:btt1];
//       // [la1 setFont:UIFontTextStyleSubheadline];
        [img addSubview:la];
        [img addSubview:la1];
        [img addSubview:img2];
        [cell.contentView addSubview: img];
        //img.backgroundColor = [UIColor redColor];
         UIImageView *img3 = [[UIImageView alloc]initWithFrame:CGRectMake(0,100 , 500, 90)];
        img3.backgroundColor = [UIColor redColor];
        UILabel *l1=[[UILabel alloc]initWithFrame:CGRectMake(10, 20, 50, 50)];
      
        UILabel *l2=[[UILabel alloc]initWithFrame:CGRectMake(110, 20, 50, 50)];
      
        UILabel *l3=[[UILabel alloc]initWithFrame:CGRectMake(210, 20, 50, 50)];
      
        UIButton *l4=[[UIButton alloc]initWithFrame:CGRectMake(310, 20, 50, 50)];
        
         UIImage*  imgg3= [UIImage imageNamed:@"qiandao-2.png"];
        [l4 setImage:imgg3 forState:UIControlStateNormal];
        //l1.backgroundColor = [UIColor blackColor];
            l1.text= @"  0";
         l2.text= @"   5";
         l3.text= @"   0";
        
        [img3 addSubview:l1];
         [img3 addSubview:l2];
        [img3 addSubview:l3];
         [img3 addSubview:l4];
        
      
         UILabel *ll1=[[UILabel alloc]initWithFrame:CGRectMake(10+4, 65, 30, 20)];
     
     UIImageView *lll1=[[UIImageView alloc]initWithFrame:CGRectMake(self.view.frame.size.width/4-20, 25, 10, 50)];
      
        
         UIImageView *lll2=[[UIImageView alloc]initWithFrame:CGRectMake(self.view.frame.size.width/4*3-20, 25, 10, 50)];
        
       UIImageView *lll3=[[UIImageView alloc]initWithFrame:CGRectMake(self.view.frame.size.width/2-20, 25, 10, 50)];
            UIImage*  imgg4= [UIImage imageNamed:@"-xiaoxuxian.png"];
        [lll1 setImage:imgg4];
         [lll2 setImage:imgg4];
         [lll3 setImage:imgg4];
     
     
        [img3 addSubview:lll1];
         [img3 addSubview:lll2];
         [img3 addSubview:lll3];
      
         UILabel *ll2=[[UILabel alloc]initWithFrame:CGRectMake(110+4, 60, 30, 20)];
         UILabel *ll3=[[UILabel alloc]initWithFrame:CGRectMake(210+4, 60, 30, 20)];
         UILabel *ll4=[[UILabel alloc]initWithFrame:CGRectMake(310+4, 60, 60, 20)];
        
        ll1.text=@"动态";
        ll2.text=@"关注";
        ll3.text=@"粉丝";
        ll4.text=@"编写资料";
        ll1.font = [UIFont systemFontOfSize:10];
        ll2.font = [UIFont systemFontOfSize:10];
        ll3.font = [UIFont systemFontOfSize:10];
         ll4.font = [UIFont systemFontOfSize:10];
        
        l1.backgroundColor = [UIColor whiteColor];
        img3.backgroundColor =  [UIColor whiteColor];
        [img3 addSubview:ll1];
        [img3 addSubview:ll2];
        [img3 addSubview:ll3];
        [img3 addSubview:ll4];
     
        [cell.contentView addSubview: img3];
         UIImageView *img5 = [[UIImageView alloc]initWithFrame:CGRectMake(0,200 , self.view.frame.size.width, 90)];
          UIImageView *img6 = [[UIImageView alloc]initWithFrame:CGRectMake(0,300 , self.view.frame.size.width, 90)];
         UIImage*  imgg5= [UIImage imageNamed:@"1111.png"];
         NSArray* _dataArray1 = @[@"消息",@"商城",@"演出",@"皮肤"];
        [img5 setImage:imgg5];
        for (int i=0; i<4; i++) {
            UIButton *bt = [[UIButton alloc]initWithFrame:CGRectMake(self.view.frame.size.width/4*i+10, 10, 60, 60)];
              NSString *str1 =[ NSString stringWithFormat:@"b%d.png",i+1];
              UIImage*  imgg6= [UIImage imageNamed:str1];
            
            [bt setImage:imgg6 forState:UIControlStateNormal];
            UILabel*l = [[UILabel alloc]initWithFrame:CGRectMake(self.view.frame.size.width/4*i+30, 60, 40, 30)];
            l.text= _dataArray1[i];
       l.font = [UIFont systemFontOfSize:10];
            [img6 addSubview:l];
            [img6 addSubview:bt];
        }
       // img6.backgroundColor = [UIColor redColor];
        [cell.contentView addSubview:img5];
        [cell.contentView addSubview:img6];
        [cell.contentView addSubview:btt1];
        
    }
    if(indexPath.section==2 && indexPath.row== 4)
    {
        UILabel*laa=  [[UILabel alloc]initWithFrame:CGRectMake(self.view.frame.size.width/2-30, 10, 80, 30)];
        laa.text=@"退出";
        
      //  laa.backgroundColor = [UIColor redColor];
        
        [cell.contentView addSubview:laa];
    
    }
    UIView *view = [[UIView alloc ]init];
    view.backgroundColor = [UIColor whiteColor];
    cell.selectedBackgroundView = view;
    if (indexPath.section==2&&indexPath.row>3) {
        self.navigationItem.title=@"账号";
    }else
    {
        self.navigationItem.title=@"";
    }
    
     
    return cell;
}
-(void)p:(UIButton *)btt1
{
   // btt1.titleLabel.text = @"122";
 [btt1 setTitle:@"已签到" forState:UIControlStateNormal];

}
-(CGFloat)tableView:(UITableView *)tableView heightForheaderInSection:(NSInteger)section
{
    if(section == 0) {
        return 0.01;
    } else {
        return 100;
    }
}

//获取尾部高度
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if(section==1)
    {
        return 0.01;
    }
    else{
        return 0;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return nil;

}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    return nil;
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
