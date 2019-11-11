//******************************************************************************
// SCICHART® Copyright SciChart Ltd. 2011-2018. All rights reserved.
//
// Web: http://www.scichart.com
// Support: support@scichart.com
// Sales:   sales@scichart.com
//
// SCITexturedBrush.h is part of SCICHART®, High Performance Scientific Charts
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

@class SCITextureOpenGL;

/**
 @brief Protocol defines brush that use texture for drawing. Class should implement SCIBrush2D or SCIPen2D too.
 @see SCIBrush2DProtocol
 @see SCIPen2DProtocol
 */
@protocol SCITexturedBrushProtocol ///
 <NSObject,NSCopying>
/** @{ @} */

/**
 @brief Get OpenGl texture assigned to brush
 @see SCITextureOpenGL
 */
@property (nonatomic, strong, readonly) SCITextureOpenGL* texture;

@end
