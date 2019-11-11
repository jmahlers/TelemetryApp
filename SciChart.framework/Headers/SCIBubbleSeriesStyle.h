//******************************************************************************
// SCICHART® Copyright SciChart Ltd. 2011-2018. All rights reserved.
//
// Web: http://www.scichart.com
// Support: support@scichart.com
// Sales:   sales@scichart.com
//
// SCIBubbleSeriesStyle.h is part of SCICHART®, High Performance Scientific Charts
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
#import "SCIStyleProtocol.h"

@class SCIPenStyle;
@class SCIBrushStyle;

/**
 * @brief The SCIBubbleSeriesStyle class
 * @discussion Provides styling capabilities for SCIBubbleRenderableSeries
 * @see SCIBubbleRenderableSeries
 * @see SCIStyleProtocol
 */
@interface SCIBubbleSeriesStyle : NSObject <SCIStyleProtocol, NSCopying>

/**
 * @brief Defines bubble fill color
 * @code
 * style.bubbleBrush = SCIBrushSolid(colorCode: 0xFF00A0FF)
 * @encode
 * @see SCIBrushStyle
 */
@property (nonatomic, strong) SCIBrushStyle * bubbleBrushStyle;

/**
 * @brief Defines Bubble's outline color and width
 * @code
 * style.borderPen = SCIPenSolid(colorCode: 0xFF00A0FF, width: 1)
 * @encode
 * @see SCIPenStyle
 */
@property (nonatomic, strong) SCIPenStyle * strokeStyle;

/**
 * @brief Defines Bubble's level of detalization or number of edges
 * @discussion The higher value, the better looking circle will be. But it can hit performance, especially with outlines turned on
 * @discussion Default value is 20
 */
@property (nonatomic) int detalization;

@end

/** @} */
