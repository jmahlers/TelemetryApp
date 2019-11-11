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
#import <CoreGraphics/CoreGraphics.h>
#import "SCIDisposableBase.h"
#import "SCITexture2DProtocol.h"

struct TSRTexture;
@class UIImage, UIColor;
@protocol SCIRenderContext2DProtocol;

@interface SCITextureMetal : SCIDisposableBase<SCITexture2DProtocol>

@property (nonatomic) NSArray <UIColor *> *colors;
@property (nonatomic) NSArray <NSNumber *> *stops;
@property (nonatomic) CGSize textureSize;

-(instancetype)initWithTexture:(struct TSRTexture*)_pTexture;

-(instancetype)initWithByteData:(unsigned char*)data Width:(int)width Height:(int)height;
-(instancetype)initWithByteData:(unsigned char*)data Width:(int)width Height:(int)height WrapParameter:(int)wrapParameter;
-(instancetype)initWithImage:(UIImage*)image;
-(instancetype)initWithFloatData:(float*)data Width:(int)width Height:(int)height;
-(instancetype)initWithGradientCoords:(float*)coords Colors:(uint*)colors Count:(int)count;
-(instancetype)initWithGradientCoords:(float*)coords Colors:(uint*)colors Count:(int)count Detalization:(int)detalization;


-(void)updateWithByteData:(unsigned char*)data Width:(int)width Height:(int)height;
-(void)updateWithFloatData:(float*)data Width:(int)width Height:(int)height;

-(struct TSRTexture*)internalTexture;
-(BOOL) isValid;
-(void) refresh;

@end
