//
//  MY.m
//  Wangyii MUsic
//
//  Created by 岳靖翔 on 2019/7/25.
//  Copyright © 2019 岳靖翔. All rights reserved.
//

#import "MY.h"
#import "ViewController1.h"
#import "AppDelegate.h"
@interface MY ()<UITableViewDelegate,UITableViewDataSource>
{
    UIButton *b1;
    int tag;
  NSArray* _dataArray;
  NSArray* _dataArray2;
}
@end

@implementation MY

- (void)viewDidLoad {
    [super viewDidLoad];
//    // Do any additional setup after loading the view.
//    UILabel *lable = [[UILabel alloc]initWithFrame:CGRectMake(170, 50, 100, 20)];
//    lable.text = @"我的音乐";
//  lable.font = [UIFont boldSystemFontOfSize:20];
//    UIButton*button = [[UIButton alloc]initWithFrame:CGRectMake(30, 40, 39, 39)];
   UIImage *image1 = [UIImage imageNamed:@"6.png"];
//    UIButton*button1 = [[UIButton alloc]initWithFrame:CGRectMake(350, 40, 39, 39)];
   UIImage *image2 = [UIImage imageNamed:@"7.png"];
//
//    [self.view addSubview:button];
//     [self.view addSubview:button1];
//    self.view.backgroundColor = [UIColor blackColor];
//    self.navigationController.navigationBar.barStyle= UIBarStyleBlackTranslucent;
//    //设置按钮背景图片
//    [button setBackgroundImage:image1 forState:UIControlStateNormal];
//     [button1 setBackgroundImage:image2 forState:UIControlStateNormal];
//    lable.backgroundColor=[UIColor whiteColor];
//    lable.tintColor= [UIColor blackColor];
//    [self.view addSubview:lable];
    //lable.alignmentRectInsets =
    self.navigationItem.title =@"我的音乐";
    UIBarButtonItem * next1 = [[UIBarButtonItem alloc]initWithImage:image1 style:UIBarButtonItemStyleDone target:self action:@selector(pressright)];
    next1.tintColor = [UIColor redColor];
  
    self.navigationItem.leftBarButtonItem = next1;
    UIBarButtonItem * next2 = [[UIBarButtonItem alloc]initWithImage:image2 style:UIBarButtonItemStyleDone target:self action:@selector(pressright)];
      next2.tintColor = [UIColor redColor]; 
    self.navigationItem.rightBarButtonItem = next2;
  //  [self.view addSubview:nav];
    UIImage* image = [UIImage imageNamed:@"3.png"];
    UITabBarItem *tab1 = [[UITabBarItem alloc]initWithTitle:@"我的" image:image tag:3];
    UIView*view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 500, 50)];
    view.backgroundColor= [UIColor whiteColor];
    
    
    self.tabBarItem =tab1;
    //初始化数组
    _dataArray = @[@"",@"本地音乐",@"最近播放",@"我的电台",@"我的收藏",@"我创建的歌单",@"我喜欢的音乐",@"翻唱",@"我收藏的歌单",@"",@"",@""];
    _dataArray2 = @[@"",@"",@"",@"",@"",@"29首",@"从你的全世界路过",@"",@"你好,明天",@"",@"",@"",@"",@""];
        //创建一个tableView
        /*
         UITableViewStylePlain,          // regular table view
         UITableViewStyleGrouped         // preferences style table view
         };
         */
        UITableView*  tableview = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped ];
        //设置代理和数据源
        tableview.delegate = self;
        tableview.dataSource = self;
        [self.view addSubview:tableview];
    
    tableview.estimatedRowHeight = 0;

    tableview.estimatedSectionHeaderHeight = 0;

    tableview.estimatedSectionFooterHeight = 0;
    NSArray* _dataArray1 ;
    _dataArray1 = @[@"私人FM",@"最新电音",@"Satic空间",@"私密推荐",@"亲子频道",@"古城专区",@"跑步FM",@"小冰电台",@"爵士电台",@"驾驶模式",@"因乐交友"];
    
    UIScrollView * sV = [[ UIScrollView alloc]initWithFrame:CGRectMake(0, 0, 200, 80)];
    sV.contentSize= CGSizeMake(900, 80);
    for(int i =0;i<11;i++)
    {
        NSString *str =[ NSString stringWithFormat:@"sv%d.png",i+1];
        UIImage *image = [UIImage imageNamed:str];
        UIButton *btn = [[UIButton alloc]init];
        btn.frame= CGRectMake(30+i*85, 0, 80, 80);
        [btn setImage:image forState:UIControlStateNormal];
   // btn.titleLabel.text = _dataArray1[i];
        UILabel *lable = [[UILabel alloc]initWithFrame:CGRectMake(30+i*85+5, 30, 80, 80)];
    
        lable.text=_dataArray1[i];
        [sV addSubview:lable];
        [sV addSubview:btn];

    }
    sV.backgroundColor = [UIColor whiteColor];
    tableview.tableHeaderView = sV;
    tableview.backgroundColor = [UIColor whiteColor];
    [tableview setSeparatorColor:[UIColor whiteColor]];
    tableview.sectionIndexTrackingBackgroundColor
    =[UIColor grayColor];
   // [view addSubview:b1];
    b1 = [[UIButton alloc]init];
    b1.backgroundColor = [UIColor redColor];
    [b1 addTarget:self action:@selector(playc) forControlEvents:UIControlEventValueChanged];
    tag = 0;
    
}
-(void)playc
{
    if(tag==0)
        tag=1;
    else
        tag=0;
}
//设置分区
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
    
}
//设置行高

