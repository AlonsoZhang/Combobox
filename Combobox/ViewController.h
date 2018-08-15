//
//  ViewController.h
//  Combobox
//
//  Created by Alonso on 2018/8/15.
//  Copyright © 2018 Alonso. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface ViewController : NSViewController
@property (weak) IBOutlet NSComboBox *demoCB;
- (IBAction)choose:(NSComboBox *)sender;


@end

