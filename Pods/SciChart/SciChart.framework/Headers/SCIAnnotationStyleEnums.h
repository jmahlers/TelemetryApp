//******************************************************************************
// SCICHART® Copyright SciChart Ltd. 2011-2018. All rights reserved.
//
// Web: http://www.scichart.com
// Support: support@scichart.com
// Sales:   sales@scichart.com
//
// SCIAnnotationStyleEnums.h is part of SCICHART®, High Performance Scientific Charts
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

/**
 @file
 */

/**
 * @typedef SCIAnnotationSurfaceEnum
 * @brief Enum of annotation placement modes.
 */
typedef NS_ENUM(NSUInteger, SCIAnnotationSurfaceEnum) {
    /** annotation will be on top of charts */
    SCIAnnotationSurface_AboveChart,
    /** annotation will be below charts */
    SCIAnnotationSurface_BelowChart,
    /** annotation will be on X axis */
    SCIAnnotationSurface_XAxis,
    /** annotation will be on Y axis */
    SCIAnnotationSurface_YAxis
};

/** @}*/
