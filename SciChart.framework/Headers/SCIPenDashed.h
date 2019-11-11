//******************************************************************************
// SCICHART® Copyright SciChart Ltd. 2011-2018. All rights reserved.
//
// Web: http://www.scichart.com
// Support: support@scichart.com
// Sales:   sales@scichart.com
//
// SCIPenDashed.h is part of SCICHART®, High Performance Scientific Charts
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
#import "SCIPen2D.h"

@class UIImage;
@protocol SCIRenderContext2DProtocol;

/**
 @brief Pen with stroke thickness and can use texture image or dashed params for custom appearence of line.
 @see SCIPen2DProtocol
 */
@interface SCIPenDashed : NSObject <SCIPen2DProtocol>

/**
 @brief Constructor creates pen with given color and stroke thickness and dashed params.
 @params dashArray - An array of values that specify the lengths of the painted segments and unpainted segments, respectively, of the dash pattern—or NULL for no dash pattern.
 For example, passing an array with the values [2,3] sets a dash pattern that alternates between a 2-user-space-unit-long painted segment and a 3-user-space-unit-long unpainted segment. Passing the values [1,3,4,2] sets the pattern to a 1-unit painted segment, a 3-unit unpainted segment, a 4-unit painted segment, and a 2-unit unpainted segment.
 
 */
- (nonnull instancetype)initWithColorCode:(uint)color
                                    width:(float)width
                      withStrokeDashArray:(nonnull NSArray<NSNumber*>*)dashArray;

- (nonnull instancetype)initWithColor:(nonnull UIColor *)color
                                width:(float)width
                  withStrokeDashArray:(nonnull NSArray<NSNumber*>*)dashArray;

/**
 @brief Constructor creates pen with given color and stroke thickness and dashed params.
 @params color - Color which is used for filling an texture image.
 @params width - Width of line. Usually width should be equal to width of texture image.
 @params textureImage - An image which is converted into openGL Texture and use for drawing the line. Color of image is ignored.
 */
- (nonnull instancetype)initWithColor:(nonnull UIColor *)color
                                width:(float)width
                     withImageTexture:(nonnull UIImage*)textureImage;

/**
 @brief The same constructors but with additional parameter for particular context.
 */
- (nonnull instancetype)initWithColorCode:(uint)color
                                    width:(float)width
                      withStrokeDashArray:(nonnull NSArray<NSNumber*>*)dashArray
                            renderContext:(nullable id<SCIRenderContext2DProtocol>)renderContext;

- (nonnull instancetype)initWithColor:(nonnull UIColor *)color
                                width:(float)width
                  withStrokeDashArray:(nonnull NSArray<NSNumber*>*)dashArray
                        renderContext:(nullable id<SCIRenderContext2DProtocol>)renderContext;

- (nonnull instancetype)initWithColor:(nonnull UIColor *)color
                                width:(float)width
                     withImageTexture:(nonnull UIImage*)textureImage
                        renderContext:(nullable id<SCIRenderContext2DProtocol>)renderContext;

@end
