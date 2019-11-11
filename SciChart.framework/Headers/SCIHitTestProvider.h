//******************************************************************************
// SCICHART® Copyright SciChart Ltd. 2011-2018. All rights reserved.
//
// Web: http://www.scichart.com
// Support: support@scichart.com
// Sales:   sales@scichart.com
//
// SCIHitTestProvider.h is part of SCICHART®, High Performance Scientific Charts
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

/** \addtogroup HitTest
 *  @{
 */

#import "SCIGenericType.h"

@protocol SCIRenderPassDataProtocol;

@protocol SCIHitTestProviderProtocol <NSObject>

typedef NS_ENUM(int, SCIHitTestMode) {
    SCIHitTest_Default,
    SCIHitTest_Point,
    SCIHitTest_Vertical,
    SCIHitTest_Interpolate,
    SCIHitTest_VerticalInterpolate,
};

typedef struct {
    BOOL match;
    int index;
    double x;
    double y;
    SCIGenericType xValue;
    SCIGenericType yValue;
    SCIGenericType xValueInterpolated;
    SCIGenericType yValueInterpolated;
    SCIGenericType y2Value;
    SCIGenericType y2ValueInterpolated;
    SCIGenericType zValue;
    SCIGenericType zValueInterpolated;
    SCIGenericType openValue;
    SCIGenericType highValue;
    SCIGenericType lowValue;
    SCIGenericType closeValue;
    double radius;
} SCIHitTestInfo;

@property (nonatomic) SCIHitTestMode hitTestMode;

-(SCIHitTestInfo) hitTestAtX:(double)x Y:(double)y Radius:(double)radius onData:(id<SCIRenderPassDataProtocol>)data;

-(SCIHitTestInfo) hitTestVerticalAtX:(double)x Y:(double)y Radius:(double)radius onData:(id<SCIRenderPassDataProtocol>)data;

-(SCIHitTestInfo) hitTestAtX:(double)x Y:(double)y Radius:(double)radius onData:(id<SCIRenderPassDataProtocol>)data Mode:(SCIHitTestMode)mode;

-(SCIHitTestInfo) hitTestPointModeAtX:(double)x Y:(double)y Radius:(double)radius onData:(id<SCIRenderPassDataProtocol>)data;

-(SCIHitTestInfo) hitTestInterpolateModeAtX:(double)x Y:(double)y Radius:(double)radius onData:(id<SCIRenderPassDataProtocol>)data;

-(SCIHitTestInfo) hitTestVerticalModeAtX:(double)x Y:(double)y Radius:(double)radius onData:(id<SCIRenderPassDataProtocol>)data;

-(SCIHitTestInfo) hitTestVerticalInterpolateModeAtX:(double)x Y:(double)y Radius:(double)radius onData:(id<SCIRenderPassDataProtocol>)data;

@end

/** @}*/
