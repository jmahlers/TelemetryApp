//******************************************************************************
// SCICHART® Copyright SciChart Ltd. 2011-2018. All rights reserved.
//
// Web: http://www.scichart.com
// Support: support@scichart.com
// Sales:   sales@scichart.com
//
// SCITextureBrushStyle.h is part of SCICHART®, High Performance Scientific Charts
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

#import <UIKit/UIKit.h>
#import "SCIBrushStyle.h"
#import "SCITexture2DProtocol.h"

@class SCITextureOpenGL;

@interface SCITextureBrushStyle : SCIBrushStyle

- (nonnull instancetype)initWithImage:(UIImage *)image;

- (nonnull instancetype)initWithTexture:(nonnull id<SCITexture2DProtocol>)texture;

- (nonnull instancetype)initWithTexture:(nonnull id<SCITexture2DProtocol>)texture colorCode:(unsigned int)color;

- (nonnull instancetype)initWithTexture:(nonnull id<SCITexture2DProtocol>)texture color:(nonnull UIColor *)color;

@property (nonatomic, strong, nonnull) id<SCITexture2DProtocol> texture;

@end
