//
//  NearbyDealsListItem.m
//  Deals
//
//  Created by Ved Surtani on 07/12/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "DetailViewRowItem.h"

@implementation DetailViewRowItem
@synthesize label,values;

-(CGFloat)heightForCell
{
    return 50.0f;
}


-(UITableViewCell*)reusableCellForTableView:(UITableView*)tableView{
    
    UITableViewCell *cell = (UITableViewCell*)[tableView dequeueReusableCellWithIdentifier:[self reusableCellIdentifier]];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 
                                      reuseIdentifier:[self reusableCellIdentifier]];
    }
    NSMutableString *displayString = [NSMutableString stringWithFormat:@"%@: ",label];
    int count = 0;
        NSMutableString *valueString = [NSMutableString stringWithString:@""];
        for(NSString *value in values)
        {
            count++;
            if (value == nil || [value isEqualToString:@""]) {
                continue;
            }
            NSLog(@"%d",[values count]);
            if (count==[values count]) {
                [valueString appendString:[NSString stringWithFormat:@"%@ ",value]];
            }
            else {
                [valueString appendString:[NSString stringWithFormat:@"%@, ",value]];
            }
        }
    if ([valueString isEqualToString:@""]) {
        [displayString appendString:@"NA"];
    }
    else{
        [displayString appendString:valueString];
    }
    cell.textLabel.numberOfLines = 0;
    cell.textLabel.text = displayString;
    return cell;
}


-(NSString*)reusableCellIdentifier
{
    return [[self class] description];
}
@end