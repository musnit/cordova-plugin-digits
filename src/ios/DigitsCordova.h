#import <Cordova/CDV.h>

@interface DigitsCordova : CDVPlugin
@property CDVInvokedUrlCommand* command;

- (void) openDigitsView:(CDVInvokedUrlCommand*)command;
- (void) logoutDigits:(CDVInvokedUrlCommand*)command;

@end
