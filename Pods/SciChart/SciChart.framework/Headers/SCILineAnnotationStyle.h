//******************************************************************************
// SCICHART® Copyright SciChart Ltd. 2011-2018. All rights reserved.
//
// Web: http://www.scichart.com
// Support: support@scichart.com
// Sales:   sales@scichart.com
//
// SCILineAnnotationStyle.h is part of SCICHART®, High Performance Scientific Charts
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

/** \addtogroup Themes
 *  @{
 */

#import <Foundation/Foundation.h>
#import "SCICallbackBlock.h"
#import "SCIAnnotationStyleEnums.h"
#import "SCIStyleProtocol.h"

@class SCIPenStyle;
@protocol SCIPointMarkerProtocol;

/**
 * @abstract SCILineAnnotationStyle class
 * @discussion Contains properties for line annotation theming and customization
 * @see SCILineAnnotation
 */
@interface SCILineAnnotationStyle : NSObject <SCIStyleProtocol, NSCopying>

/**
 * @abstract Point marker that will be displayed on line ends when interaction with annotation started
 * @see SCIPointMarkerProtocol
 */
@property (nonatomic, strong) id<SCIPointMarkerProtocol> resizeMarker;

/**
 * @abstract Pen with which line annotation is drawn on chart surface
 * @discussion Defines line width and color
 * @see SCIPen2DProtocol
 */
@property (nonatomic, strong) SCIPenStyle *linePen;

/**
 * @abstract Defines width of line's "hit body"
 * @discussion It is distance at which user should tap to select line annotation
 * @discussion The greater value the easier to select line annotation by tapping on it
 */
@property (nonatomic) double selectRadius;

/**
 * @abstract Defines width of line ends' point markers "hit body"
 * @discussion It's distance at which user should tap and pan at line ends' point markers to interact with line annotation
 * @discussion The greater value, the easier will be to resize or move line annotation by dragging it's ends
 */
@property (nonatomic) double resizeRadius;

/**
 * @abstract Defines layer (above chart or below chart) on which annotation is displayed
 * @see SCIAnnotationSurfaceEnum
 */
@property (nonatomic) SCIAnnotationSurfaceEnum annotationSurface;

@end

/** @}*/
