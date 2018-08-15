//
//  ViewController.m
//  Combobox
//
//  Created by Alonso on 2018/8/15.
//  Copyright © 2018 Alonso. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSMutableDictionary *configPlist = [[NSMutableDictionary alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Config" ofType:@"plist"]];
    NSArray *keyworditems = [configPlist objectForKey:@"Test"];
    [self.demoCB addItemsWithObjectValues:keyworditems];
}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}


- (IBAction)choose:(NSComboBox *)sender {
}
@end
