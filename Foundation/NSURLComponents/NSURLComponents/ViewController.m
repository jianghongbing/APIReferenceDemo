//
//  ViewController.m
//  NSURLComponents
//
//  Created by pantosoft on 2017/7/11.
//  Copyright © 2017年 jianghongbing. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //NSURLComponents:NSURL各个组成部分的封装的类,可以通过NSURLComponnet来创建URL和替代可变的URL的需求
    
    //1.NSURLComponents的创建
    NSURLComponents *components = [[NSURLComponents alloc] initWithString:@"http://www.jianghongbing.com"];

    //2.string和URL
    NSString *componentsString = components.string;
    NSURL *componentsURL = components.URL;
    NSLog(@"componentsString:%@, componentsURL:%@", componentsString, componentsURL);
    
    components = [NSURLComponents componentsWithURL:[NSURL URLWithString:@"http://192.168.0.100:11000"] resolvingAgainstBaseURL:YES];
    
    NSURL *relativieToURL = [components URLRelativeToURL:[NSURL URLWithString:@"http://www.google.com"]];
    NSLog(@"relativieToURL:%@", relativieToURL);
    //3.获取各个component的值
    NSURL *wholeURL = [NSURL URLWithString:@"https://jianghongbing:p4ssw0rd@www.jianghongbing.com:443/script.ext;param=value?query=value#ref"];
    NSLog(@"wholeURL:%@", wholeURL);
    NSURLComponents *wholeURLComponents = [NSURLComponents componentsWithURL:wholeURL resolvingAgainstBaseURL:NO];
    
    NSString *scheme = wholeURLComponents.scheme;
    NSString *user = wholeURLComponents.user;
    NSString *password = wholeURLComponents.password;
    NSString *host = wholeURLComponents.host;
    NSNumber *port = wholeURLComponents.port;
    NSString *path = wholeURLComponents.path;
    NSString *fragment = wholeURLComponents.fragment;
    
    NSLog(@"\nscheme:%@\nuser:%@\npassword:%@\nhost:%@\nport:%@\npath:%@\nfragment:%@\n", scheme, user, password, host, port, path, fragment);
    
    //4.percent encoding
    NSString *percentEncodedUser = wholeURLComponents.percentEncodedUser;
    NSString *percentEncodedPassword = wholeURLComponents.percentEncodedPassword;
    NSString *percentEncodedHost = wholeURLComponents.percentEncodedHost;
    NSString *percentEncodedPath = wholeURLComponents.percentEncodedPath;
    NSLog(@"\nencodedUser:%@\nencodedPassword:%@\nencodedHost:%@\nencodedPath:%@", percentEncodedUser, percentEncodedPassword, percentEncodedHost, percentEncodedPath);
    
    
    //通过NSURLComponents获取NSURL
    wholeURLComponents.user = @"admin";
    wholeURLComponents.password = @"123456";
    wholeURLComponents.port = @10000;
    
    NSURL *urlForComponents = wholeURLComponents.URL;
    NSLog(@"urlForComponents:%@", urlForComponents);
    
    //5.获取各个component的range
    NSRange schemeRange = wholeURLComponents.rangeOfScheme;
    NSRange hostRange = wholeURLComponents.rangeOfHost;
    NSLog(@"schemeRange:%@, hostRange:%@", NSStringFromRange(schemeRange), NSStringFromRange(hostRange));
}



@end
