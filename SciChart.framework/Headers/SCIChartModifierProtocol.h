//******************************************************************************
// SCICHART® Copyright SciChart Ltd. 2011-2018. All rights reserved.
//
// Web: http://www.scichart.com
// Support: support@scichart.com
// Sales:   sales@scichart.com
//
// SCIChartModifierProtocol.h is part of SCICHART®, High Performance Scientific Charts
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

/** \addtogroup ChartModifiers
 *  @{
 */

@class SCIAxisCollection;
@protocol SCIAxis2DProtocol;
@protocol SCIChartSurfaceProtocol;

/**
 */
@protocol SCIChartModifierProtocol ///
<NSObject>
/** @{ @} */

@property (nonatomic, weak) id<SCIChartSurfaceProtocol> parentSurface;
@property (nonatomic) BOOL isAttached;
@property (nonatomic) BOOL isEnabled;
@property (nonatomic, copy) NSString *modifierName;

-(id<SCIAxis2DProtocol>) xAxis;
-(id<SCIAxis2DProtocol>) yAxis;
-(SCIAxisCollection*) xAxes;
-(SCIAxisCollection*) yAxes;
-(id<SCIAxis2DProtocol>) getXAxis:(NSString*)axisId;
-(id<SCIAxis2DProtocol>) getYAxis:(NSString*)axisId;

-(void) resetInertia;
-(void)draw;
-(void) onAttached;
-(void) onDetached;

@property (nonatomic) BOOL autoPassAreaCheck;

@end

/** @}*/
