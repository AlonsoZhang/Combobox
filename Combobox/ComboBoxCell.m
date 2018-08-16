//
//  ComboBoxCell.m
//  Combobox
//
//  Created by Alonso on 2018/8/15.
//  Copyright © 2018 Alonso. All rights reserved.
//

#import "ComboBoxCell.h"

@implementation ComboBoxCell
- (void)popUpList
{
    if ([self isPopUpWindowVisible])
    {
        return;
    }
    else
    {
        [_buttonCell performClick:nil];//模拟鼠标事件
    }
}

- (void)closePopUpWindow
{
    if ([self isPopUpWindowVisible])
    {
        [_popUp close];
    }
}

- (BOOL)isPopUpWindowVisible
{
    return [_popUp isVisible];
}

@end
