//
//  ComboBoxCell.h
//  Combobox
//
//  Created by Alonso on 2018/8/15.
//  Copyright © 2018 Alonso. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface ComboBoxCell : NSComboBoxCell

- (void)popUpList;
- (void)closePopUpWindow;
- (BOOL)isPopUpWindowVisible;

@end
