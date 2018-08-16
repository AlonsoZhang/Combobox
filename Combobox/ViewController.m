//
//  ViewController.m
//  Combobox
//
//  Created by Alonso on 2018/8/15.
//  Copyright © 2018 Alonso. All rights reserved.
//

#import "ViewController.h"
@interface ViewController() <NSComboBoxDelegate, NSComboBoxDataSource>
@property (nonatomic, strong) NSArray *keyworditems;
@property (nonatomic, strong) NSMutableArray *mutablekeyworditems;
@property (weak) IBOutlet NSComboBox *demoCB;
@property (weak) IBOutlet ComboBoxCell *demoCBCell;
@end
@implementation ViewController

- (id)init{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSMutableDictionary *configPlist = [[NSMutableDictionary alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Config" ofType:@"plist"]];
    NSArray *keyword = [configPlist objectForKey:@"Test"];
    _keyworditems = keyword;
    _mutablekeyworditems = [NSMutableArray arrayWithArray:_keyworditems];
    self.demoCB.delegate = self;
    self.demoCB.dataSource = self;
}

- (void)resetDataSource{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if (!self->_demoCBCell.isPopUpWindowVisible) {
            [self->_mutablekeyworditems removeAllObjects];
            [self->_mutablekeyworditems addObjectsFromArray:self->_keyworditems];
        }
    });
}

- (NSInteger)numberOfItemsInComboBox:(NSComboBox *)aComboBox{
    return _mutablekeyworditems.count;
}

- (id)comboBox:(NSComboBox *)aComboBox objectValueForItemAtIndex:(NSInteger)index{
    return _mutablekeyworditems[index];
}

- (void)comboBoxSelectionDidChange:(NSNotification *)notification{
    NSLog(@"0");
}
- (void)comboBoxSelectionIsChanging:(NSNotification *)notification{
    NSLog(@"1");
    [self resetDataSource];
}
- (void)controlTextDidBeginEditing:(NSNotification *)notification{
    NSLog(@"2");
}
- (void)controlTextDidEndEditing:(NSNotification *)notification{
    [self resetDataSource];
    NSLog(@"3");
}

-(void)controlTextDidChange:(NSNotification*)notification{
    id object = [notification object];
    [self match:object editable:false];
    NSLog(@"4");
}

- (void)match:(NSComboBox *)box editable:(BOOL)editable{
    NSComboBox *comboBox = _demoCB;
    ComboBoxCell *comboBoxCell = _demoCBCell;
    NSArray *datas = _keyworditems;
    NSMutableArray *mutableDatas = _mutablekeyworditems;
    NSString *value = [comboBox stringValue];
    NSMutableIndexSet *matchedIndexSet = [NSMutableIndexSet indexSet];
    __block NSUInteger row = 0;
    [datas enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj rangeOfString:value].location != NSNotFound) {
            row = idx;
            [matchedIndexSet addIndex:idx];
        }
    }];
    [mutableDatas removeAllObjects];
    if (matchedIndexSet.count) {
        [mutableDatas addObjectsFromArray:[datas objectsAtIndexes:matchedIndexSet]];
    }
    else{
        [mutableDatas addObjectsFromArray:datas];
    }
    [comboBox scrollItemAtIndexToTop:0];
    [comboBoxCell popUpList];
    [comboBox reloadData];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSString *comboText = comboBox.stringValue;
        if (!comboBoxCell.isPopUpWindowVisible) {
            if (editable){
                [self resetDataSource];
            }else if ( comboText.length == 0 || ![datas containsObject:comboText]){
                [comboBox selectItemAtIndex:0];
                [self resetDataSource];
            }
        }
    });
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

@end
