//******************************************************************************
// SCICHART® Copyright SciChart Ltd. 2011-2018. All rights reserved.
//
// Web: http://www.scichart.com
// Support: support@scichart.com
// Sales:   sales@scichart.com
//
// SCIGestureController.h is part of SCICHART®, High Performance Scientific Charts
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

/** \addtogroup ChartModifiers
 *  @{
 */

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol SCIChartSurfaceProtocol;

@interface SCIGestureController : NSObject <UIGestureRecognizerDelegate>

-(id) initWithParent:(id<SCIChartSurfaceProtocol>)parent View:(UIView*)view;

-(void) enablePinchGesture;
-(void) enablePanGesture;
-(void) enableTapGesture;
-(void) enableDoubleTapGesture;

-(void) disablePinchGesture;
-(void) disablePanGesture;
-(void) disableTapGesture;
-(void) disableDoubleTapGesture;

-(void)handlePinchGestureWith:(UIPinchGestureRecognizer*)gesture;
-(void)handlePanGestureWith:(UIPanGestureRecognizer*)gesture;
-(void)handleTapGestureWith:(UITapGestureRecognizer*)gesture;
-(void)handleTapGestureToCancelAnimationWith:(UITapGestureRecognizer*)gesture;
-(void)handleDoubleTapGestureWith:(UITapGestureRecognizer*)gesture;

-(void)handleTouchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event;
-(void)handleTouchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event;
-(void)handleTouchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event;
-(void)handleTouchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event;

@end

/** @}*/
