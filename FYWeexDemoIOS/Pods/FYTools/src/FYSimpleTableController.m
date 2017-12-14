//
//  FYSimpleTableController.m
//  FYTools
//
//  Created by 方懿 on 2017/11/30.
//

#import "FYSimpleTableController.h"

#import "FYUtils.h"

@interface FYSimpleTableItem : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *action;

@end

@implementation FYSimpleTableItem

@end

@interface FYSimpleTableController () <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) NSArray *items;
@property (nonatomic, weak) UITableView *tableView;

@end

@implementation FYSimpleTableController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupTable];
    [self setupData];
}

static NSString *cellId = @"cellId";

- (void)setupTable {
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    tableView.dataSource = self;
    tableView.delegate = self;
    tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:tableView];
    _tableView = tableView;
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellId];
}

- (void)setupData {
    NSMutableArray *tmp = [NSMutableArray new];
    for (NSDictionary *row in [self tableItemDict]) {
        for (NSString *key in row.allKeys) {
            FYSimpleTableItem *item = [FYSimpleTableItem new];
            item.title = key;
            item.action = row[key];
            [tmp addObject:item];
        }
    }
    _items = [tmp copy];
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
    FYSimpleTableItem *item = _items[indexPath.row];
    cell.textLabel.text = item.title;
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _items.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    FYSimpleTableItem *item = _items[indexPath.row];
    SEL sel = NSSelectorFromString(item.action);
    [FYUtils performSel:sel target:self];
}

- (NSArray<NSDictionary *> *)tableItemDict {
    return [NSArray array];
}

@end
