//******************************************************************************
// SCICHART® Copyright SciChart Ltd. 2011-2018. All rights reserved.
//
// Web: http://www.scichart.com
// Support: support@scichart.com
// Sales:   sales@scichart.com
//
// SCIAxisAreaSizeSynchronization.h is part of SCICHART®, High Performance Scientific Charts
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

/** \addtogroup Axis
 *  @{
 */

#import <Foundation/Foundation.h>

typedef NS_OPTIONS(int, SCIAxisSizeSyncMode) {
    SCIAxisSizeSync_Left = 1 << 0,
    SCIAxisSizeSync_Right = 1 << 1,
    SCIAxisSizeSync_Top = 1 << 2,
    SCIAxisSizeSync_Bottom = 1 << 3
};

@protocol SCIChartSurfaceProtocol;

@interface SCIAxisAreaSizeSynchronization : NSObject

-(void) attachSurface:(id<SCIChartSurfaceProtocol>)surface;
-(void) detachSurface:(id<SCIChartSurfaceProtocol>)surface;

@property (nonatomic) SCIAxisSizeSyncMode syncMode;

@end

/** @}*/
