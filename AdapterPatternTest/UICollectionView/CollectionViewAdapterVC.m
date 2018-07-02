//
//  CollectionViewAdapterVC.m
//  AdapterPatternTest
//
//  Created by kunge on 2018/7/2.
//  Copyright © 2018年 kunge. All rights reserved.
//

#import "CollectionViewAdapterVC.h"
#import "YueMallCollectionAdapter.h"
#import "MallListCollectionCell.h"

@interface CollectionViewAdapterVC ()

@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;
@property (nonatomic,strong) YueMallCollectionAdapter *mallAdapter;
@property (nonatomic,strong) NSMutableArray *mallArr;

@end

@implementation CollectionViewAdapterVC

-(NSMutableArray *)mallArr{
    if (_mallArr == nil) {
        _mallArr = [NSMutableArray array];
    }
    return _mallArr;
}

#pragma mark - 请求
#pragma mark 模拟网络请求
-(void)requestListWithRefresh:(BOOL)isRefresh
{
    if (isRefresh) {
        self.mallArr = [NSMutableArray arrayWithArray:@[@"",@""]];
    }else{
        [self.mallArr addObject:@""];
    }
    self.mallAdapter.dataArray = self.mallArr;
    [self.collectionView reloadData];
    [self endListTableMJRefresh];
}


#pragma mark - 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self setUpUI];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.title = @"UICollectionView适配器";
}

#pragma mark - Method
-(void)setUpUI{

    UICollectionViewFlowLayout *layOut = [[UICollectionViewFlowLayout alloc] init];
    layOut.scrollDirection = UICollectionViewScrollDirectionVertical;
    layOut.minimumInteritemSpacing = lineMargin/2;
    layOut.minimumLineSpacing = lineMargin;
    layOut.sectionInset = UIEdgeInsetsMake(0, 10, 0, 10);//设置section的编距
    self.collectionView.collectionViewLayout = layOut;
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"MallListCollectionCell" bundle:nil] forCellWithReuseIdentifier:@"MallListCollectionCell"];
    [self.collectionView registerNib:[UINib nibWithNibName:@"MallBannerHeaderCollectionView" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"MallBannerHeaderCollectionView"];
    
    self.mallAdapter = [YueMallCollectionAdapter new];
    self.mallAdapter.dataArray = self.mallArr;
    self.collectionView.delegate = self.mallAdapter;
    self.collectionView.dataSource = self.mallAdapter;
    
    WEAKSELF
    [self.mallAdapter setCellClickBlock:^(NSIndexPath *indexPath) {
        NSLog(@"跳转CollectionView详情页");
        [MBProgressHUD showWithMessage:@"跳转CollectionView详情页" onView:self.view.window];
    }];
    
    self.collectionView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        // 刷新
        [weakSelf requestListWithRefresh:YES];
    }];
    
    self.collectionView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        // 加载更多
        [weakSelf requestListWithRefresh:NO];
    }];
    
    [self.collectionView.mj_header beginRefreshing];
}

-(void)endListTableMJRefresh{
    [self.collectionView.mj_header endRefreshing];
    [self.collectionView.mj_footer endRefreshing];
}


@end
