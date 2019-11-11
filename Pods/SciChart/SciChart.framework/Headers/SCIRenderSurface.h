//******************************************************************************
// SCICHART® Copyright SciChart Ltd. 2011-2018. All rights reserved.
//
// Web: http://www.scichart.com
// Support: support@scichart.com
// Sales:   sales@scichart.com
//
// SCIRenderSurface.h is part of SCICHART®, High Performance Scientific Charts
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

#import "SCIInvalidatableElementProtocol.h"
#import <QuartzCore/QuartzCore.h>
#import "SCICallbackBlock.h"
#import "SCIAnimationContextInvalidate.h"

@protocol SCIRenderContext2DProtocol;
@class FrameworkElement;
@protocol SCIRenderSurfaceCallbackDelegateProtocol;
@class UIView;
@class SCIRenderSurfaceStyle;

@protocol SCIRenderSurfaceProtocol <NSObject, SCIInvalidatableElementProtocol, SCIAnimationContextInvalidate>

@property (nonatomic, weak) id<SCIRenderSurfaceCallbackDelegateProtocol> delegate;
@property (nonatomic) BOOL multisampling;

-(void) clear;
-(void) free;
-(void) clearRenderSurface;
-(void) clearModifiers;

-(id<SCIRenderContext2DProtocol>) modifierContext;
-(id<SCIRenderContext2DProtocol>) backgroundContext;

/**
 Context is used for drawing axis grid lines.
 @return Return context in which axis grind lines should be drawn.
 */
-(id<SCIRenderContext2DProtocol>) secondaryContext;

/**
 Render context is used for drawing renderable series in different render loop. There are two render loops in which the context can be used.
 It is animation render loop and main render loop.
 */
-(id<SCIRenderContext2DProtocol>) renderContext;

@property (nonatomic, weak) UIView * chartFrameView;

-(CGRect)frame;
-(CGRect)chartFrame;
-(BOOL) isPointWithinBounds:(CGPoint)point;
-(CGPoint)pointInChartFrame:(CGPoint)point;

-(void) drawBackground:(id<SCIRenderContext2DProtocol>)context Style:(SCIRenderSurfaceStyle*)style;

@property (nonatomic) BOOL reduceCPUFrames;
@property (nonatomic) BOOL reduceGPUFrames;

@property (nonatomic, copy) SCIActionBlock_Pint renderedCallback;

@property (nonatomic) BOOL isTransparent;

//@BEGINDELETE
-(void) resetWatermark;
//@ENDDELETE

@end
