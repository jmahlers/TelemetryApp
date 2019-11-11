//******************************************************************************
// SCICHART® Copyright SciChart Ltd. 2011-2018. All rights reserved.
//
// Web: http://www.scichart.com
// Support: support@scichart.com
// Sales:   sales@scichart.com
//
// SCIAnnotationBase.h is part of SCICHART®, High Performance Scientific Charts
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

/** \addtogroup Annotations
 *  @{
 */

#import <Foundation/Foundation.h>
#import "SCIAnnotationProtocol.h"
#import "SCIGenericType.h"
#import "SCIThemeableProtocol.h"

@protocol SCIChartSurfaceProtocol;
@protocol SCIAxis2DProtocol;
@class SCIAxisCollection;

/**
 * @typedef SCIAnnotationCoordMode
 * @abstract Enumeration constants to define the Coordinate mode used to place an annotation.
 * @discussion Possible values:
 * @discussion - SCIAnnotationCoord_Absolute requires that coordinates X1,Y1,X2,Y2 are data-values
 * @discussion - SCIAnnotationCoord_Relative requires X1,Y1,X2,Y2 are double values between 0.0 and 1.0
 * @discussion - SCIAnnotationCoord_RelativeX requires X1,X2 are double values between 0.0 and 1.0
 * @discussion - SCIAnnotationCoord_RelativeY requires Y1,Y2 are double values between 0.0 and 1.0
 */
typedef NS_ENUM(NSUInteger, SCIAnnotationCoordinateMode) {
    /** Requires that coordinates X1,Y1,X2,Y2 are data-values */
    SCIAnnotationCoordinate_Absolute,
    /** Requires X1,Y1,X2,Y2 are double values between 0.0 and 1.0*/
    SCIAnnotationCoordinate_Relative,
    /** Requires X1,X2 are double values between 0.0 and 1.0*/
    SCIAnnotationCoordinate_RelativeX,
    /** Requires Y1,Y2 are double values between 0.0 and 1.0*/
    SCIAnnotationCoordinate_RelativeY
};

/**
 * Provides a base class for annotations to be rendered over the chart
 @see SCIAnnotation
 */
@interface SCIAnnotationBase : NSObject <SCIAnnotationProtocol, SCIThemeableProtocol> {
    @protected
    BOOL _isSelected;
}

/**
 * Gets or sets the SCIAnnotationCoordMode to use when placing the annotation. E.g. the default Absolute requires that X1,Y1,X2,Y2 are data-values.
 */
@property (nonatomic) SCIAnnotationCoordinateMode coordinateMode;

/**
 * Gets whether the current annotation is vertical or not. Returns true when XAxis is vertical
 */
-(BOOL) isVertical;

/**
 * Gets chart frame of the current annotation
 */
-(CGRect)getBindingArea;

/**
 * Gets CGPoint within chart frame of the current annotation
 */
-(CGPoint)pointInBindingArea:(CGPoint)point;

/**
 * Gets CGPoint from data-value
 * @param x X data-value
 * @param y Y data-value
 */
-(CGPoint)getCoordFromDataX:(SCIGenericType)x Y:(SCIGenericType)y;

/**
 * Gets data-value from x coordinate
 * @param x X coordinate
 */
-(SCIGenericType)getDataXFromCoord:(double)x;

/**
 * Gets data-value from y coordinate
 * @param y Y coordinate
 */
-(SCIGenericType)getDataYFromCoord:(double)y;

-(void)invalidateElement;

@end

/** @}*/
