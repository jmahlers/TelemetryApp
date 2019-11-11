//******************************************************************************
// SCICHART® Copyright SciChart Ltd. 2011-2018. All rights reserved.
//
// Web: http://www.scichart.com
// Support: support@scichart.com
// Sales:   sales@scichart.com
//
// SCIBrushPalettedTexture.h is part of SCICHART®, High Performance Scientific Charts
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
#import "SCIBrush2D.h"
#import "SCITexturedBrush.h"
#import "SCITexture2DProtocol.h"

@interface SCIBrushPalettedTexture : NSObject <SCIBrush2DProtocol, SCITexturedBrushProtocol>

-(instancetype)initWithTexture:(id<SCITexture2DProtocol>)map Palette:(id<SCITexture2DProtocol>)palette;

@property (nonatomic, strong, readonly) id<SCITexture2DProtocol> palette;

@end
