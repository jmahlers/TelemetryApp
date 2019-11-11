//******************************************************************************
// SCICHART® Copyright SciChart Ltd. 2011-2018. All rights reserved.
//
// Web: http://www.scichart.com
// Support: support@scichart.com
// Sales:   sales@scichart.com
//
// SCIRelativeZoomModifierBase.h is part of SCICHART®, High Performance Scientific Charts
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

#import <Foundation/Foundation.h>
#import "SCIGestureModifier.h"
#import "SCIEnumerationConstants.h"

@interface SCIRelativeZoomModifierBase : SCIGestureModifier

@property (nonatomic) SCIDirection2D direction;
@property (nonatomic) double growFactor;

-(void) performZoomAt:(CGPoint)mousePoint XValue:(double)xValue YValue:(double)yValue;
-(void) growByFraction:(double)fraction AtPoint:(CGPoint)location AtAxis:(id<SCIAxis2DProtocol>)axis;

@end

/** @}*/
