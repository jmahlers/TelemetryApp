//******************************************************************************
// SCICHART® Copyright SciChart Ltd. 2011-2018. All rights reserved.
//
// Web: http://www.scichart.com
// Support: support@scichart.com
// Sales:   sales@scichart.com
//
// SCIResamplingMode.h is part of SCICHART®, High Performance Scientific Charts
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

#ifndef SciChart_ResamplingModeEnum_h
#define SciChart_ResamplingModeEnum_h

/**
 * @typedef SCIResamplingMode
 * @abstract Defines resampling modes (points reduction)
 * @discussion Possible values:
 * @discussion - SCIResamplingMode_None - points will not be reduced
 * @discussion - SCIResamplingMode_MinMax - for every pixel on screen will be produced 2 points at min and max values for pixel
 * @discussion - SCIResamplingMode_Mid - for every pixel on screen will be produced only one avarage point
 * @discussion - SCIResamplingMode_Max - for every pixel on screen will be produced only one point at maximum value
 * @discussion - SCIResamplingMode_Min - for every pixel on screen will be produced only one point at minimum value
 * @discussion - SCIResamplingMode_MinMaxWithUnevenSpacing - for every pixel on screen will be produced 2 points at min and max values for pixel. Slower than SCIResamplingMode_MinMax, designed for unevenly spaced data
 * @discussion - SCIResamplingMode_Auto - not implemented at the moment
 */
typedef NS_ENUM(int, SCIResamplingMode) {
    /** points will not be reduced */
    SCIResamplingMode_None,
    /** for every pixel on screen will be produced 2 points at min and max values for pixel */
    SCIResamplingMode_MinMax,
    /** for every pixel on screen will be produced only one avarage point */
    SCIResamplingMode_Mid,
    /** or every pixel on screen will be produced only one point at maximum value */
    SCIResamplingMode_Max,
    /** for every pixel on screen will be produced only one point at minimum value */
    SCIResamplingMode_Min,
    /** for every pixel on screen will be produced 2 points at min and max values for pixel. Slower than SCIResamplingMode_MinMax, designed for unevenly spaced data */
    SCIResamplingMode_MinMaxWithUnevenSpacing,
    /** not implemented at the moment */
    SCIResamplingMode_Auto
};

#endif
