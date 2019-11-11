//******************************************************************************
// SCICHART® Copyright SciChart Ltd. 2011-2018. All rights reserved.
//
// Web: http://www.scichart.com
// Support: support@scichart.com
// Sales:   sales@scichart.com
//
// ISCITexture2D.h is part of SCICHART®, High Performance Scientific Charts
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
#import "SCIDisposableProtocol.h"
#import <CoreGraphics/CoreGraphics.h>

@protocol SCITexture2DProtocol <SCIDisposableProtocol>

@property (nonatomic, readonly) CGSize textureSize;

- (void)updateWithByteData:(unsigned char*)data Width:(int)width Height:(int)height;
- (void)updateWithFloatData:(float*)data Width:(int)width Height:(int)height;

- (void)refresh;
- (void)activate:(uint32_t)unit;
- (void)bind;
- (BOOL)isValid;

@end
