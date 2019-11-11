//******************************************************************************
// SCICHART® Copyright SciChart Ltd. 2011-2018. All rights reserved.
//
// Web: http://www.scichart.com
// Support: support@scichart.com
// Sales:   sales@scichart.com
//
// SCILegendItemViewProtocol.h is part of SCICHART®, High Performance Scientific Charts
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

#import <UIKit/UIKit.h>
#import "SCILegendItem.h"
#import "SCILegendCellStyle.h"

typedef void(^SCILegendCheckAction)(SCILegendItem * _Nonnull legendItem, BOOL checked);

/**
 * SCILegendItemViewProtocol
 */
__deprecated_msg("Please use SCILegendItemProtocol instead.")
@protocol SCILegendItemViewProtocol ///
<NSObject>
/** @{ @} */

@required

/**
 Callback of check box action.
 */
@property (copy, nullable) SCILegendCheckAction checkActionHandler;

- (void)setCheckActionHandler:(nullable SCILegendCheckAction)checkActionHandler;

/**
 Configurate view with model of renderable series

 @param item SCILegendItem
 */
- (void)setupWithItem:(nonnull SCILegendItem*)item;


/**
 Name of nib for creating instance of the class from xib file with all needed constraints. Return nil if the class does not have xib.

 @return nib name.
 */
+ (nullable NSString*)nibName;

@optional

/**
 Configurate view with custom style. Called when legend modifier has own style.
 */
- (void)setCustomStyleForCell:(nonnull SCILegendCellStyle *)style;

@end

/** @}*/
