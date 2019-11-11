//******************************************************************************
// SCICHART® Copyright SciChart Ltd. 2011-2018. All rights reserved.
//
// Web: http://www.scichart.com
// Support: support@scichart.com
// Sales:   sales@scichart.com
//
// SCILinearGradientEnum.h is part of SCICHART®, High Performance Scientific Charts
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

#ifndef SCILinearGradientEnum_h
#define SCILinearGradientEnum_h

/**
 @typedef SCILinearGradientDirection
 @brief Enum provides linear gradient directions
 
 @field SCILinearGradientDirection_Vertical color changes from top to bottom
 
 @field SCILinearGradientDirection_Horizontal color changes from left to right
 */
typedef NS_ENUM(int, SCILinearGradientDirection) {
    /** color changes from top to bottom */
    SCILinearGradientDirection_Vertical,
    /** color changes from left to right */
    SCILinearGradientDirection_Horizontal
};

#endif /* SCILinearGradientEnum_h */
