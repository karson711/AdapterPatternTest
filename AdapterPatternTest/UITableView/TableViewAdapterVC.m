//
//  TableViewAdapterVC.m
//  AdapterPatternTest
//
//  Created by kunge on 2018/7/2.
//  Copyright © 2018年 kunge. All rights reserved.
//

#import "TableViewAdapterVC.h"
#import "ShortRentAdapater.h"

@interface TableViewAdapterVC ()

@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic,strong) NSMutableArray *rentArr;
@property (nonatomic,strong) ShortRentAdapater *shortRentAdapter;

@end

@implementation TableViewAdapterVC

-(NSMutableArray *)rentArr{
    if (_rentArr == nil) {
        _rentArr = [NSMutableArray array];
    }
    return _rentArr;
}

#pragma mark - 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self setUpUI];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.title = @"UITableView适配器";
}

#pragma mark - 请求
#pragma mark 模拟网络请求
-(void)requestListWithRefresh:(BOOL)isRefresh
{
    if (isRefresh) {
        self.rentArr = [NSMutableArray arrayWithArray:@[@""]];
    }else{
        [self.rentArr addObject:@""];
    }
    self.shortRentAdapter.dataArray = self.rentArr;
    [self.tableView reloadData];
    [self endListTableMJRefresh];
}

#pragma mark - Method
-(void)setUpUI{

    self.tableView.estimatedRowHeight = 280;
    [self.tableView registerNib:[UINib nibWithNibName:@"ShortRentListCell" bundle:nil] forCellReuseIdentifier:@"ShortRentListCell"];
    self.shortRentAdapter = [[ShortRentAdapater alloc] init];
    self.shortRentAdapter.dataArray = self.rentArr;
    self.tableView.delegate = self.shortRentAdapter;
    self.tableView.dataSource = self.shortRentAdapter;
    //cell点击回调
    WEAKSELF
    [self.shortRentAdapter setCellClickBlock:^(NSIndexPath *indexPath) {
        NSLog(@"UITableView详情页");
        [MBProgressHUD showWithMessage:@"跳转UITableView详情页" onView:self.view.window];
    }];
    
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        // 刷新
        [weakSelf requestListWithRefresh:YES];
    }];
    
    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        // 加载更多
        [weakSelf requestListWithRefresh:NO];
    }];
    
    [self.tableView.mj_header beginRefreshing];
}

-(void)endListTableMJRefresh{
    [self.tableView.mj_header endRefreshing];
    [self.tableView.mj_footer endRefreshing];
}



@end
