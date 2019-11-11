//******************************************************************************
// SCICHART® Copyright SciChart Ltd. 2011-2018. All rights reserved.
//
// Web: http://www.scichart.com
// Support: support@scichart.com
// Sales:   sales@scichart.com
//
// SCILinearGradientBrush.h is part of SCICHART®, High Performance Scientific Charts
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

#import "SCILinearGradientEnum.h"

/**
 @brief Protocol defines gradient brushes and pens. Class should implement SCIBrush2D or SCIPen2D too.
 @see SCIBrush2DProtocol
 @see SCIPen2DProtocol
 */
@protocol SCILinearGradientBrushProtocol <NSObject>

/**
 @brief Defines gradient starting coordinate. Gradient color changes from minCoord to maxCoord
 @discussion coordinate should be either X or Y depending on gradient direction
 */
@property (nonatomic) float minCoord;
/**
 @brief Defines gradient finish coordinate. Gradient color changes from minCoord to maxCoord
 @discussion coordinate should be either X or Y depending on gradient direction
 */
@property (nonatomic) float maxCoord;

/**
 @brief Returns gradient direction set for brush instance
 */
-(SCILinearGradientDirection)direction;

/**
 @brief Returns index of gradient which is used in brush atlas controller
 @remark For internal use
 */
@property (nonatomic) float gradientIndex;

/**
 @brief Method for getting colors array and color array size
 @param data Gradient color array. Out parameter.
 @param size gradient array size. Out parameter.
 */
-(void) getGradientData:(uint**)data size:(int*)size;

@end
