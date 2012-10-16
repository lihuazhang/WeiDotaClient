//
//  HttpCom.m
//  WeiDotaClient
//
//  Created by scilearn peng on 10/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "HttpCom.h"

@implementation HttpCom

+ (NSString*) sendHttpSycRequest:(NSString*)urlString
{
    NSLog(@"%@", urlString);
    // init http request and auto release memory 
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:urlString]];
    [request setHTTPMethod:@"GET"];
    NSString *contentType = [NSString stringWithFormat:@"text/xml"]; 
    [request addValue:contentType forHTTPHeaderField:@"Content-Type"];
    NSHTTPURLResponse *urlResponse = nil; 
    NSError *error = [[NSError alloc] init];  
    // sychronize request, wait for response
    NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&urlResponse error:&error];
    NSString *result = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding]; 
    
    //stausCode should be 0 
    NSLog(@"response code:%d",[urlResponse statusCode]); 
    //if([urlResponse statusCode] >= 200 && [urlResponse statusCode] <300)
    //{ 
        NSLog(@"response:%@",result);  
    //} 
    return result;
}


@end
