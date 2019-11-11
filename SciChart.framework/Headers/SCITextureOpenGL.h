//******************************************************************************
// SCICHART® Copyright SciChart Ltd. 2011-2018. All rights reserved.
//
// Web: http://www.scichart.com
// Support: support@scichart.com
// Sales:   sales@scichart.com
//
// SCITextureOpenGL.h is part of SCICHART®, High Performance Scientific Charts
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
#import <OpenGLES/ES2/gl.h>
#import <CoreGraphics/CoreGraphics.h>
#import "SCIDisposableBase.h"
#import "SCITexture2DProtocol.h"

@class UIImage, UIColor;

@protocol SCIRenderContext2DProtocol;

@interface SCITextureOpenGL : SCIDisposableBase<SCITexture2DProtocol>

@property (nonatomic, readonly) CGSize textureSize;

- (instancetype)initWithByteData:(GLubyte*)data Width:(int)width Height:(int)height;
- (instancetype)initWithByteData:(GLubyte*)data Width:(int)width Height:(int)height WrapParameter:(GLint)wrapParameter;
- (instancetype)initWithImage:(UIImage*)image;
- (instancetype)initWithGradientCoords:(float*)coords Colors:(uint*)colors Count:(int)count;
- (instancetype)initWithFloatData:(GLfloat*)data Width:(int)width Height:(int)height;

- (void)updateWithByteData:(GLubyte*)data Width:(int)width Height:(int)height;
- (void)updateWithFloatData:(GLfloat*)data Width:(int)width Height:(int)height;

- (GLuint)textureId;
- (BOOL) isValid;

@end
