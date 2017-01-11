
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
#import "CapeMath.h"
#import "CapexVector3.h"

@implementation CapexVector3

- (CapexVector3*) init {
	if([super init] == nil) {
		return(nil);
	}
	self->z = 0.0;
	self->y = 0.0;
	self->x = 0.0;
	return(self);
}

+ (CapexVector3*) create:(double)x y:(double)y z:(double)z {
	CapexVector3* v = [[CapexVector3 alloc] init];
	v->x = x;
	v->y = y;
	v->z = z;
	return(v);
}

- (CapexVector3*) add:(CapexVector3*)b {
	self->x += b->x;
	self->y += b->y;
	self->z += b->z;
	return(self);
}

- (CapexVector3*) subtract:(CapexVector3*)b {
	self->x -= b->x;
	self->y -= b->y;
	self->z -= b->z;
	return(self);
}

- (CapexVector3*) multiply:(CapexVector3*)b {
	self->x *= b->x;
	self->y *= b->y;
	self->z *= b->z;
	return(self);
}

- (CapexVector3*) multiplyScalar:(double)a {
	self->x *= a;
	self->y *= a;
	self->z *= a;
	return(self);
}

- (double) distance:(CapexVector3*)b {
	double dist = (self->y - b->y) * (self->y - b->y) + (self->x - b->x) * (self->x - b->x) + (self->z - b->z) * (self->z - b->z);
	return([CapeMath sqrt:dist]);
}

- (double) getLength {
	return([CapeMath sqrt:self->x * self->x + self->y * self->y + self->z * self->z]);
}

@end
