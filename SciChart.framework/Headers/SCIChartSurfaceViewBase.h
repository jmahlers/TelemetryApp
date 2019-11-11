//******************************************************************************
// SCICHART® Copyright SciChart Ltd. 2011-2018. All rights reserved.
//
// Web: http://www.scichart.com
// Support: support@scichart.com
// Sales:   sales@scichart.com
//
// SCIChartSurfaceViewBase.h is part of SCICHART®, High Performance Scientific Charts
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

/** \addtogroup Visuals
 *  @{
 */

#import <Foundation/Foundation.h>
#import <UIKit/UiKit.h>
#import "SCICallbackBlock.h"

@protocol SCIRenderSurfaceProtocol;
@class SCIAxisArea;

@interface SCIChartSurfaceViewBase : UIView

@property (strong, nonatomic) IBOutlet id<SCIRenderSurfaceProtocol> renderSurface;
@property (weak, nonatomic) IBOutlet UIView *renderSurfaceSizeView;

@property (weak, nonatomic) IBOutlet SCIAxisArea *leftAxesArea;
@property (weak, nonatomic) IBOutlet SCIAxisArea *rightAxesArea;
@property (weak, nonatomic) IBOutlet SCIAxisArea *topAxesArea;
@property (weak, nonatomic) IBOutlet SCIAxisArea *bottomAxesArea;
@property (weak, nonatomic) IBOutlet UILabel *chartTitleLabel;
@property (weak, nonatomic) IBOutlet UIView *chartTitleHolderView;

@property (nonatomic) float leftAxisAreaSize;
@property (nonatomic) float rightAxisAreaSize;
@property (nonatomic) float topAxisAreaSize;
@property (nonatomic) float bottomAxisAreaSize;

@property (nonatomic) float leftAxisAreaForcedSize;
@property (nonatomic) float rightAxisAreaForcedSize;
@property (nonatomic) float topAxisAreaForcedSize;
@property (nonatomic) float bottomAxisAreaForcedSize;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *leftPanelSize;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *leftPanelSizeLimit;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *rightPanelSize;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *rightPanelSizeLimit;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topPanelSize;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topPanelSizeLimit;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomPanelSize;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomPanelSizeLimit;


-(void) setChartTitleLabelInsets:(UIEdgeInsets)chartTitleLabelInsets;

@end

/** @}*/
