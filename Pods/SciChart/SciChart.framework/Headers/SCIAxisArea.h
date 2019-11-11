//******************************************************************************
// SCICHART® Copyright SciChart Ltd. 2011-2018. All rights reserved.
//
// Web: http://www.scichart.com
// Support: support@scichart.com
// Sales:   sales@scichart.com
//
// SCIAxisArea.h is part of SCICHART®, High Performance Scientific Charts
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
#import <UIKit/UIKit.h>
#import "SCICallbackBlock.h"

typedef NS_ENUM(int, SCIStackPanelOrientation) {
    SCIStackPanelOrientation_Vertical,
    SCIStackPanelOrientation_Horizontal
};

@protocol SCIAxis2DProtocol;

@interface SCIAxisArea : UIView

@property (nonatomic) SCIStackPanelOrientation orientation;

-(int) count;
-(id<SCIAxis2DProtocol>)itemAt:(int)index;
-(void)addItem:(id<SCIAxis2DProtocol>)item;
-(void)insertItem:(id<SCIAxis2DProtocol>)item At:(int)index;
-(BOOL)contains:(id<SCIAxis2DProtocol>)item;
-(void)removeItem:(id<SCIAxis2DProtocol>)item;
-(void)removeItemAt:(int)index;
-(void) removeAll;
-(void)clear;

-(void)layout;

-(float)recommendedSize;
@property (nonatomic, copy) SCIActionBlock resizeRequest;
-(BOOL) hasEnoughSpace;
-(BOOL)needResizing;

@property (nonatomic) float forcedSize;

@end

/** @}*/