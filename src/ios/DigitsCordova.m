#import "DigitsCordova.h"
#import <DigitsKit/DigitsKit.h>

@implementation DigitsCordova

- (void)openDigitsView:(CDVInvokedUrlCommand*)command
{

    [self.commandDelegate runInBackground:^{
        self.command = command;

        [[Digits sharedInstance] authenticateWithCompletion:^
         (DGTSession* session, NSError *error) {

             CDVPluginResult* pluginResult = nil;

             if (session) {
                 pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
             } else {
                 pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
             }

             DGTOAuthSigning *oauthSigning = [[DGTOAuthSigning alloc] initWithAuthConfig:[Digits sharedInstance].authConfig authSession:session];
             NSDictionary *authHeaders = [oauthSigning OAuthEchoHeadersToVerifyCredentials];
             NSDictionary *loginResponse = [NSDictionary dictionaryWithObjectsAndKeys:
                                            authHeaders, @"oauth_echo_headers",
                                            nil];

             CDVPluginResult* result = [CDVPluginResult
                                        resultWithStatus:CDVCommandStatus_OK
                                        messageAsDictionary:loginResponse
                                        ];

             [self success:result callbackId:command.callbackId];

         }];
    }];

}

- (void)logoutDigits:(CDVInvokedUrlCommand*)command
{
    [self.commandDelegate runInBackground:^{
        self.command = command;

        [[Digits sharedInstance] logOut];
        CDVPluginResult* result = [CDVPluginResult
                                   resultWithStatus:CDVCommandStatus_OK
                                   ];
        [self success:result callbackId:command.callbackId];
    }];
}

@end
