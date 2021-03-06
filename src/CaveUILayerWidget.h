
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
#import <UIKit/UIKit.h>
#import "CaveUICustomContainerWidget.h"

@protocol CaveGuiApplicationContext;

@interface CaveUILayerWidget : CaveUICustomContainerWidget
{
	@protected int widgetMarginLeft;
	@protected int widgetMarginRight;
	@protected int widgetMarginTop;
	@protected int widgetMarginBottom;
}
- (CaveUILayerWidget*) init;
+ (CaveUILayerWidget*) findTopMostLayerWidget:(UIView*)widget;
+ (CaveUILayerWidget*) forContext:(id<CaveGuiApplicationContext>)context;
+ (CaveUILayerWidget*) forMargin:(id<CaveGuiApplicationContext>)context margin:(int)margin;
+ (CaveUILayerWidget*) forWidget:(id<CaveGuiApplicationContext>)context widget:(UIView*)widget margin:(int)margin;
+ (CaveUILayerWidget*) forWidgetAndWidth:(id<CaveGuiApplicationContext>)context widget:(UIView*)widget width:(int)width;
+ (CaveUILayerWidget*) forWidgets:(id<CaveGuiApplicationContext>)context widgets:(NSMutableArray*)widgets margin:(int)margin;
- (CaveUILayerWidget*) setWidgetMaximumWidthRequest:(int)width;
- (int) getWidgetMaximumWidthRequest;
- (CaveUILayerWidget*) setWidgetWidthRequest:(int)request;
- (int) getWidgetWidthRequest;
- (CaveUILayerWidget*) setWidgetHeightRequest:(int)request;
- (int) getWidgetHeightRequest;
- (CaveUILayerWidget*) setWidgetMinimumHeightRequest:(int)request;
- (int) getWidgetMinimumHeightRequest;
- (CaveUILayerWidget*) setWidgetMargin:(int)margin;
- (int) getWidgetMarginLeft;
- (CaveUILayerWidget*) setWidgetMarginLeft:(int)value;
- (int) getWidgetMarginRight;
- (CaveUILayerWidget*) setWidgetMarginRight:(int)value;
- (int) getWidgetMarginTop;
- (CaveUILayerWidget*) setWidgetMarginTop:(int)value;
- (int) getWidgetMarginBottom;
- (CaveUILayerWidget*) setWidgetMarginBottom:(int)value;
- (CaveUILayerWidget*) initWithGuiApplicationContext:(id<CaveGuiApplicationContext>)ctx;
- (void) onWidgetHeightChanged:(int)height;
- (void) computeWidgetLayout:(int)widthConstraint;
- (void) removeAllChildren;
- (UIView*) getChildWidget:(int)index;
@end
