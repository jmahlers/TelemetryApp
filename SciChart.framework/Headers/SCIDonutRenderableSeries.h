//******************************************************************************
// SCICHART® Copyright SciChart Ltd. 2011-2018. All rights reserved.
//
// Web: http://www.scichart.com
// Support: support@scichart.com
// Sales:   sales@scichart.com
//
// SCIDonutRenderableSeries.h is part of SCICHART®, High Performance Scientific Charts
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

#import "SCIPieDonutRenderableSeriesBase.h"

/** \addtogroup RenderableSeries
 *  @{
 */

/**
 * Provides Donut series rendering.
 */
@interface SCIDonutRenderableSeries : SCIPieDonutRenderableSeriesBase

/**
 * Method that draws segment.
 * @param segment SCIPieSegment to be drawn
 * @param offset is starting angle in radians
 * @param arcSize arc size of segment in radians
 * @param center CGPoint center from which segment is drawn
 * @param innerRadius distance in point to inner arc of segment
 * @param outerRadius distance in point to outer arc of segment
 */
- (void)drawSegment:(SCIPieSegment *)segment offset:(double)offset arcSize:(double)arcSize center:(CGPoint)center innerRadius:(double)innerRadius outerRadius:(double)outerRadius;

/**
 * Entry point for drawing label for segment
 * @param segment SCIPieSegment for which label is placed
 * @param offset starting angle of segment in radians
 * @param arcSize size of segment arc in radians
 * @param center CGPoint center from which segment is drawn
 * @param innerRadius distance in point to inner arc of segment
 * @param outerRadius distance in point to outer arc of segment
 */
- (void)drawSegmentLabel:(SCIPieSegment *)segment offset:(double)offset arcSize:(double)arcSize center:(CGPoint)center innerRadius:(double)innerRadius outerRadius:(double)outerRadius;

/**
 * Draw text on segment
 * @param segment SCIPieSegment on which text is placed
 * @param text string to be written
 * @param centre CGPoint center of series
 * @param innerRadius distance in point to inner arc of segment
 * @param outerRadius distance in point to outer arc of segment
 * @param startAngle angle in radians that define start of segment area
 * @param endAngle angle in radians that define end of segment area
 * @param placementOption not used currently
 */
- (void)placeLabelForSegment:(SCIPieSegment *)segment text:(NSString*)text centre:(CGPoint)centre innerRadius:(double)innerRadius outerRadius:(double)outerRadius startAngle:(double)startAngle endAngle:(double)endAngle placementOption:(int)placementOption;

/**
 * Returns path for segment stroke and fill drawing
 * @param segment SCIPieSegment for which path is calculated
 * @param centre CGPoint centre from which arcs are calculated
 * @param innerRadius distance in point to inner arc of segment
 * @param outerRadius distance in point to outer arc of segment
 * @param startAngle angle in radians that defines start of segment area
 * @param endAngle angle in radians that defines end of segment area
 * @param segmentSpacing offset in points for segment from center and other segments
 */
- (CGMutablePathRef)getSegmentPath:(SCIPieSegment *)segment centre:(CGPoint)centre innerRadius:(double)innerRadius outerRadius:(double)outerRadius startAngle:(double)startAngle endAngle:(double)endAngle segmentSpacing:(double)segmentSpacing;

/**
 * Returns path for segment outline drawing
 * @param segment SCIPieSegment for which path is calculated
 * @param centre CGPoint centre from which arcs are calculated
 * @param innerRadius distance in point to inner arc of segment
 * @param outerRadius distance in point to outer arc of segment
 * @param startAngle angle in radians that defines start of segment area
 * @param endAngle angle in radians that defines end of segment area
 * @param segmentSpacing offset in points for segment from center and other segments
 */
- (CGMutablePathRef)getOutlinePath:(SCIPieSegment *)segment centre:(CGPoint)centre innerRadius:(double)innerRadius outerRadius:(double)outerRadius startAngle:(double)startAngle endAngle:(double)endAngle segmentSpacing:(double)segmentSpacing;

@end

/** @}*/
