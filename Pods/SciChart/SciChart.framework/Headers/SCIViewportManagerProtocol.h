//******************************************************************************
// SCICHART® Copyright SciChart Ltd. 2011-2018. All rights reserved.
//
// Web: http://www.scichart.com
// Support: support@scichart.com
// Sales:   sales@scichart.com
//
// SCIViewportManagerProtocol.h is part of SCICHART®, High Performance Scientific Charts
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

/** \addtogroup Visuals
 *  @{
 */

#import "SCIInvalidatableElementProtocol.h"

@protocol SCIAxis2DProtocol;
@protocol SCIRangeProtocol;
@class SCIRenderPassInfo;
@protocol SCIChartSurfaceProtocol;

#pragma mark - SCIViewPortManagee Protocol

/**
 @extends SCIInvalidatableElementProtocol
 */
@protocol SCIViewportManagerProtocol ///
        <NSObject, SCIInvalidatableElementProtocol>
/** @{ @} */

- (BOOL)isAttached;

- (id <SCIRangeProtocol>)calculateNewYAxisRange:(id <SCIAxis2DProtocol>)yAxis WithInfo:(SCIRenderPassInfo *)renderPassInfo;

- (id <SCIRangeProtocol>)calculateNewXAxisRange:(id <SCIAxis2DProtocol>)xAxis;

- (id <SCIRangeProtocol>)calculateAutoRange:(id <SCIAxis2DProtocol>)axis;

- (void)attachSciChartSurface:(id <SCIChartSurfaceProtocol>)scs;

- (void)detachSciChartSurface;

- (void)zoomExtents;

- (void)animateZoomExtents:(float)duration;

- (void)zoomExtentsY;

- (void)animateZoomExtentsY:(float)duration;

- (void)zoomExtentsX;

- (void)animateZoomExtentsX:(float)duration;

- (void)autorangeAxes;

@end
