//******************************************************************************
// SCICHART® Copyright SciChart Ltd. 2011-2018. All rights reserved.
//
// Web: http://www.scichart.com
// Support: support@scichart.com
// Sales:   sales@scichart.com
//
// SCIPieRenderPassData.h is part of SCICHART®, High Performance Scientific Charts
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
#import <QuartzCore/QuartzCore.h>

/** \addtogroup RenderableSeries
 *  @{
 */

/**
 Data used in rendering of Pie and Donut series
 @see SCIPieRenderableSeries
 @see SCIDonutRenderableSeries
 */
@interface SCIPieRenderPassData : NSObject

/**
 Center of circle
 */
@property (nonatomic) CGPoint center;
/**
 Distance in points from center to inner arc. Ignored by Pie series
 */
@property (nonatomic) double innerRadius;
/**
 Distance in points from center to outer arc
 */
@property (nonatomic) double outerRadius;
/**
 Frame inside of which series is contained
 */
@property (nonatomic) CGRect frame;
/**
 Distance in points between segments in circle
 */
@property (nonatomic) double segmentSpacing;

@end

/** @}*/
