//******************************************************************************
// SCICHART® Copyright SciChart Ltd. 2011-2018. All rights reserved.
//
// Web: http://www.scichart.com
// Support: support@scichart.com
// Sales:   sales@scichart.com
//
// SCILabelProviderProtocol.h is part of SCICHART®, High Performance Scientific Charts
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

#import "SCIGenericType.h"

@protocol SCIAxisCoreProtocol;
@protocol SCITickLabelProtocol;
@class SCITextFormattingStyle;
@class SCIDefaultTickLabel;

/**
 * Protocol to define a LabelProvider which allows programmatic overriding of axis labels.
 */
@protocol SCILabelProviderProtocol <NSObject>

/**
 * Sets the axis which will be associated with this provider.
 */
- (void)setAxis:(id<SCIAxisCoreProtocol>)parentAxis;

/**
 * Called right before axis drawing.
 */
- (void)onBeginAxisDraw;

/**
 * Updates provider with new data.
 */
- (id<SCITickLabelProtocol>)updateDataContextWithContext:(SCIDefaultTickLabel *)label Data:(SCIGenericType)dataValue Style:(SCITextFormattingStyle *)style;

/**
 * Formats a label for the axis from the specified data-value passed in
 * @param dataValue The data value to format
 * @return The formatted value
 */
//- (NSString *)formatLabel:(SCIGenericType)dataValue;
- (NSAttributedString *)formatLabel:(SCIGenericType)dataValue;

/**
 * Formats a label for the cursor, from the specified data-value passed in
 * @param dataValue The data value to format
 * @return The formatted value
 */
//- (NSString *)formatCursorLabel:(SCIGenericType)dataValue;
- (NSAttributedString *)formatCursorLabel:(SCIGenericType)dataValue;

@end
