#import "DigitsCordova.h"
#import <DigitsKit/DigitsKit.h>

@implementation DigitsCordova

- (void)openDigitsView:(CDVInvokedUrlCommand*)command
{
    self.command = command;

    [self.commandDelegate runInBackground:^{
        [self.viewController performSegueWithIdentifier: @"digitize" sender: self];
    }];

}

@end
