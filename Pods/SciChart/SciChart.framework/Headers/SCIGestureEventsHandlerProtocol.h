//******************************************************************************
// SCICHART® Copyright SciChart Ltd. 2011-2018. All rights reserved.
//
// Web: http://www.scichart.com
// Support: support@scichart.com
// Sales:   sales@scichart.com
//
// SCIGestureEventsHandlerProtocol.h is part of SCICHART®, High Performance Scientific Charts
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

/** \addtogroup Annotations
 *  @{
 */

/**
 */
@protocol SCIGestureEventsHandlerProtocol ///
<NSObject>
/** @{ @} */

-(BOOL) pointWithinBounds:(CGPoint)point;

-(BOOL) onTapGesture:(UITapGestureRecognizer*)gesture At:(UIView*)view;
-(BOOL) onPanGesture:(UIPanGestureRecognizer*)gesture At:(UIView*)view;
-(BOOL) onPinchGesture:(UIPinchGestureRecognizer*)gesture At:(UIView*)view;
-(BOOL) onDoubleTapGesture:(UITapGestureRecognizer*)gesture At:(UIView*)view;

-(BOOL) onTapGestureToCancelAnimation:(UITapGestureRecognizer*)gesture At:(UIView*)view;

-(BOOL)onTouchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event;
-(BOOL)onTouchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event;
-(BOOL)onTouchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event;
-(BOOL)onTouchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event;

@end

/** @} */

