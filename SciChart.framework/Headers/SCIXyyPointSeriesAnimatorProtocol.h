//******************************************************************************
// SCICHART® Copyright SciChart Ltd. 2011-2018. All rights reserved.
//
// Web: http://www.scichart.com
// Support: support@scichart.com
// Sales:   sales@scichart.com
//
// SCIXyyPointSeriesAnimatorProtocol.h is part of SCICHART®, High Performance Scientific Charts
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
/** \addtogroup Animations
 *  @{
 */
#import <Foundation/Foundation.h>

@class SCIXyyPointSeries;
/**
 Interface of animator for xyy point series.
 */
@protocol SCIXyyPointSeriesAnimatorProtocol <NSObject>

/**
 Method for animating xyy point series.
 
 @param pointSeries Final point series which should be when animation is finished
 @param previousPointSeries Last point series before the animation is started
 @return Point series for current progress of animation.
 */
- (nullable SCIXyyPointSeries*)animateXyyPointSeries:(nullable SCIXyyPointSeries*)pointSeries withPreviousPointSeries:(nullable SCIXyyPointSeries*)previousPointSeries;
@end

/** @}*/
