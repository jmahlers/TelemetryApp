//******************************************************************************
// SCICHART® Copyright SciChart Ltd. 2011-2018. All rights reserved.
//
// Web: http://www.scichart.com
// Support: support@scichart.com
// Sales:   sales@scichart.com
//
// SCIThemeColorProvider.h is part of SCICHART®, High Performance Scientific Charts
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
#import "SCIThemeProviderProtocol.h"

/**
 * Defines a SciChart Theme color provider, which provides theme colors for SCIChartSurface
 */
@interface SCIThemeColorProvider : NSObject <SCIThemeProviderProtocol>

/**
 * Creates theme provider based on specified style
 *
 * @param themeKey The key of style which should be used as base for this theme provider
 */
- (nullable instancetype)initWithThemeKey:(nonnull NSString*)themeKey;

@end

/** @} */