-(CGFloat)tableView:(UITableView*)tableView heightForRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    //获取分区
    if (indexPath.section == 0) {
        return 60;
    }
    else{
        return 80;
    }
    
}
//设置分区的行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            return 4;
            break;
       default:
            return 5;
            break;
    }
}
////设置尾视图
//-(NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
//{
//    UIView*view =[[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 60)];
//    view.backgroundColor = [UIColor redColor];
//    return view;
//}


//对tableview中的行进行设置
-(UITableViewCell *)tableView:(UITableView *)tableView
        cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
   
    UITableViewCell*cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
     cell.textLabel.text = _dataArray[indexPath.section*3+indexPath.row+1];
    cell.detailTextLabel.text = _dataArray2[indexPath.section*3+indexPath.row+1];
    b1.backgroundColor= [UIColor redColor];
    if(indexPath.section== 1&&indexPath.row==0)
    {
        [cell.contentView addSubview:b1];
    }
    if(indexPath.section==0)
    {
        NSString *str =[ NSString stringWithFormat:@"0%d.png",indexPath.row+1 ];
        UIImage *image = [UIImage imageNamed:str];
        UIImageView* ivew = [[UIImageView alloc]initWithImage:image];
        cell.imageView.image= image;
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    else
    {
        NSString *str1 =[ NSString stringWithFormat:@"00%d.png",indexPath.row+1 ];
        UIImage *image1 = [UIImage imageNamed:str1];
        UIImageView* ivew1 = [[UIImageView alloc]initWithImage:image1];
        cell.imageView.image= image1;
        cell.separatorInset = UIEdgeInsetsMake(0, 0, 0, cell.bounds.size.width);
        
    }
     cell.detailTextLabel.text = _dataArray2[indexPath.section*3+indexPath.row+1];
    //cell.contentView.backgroundColor = [UIColor grayColor];
    UIView *view = [[UIView alloc ]init];
    view.backgroundColor = [UIColor whiteColor];
    cell.selectedBackgroundView = view;
    return cell;
}

    
    
    

-(NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return nil;
}
-(NSString*)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    return nil;
}



//获取头部高度
-(CGFloat)tableView:(UITableView *)tableView heightForheaderInSection:(NSInteger)section
{
   if(section == 0) {
       return 0.01;
   } else {
        return 1;
   }
    
}

////获取尾部高度
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if(section==1)
    {
        return 0.01;
    }
    else{
        return 0.05;
    }

}
//
//- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
//{
//    if(section!=0)
//    {
//    UIView * tableview = [[UIView alloc]init];
//    tableView.backgroundColor = [UIColor grayColor];
//    return tableview;
//    }
//    else{
//        return nil;
//    }
//}
//- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
//{
//    if(section!=0)
//    {
//        UIView * tableview = [[UIView alloc]init];
//        tableView.backgroundColor = [UIColor grayColor];
//        return tableview;
//    }
//    else{
//        return nil;
//    }
//}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
//-(void)pressleft
//{   self. hidesBottomBarWhenPushed= YES;
//    ViewController1 * vc1 = [[ViewController1 alloc]init];
//    [self.navigationController pushViewController:vc1 animated:NO];
//
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
@end
