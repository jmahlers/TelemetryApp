//******************************************************************************
// SCICHART® Copyright SciChart Ltd. 2011-2018. All rights reserved.
//
// Web: http://www.scichart.com
// Support: support@scichart.com
// Sales:   sales@scichart.com
//
// SCILegendPosition.h is part of SCICHART®, High Performance Scientific Charts
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

/**
 * @brief The Enum defines a position of the legend on chartSurface.
 */
typedef NS_OPTIONS(NSUInteger, SCILegendPosition) {
    
    /** Means that The holderLegendView doesn't add to chart surface. And user can add the holderLegendView to any other view. */
    SCILegendPositionNone   = 0,
    
    /** Other variants means the location of holderLegendView on the chartSurface. */
    SCILegendPositionLeft   = 1 << 0,
    SCILegendPositionRight  = 1 << 1,
    SCILegendPositionTop    = 1 << 2,
    SCILegendPositionBottom = 1 << 3,
    SCILegendPositionCenter = 1 << 4,
};
