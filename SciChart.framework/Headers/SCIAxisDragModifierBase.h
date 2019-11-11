//******************************************************************************
// SCICHART® Copyright SciChart Ltd. 2011-2018. All rights reserved.
//
// Web: http://www.scichart.com
// Support: support@scichart.com
// Sales:   sales@scichart.com
//
// SCIAxisDragModifierBase.h is part of SCICHART®, High Performance Scientific Charts
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
#import "SCIPanModifier.h"
#import "SCIEnumerationConstants.h"

@protocol SCIRangeProtocol;
@class SCIDoubleRange;

/**
 * @brief The SCIAxisDragModifierBase class.
 * @discussion Provides base class for dragging operations on axes.
 */
@interface SCIAxisDragModifierBase : SCIPanModifier

/**
 * @brief The SCIAxisDragModifierBase class' property.
 * @discussion Defines which Axis to attach the AxisDragModifier to, matching by string Id
 */
@property (nonatomic, copy) NSString* axisId;

/**
 * @brief The SCIAxisDragModifierBase class' property.
 * @discussion Gets or sets the DragMode of AxisDragModifier. This modifier may be used to scale the VisibleRange or pan the VisibleRange creating a scrolling or vertical pan effect
 */
@property (nonatomic) SCIAxisDragMode dragMode;

/**
 * @brief The SCIAxisDragModifierBase class' property.
 * @discussion If true axisDragModifier doens't work.
 */
@property (nonatomic, readonly) BOOL gestureLocked;

/**
 @brief The SCIAxisDragModifierBase class' method.
 @discussion Gets  whether the specified touch point is within the the second (right-most or top-most) half of the Axis bounds.
 @param point The touch point
 @param axisBounds The axis bounds
 @param isHorizontalAxis Value, which indicates whether current axis is horizontal or not
 @return BOOL True if the point is within the second half of the axis bounds, else false
 @code
 Boolean isSecondHalf = [axisDragModifier getIsSecondHalfPoint:point Frame:axisBounds IsHorizontal:isHorizontal];
 @endcode
 */
-(BOOL)getIsSecondHalfPoint:(CGPoint)point Frame:(CGRect)axisBounds IsHorizontal:(BOOL)isHorizontalAxis;

/**
 @brief The SCIAxisDragModifierBase class' method.
 @discussion Gets the Axis instance, which current modifier is associated with.
 @code
 id<SCIAxis2D> axis = [axisDragModifier getCurrentAxis];
 @endcode
 */
-(id<SCIAxis2DProtocol>) getCurrentAxis;

-(id<SCIRangeProtocol>) calculateScaledRangeFrom:(CGPoint)lastPoint To:(CGPoint)currentPoint IsSecondHalf:(BOOL)isSecondHalf AtAxis:(id<SCIAxis2DProtocol>)axis;
-(SCIDoubleRange *) calculateRelativeRangeFrom:(id<SCIRangeProtocol>)fromRange AtAxis:(id<SCIAxis2DProtocol>)axis;
-(void) performScaleFrom:(CGPoint)lastPoint To:(CGPoint)currentPoint IsSecondHalf:(BOOL)isSecondHalf;

@end

/** @}*/
