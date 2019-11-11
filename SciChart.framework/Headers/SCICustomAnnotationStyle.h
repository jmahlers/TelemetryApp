//******************************************************************************
// SCICHART® Copyright SciChart Ltd. 2011-2018. All rights reserved.
//
// Web: http://www.scichart.com
// Support: support@scichart.com
// Sales:   sales@scichart.com
//
// SCICustomAnnotationStyle.h is part of SCICHART®, High Performance Scientific Charts
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
#import "SCIStyleProtocol.h"
@protocol SCIPointMarkerProtocol;

/**
 * @abstract SCICustomAnnotationStyle class
 * @discussion Contains properties for custom annotation theming and customization
 * @see SCICustomAnnotation
 */
@interface SCICustomAnnotationStyle : NSObject <SCIStyleProtocol, NSCopying>

/**
 * @abstract Point marker that will be displayed on custom annotation's corners when interaction with annotation started
 */
@property (nonatomic, strong) id<SCIPointMarkerProtocol> resizeMarker;

/**
 * @abstract Defines width of box "hit body"
 * @discussion It is maximal distance from box edge at which user can select box annotation by tapping
 * @discussion The greater value the easier to select box annotation by tapping on it
 */
@property (nonatomic) double selectRadius;
/**
 * @abstract Defines width of box corners' point markers "hit body"
 * @discussion It maximal distance from box corners at which user can tap and pan to start interactaction with annotation
 * @discussion The greater value, the easier will be to resize or move box annotation by dragging it's corners
 */
@property (nonatomic) double resizeRadius;

@end
