//******************************************************************************
// SCICHART® Copyright SciChart Ltd. 2011-2018. All rights reserved.
//
// Web: http://www.scichart.com
// Support: support@scichart.com
// Sales:   sales@scichart.com
//
// SCIPenStyle.h is part of SCICHART®, High Performance Scientific Charts
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
#import "SCIStyleProtocol.h"

@class UIColor;

@protocol SCIPenStyleProtocol///
<SCIStyleProtocol, NSCopying>

@property (nonatomic) float thickness;
@property (nonatomic, nullable) NSArray<NSNumber *> *strokeDashArray;
@property (nonatomic, nonnull) UIColor *color;
@property (nonatomic) unsigned int colorCode;
@property (nonatomic) BOOL antialised;

@end

@interface SCIPenStyle : NSObject <SCIPenStyleProtocol>

@end
