//******************************************************************************
// SCICHART® Copyright SciChart Ltd. 2011-2018. All rights reserved.
//
// Web: http://www.scichart.com
// Support: support@scichart.com
// Sales:   sales@scichart.com
//
// SCILinearGradientBrushStyle.h is part of SCICHART®, High Performance Scientific Charts
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

#import "SCIBrushStyle.h"
#import "SCILinearGradientEnum.h"

@interface SCILinearGradientBrushStyle : SCIBrushStyle

@property (nonatomic, nonnull) NSArray<UIColor *> *colors;
@property (nonatomic, nonnull) NSArray<NSNumber *> *stops;
@property (nonatomic) SCILinearGradientDirection direction;
@property (nonatomic, nonnull, readonly) UIColor *color;
@property (nonatomic, readonly) unsigned int colorCode;

- (nonnull instancetype)initWithColorStart:(nonnull UIColor *)colorStart
                                    finish:(nonnull UIColor *)colorFinish
                                 direction:(SCILinearGradientDirection)direction;

- (nonnull instancetype)initWithColorCodeStart:(uint)colorStart
                                        finish:(uint)colorFinish
                                     direction:(SCILinearGradientDirection)direction;

- (nonnull instancetype)initWithGradientStops:(nonnull float*)stops
                                       colors:(nonnull uint*)colors
                                        count:(int)count
                                    direction:(SCILinearGradientDirection)direction;

@end
