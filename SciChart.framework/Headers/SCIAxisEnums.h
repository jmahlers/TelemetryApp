//******************************************************************************
// SCICHART® Copyright SciChart Ltd. 2011-2018. All rights reserved.
//
// Web: http://www.scichart.com
// Support: support@scichart.com
// Sales:   sales@scichart.com
//
// SCIAxisEnums.h is part of SCICHART®, High Performance Scientific Charts
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

/** \addtogroup Axis
 *  @{
 */

#ifndef SciChart_AxisEnums_h
#define SciChart_AxisEnums_h

/**
 * @typedef SCIAxisAlignment
 * @abstract Enumeration constants to define the alignment mode used to place an axis.
 * @discussion Possible values:
 * @discussion - SCIAxisAlignment_Default An element stretched to fill the entire layout slot for the parent element
 * @discussion - SCIAxisAlignment_Right An element aligned to the right of the layout slot for the parent element
 * @discussion - SCIAxisAlignment_Left An element aligned to the left of the layout slot for the parent element
 * @discussion - SCIAxisAlignment_Top An element aligned to the top of the layout slot for the parent element
 * @discussion - SCIAxisAlignment_Bottom An element aligned to the bottom of the layout slot for the parent element
 */
typedef NS_ENUM(int, SCIAxisAlignment) {
    /** An element stretched to fill the entire layout slot for the parent element*/
    SCIAxisAlignment_Default,
    /** An element aligned to the left of the layout slot for the parent element*/
    SCIAxisAlignment_Left,
    /** An element aligned to the top of the layout slot for the parent element*/
    SCIAxisAlignment_Top,
    /** An element aligned to the right of the layout slot for the parent element*/
    SCIAxisAlignment_Right,
    /** An element aligned to the bottom of the layout slot for the parent element*/
    SCIAxisAlignment_Bottom
};

#endif

/** @}*/
