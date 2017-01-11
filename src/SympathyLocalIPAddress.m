
/*
 * This file is part of Jkop for iOS
 * Copyright (c) 2016-2017 Job and Esther Technologies, Inc.
 * 
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 * 
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 * 
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 */

#import <Foundation/Foundation.h>
#import <ifaddrs.h>
#import <arpa/inet.h>
#import "SympathyLocalIPAddress.h"

@implementation SympathyLocalIPAddress

- (SympathyLocalIPAddress*) init {
	if([super init] == nil) {
		return(nil);
	}
	return(self);
}

+ (NSString*) get {
	NSString* v = nil;
	struct ifaddrs *interfaces = NULL;
	struct ifaddrs *t = NULL;
	int r = getifaddrs(&interfaces);
	if (r == 0) {
		t = interfaces;
		while(t != NULL) {
			if(t->ifa_addr->sa_family == AF_INET) {
				if([[NSString stringWithUTF8String:t->ifa_name] isEqualToString:@"en0"]) {
					v = [NSString stringWithUTF8String:inet_ntoa(((struct sockaddr_in *)t->ifa_addr)->sin_addr)];
				}
			}
			t = t->ifa_next;
		}
	}
	freeifaddrs(interfaces);
	return(v);
}

@end
