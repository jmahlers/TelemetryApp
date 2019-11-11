//******************************************************************************
// SCICHART® Copyright SciChart Ltd. 2011-2018. All rights reserved.
//
// Web: http://www.scichart.com
// Support: support@scichart.com
// Sales:   sales@scichart.com
//
// SCIRadialGradientBrushStyle.h is part of SCICHART®, High Performance Scientific Charts
// For full terms and conditions of the license, see http://www.scichart.com/scichart-eula/
//
// This source code is protected by international copyright law. Unauthorized
// reproduction, reverse-engineering, or distribution of all or any portion of
// this source code is strictly prohibited.
//
// This source code contains confidential and proprietary trade secrets of
// SciChart Ltd., and should at no time be copied, transferred, sold,
// distributed or made available without express written permission.
//******************************************************************************

#import <Foundation/Foundation.h>
#import "SCIBrushStyle.h"
#import <QuartzCore/QuartzCore.h>

@interface SCIRadialGradientBrushStyle : SCIBrushStyle

@property (nonatomic, nonnull) NSArray<UIColor *> *colors;
@property (nonatomic, nonnull) NSArray<NSNumber *> *stops;
@property (nonatomic, nonnull, readonly) UIColor *color;
@property (nonatomic, readonly) unsigned int colorCode;
@property (nonatomic) CGPoint center;

- (nonnull instancetype)initWithColorStart:(nonnull UIColor *)colorStart
                                    finish:(nonnull UIColor *)colorFinish;

- (nonnull instancetype)initWithColorCodeStart:(uint)colorStart
                                        finish:(uint)colorFinish;

- (nonnull instancetype)initWithGradientStops:(nonnull float*)stops
                                       colors:(nonnull uint*)colors
                                        count:(int)count;

- (nonnull instancetype)initWithCenter:(CGPoint)center
                            colorStart:(nonnull UIColor *)colorStart
                                finish:(nonnull UIColor *)colorFinish;

- (nonnull instancetype)initWithCenter:(CGPoint)center
                        colorCodeStart:(uint)colorStart
                                finish:(uint)colorFinish;

- (nonnull instancetype)initWithCenter:(CGPoint)center
                         gradientStops:(nonnull float*)stops
                                colors:(nonnull uint*)colors
                                 count:(int)count;

@end
