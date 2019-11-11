//******************************************************************************
// SCICHART® Copyright SciChart Ltd. 2011-2018. All rights reserved.
//
// Web: http://www.scichart.com
// Support: support@scichart.com
// Sales:   sales@scichart.com
//
// SCIAnchorPointAnnotation.h is part of SCICHART®, High Performance Scientific Charts
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
#import "SCIAnnotationBase.h"

/**
 * Enumeration constants used by {@link SCIAnchorPointAnnotation} to define horizontal alignment around the X1,Y1 coordinates
 */
typedef NS_ENUM(NSUInteger, SCIHorizontalAnchorPoint) {
	/**
	 * Align Left
	 */
	SCIHorizontalAnchorPoint_Left,
	
	/**
	 * Align Center
	 */
	SCIHorizontalAnchorPoint_Center,
	
	/**
	 * Align Right
	 */
	SCIHorizontalAnchorPoint_Right
};

/**
 * Enumeration constants used by {@link SCIAnchorPointAnnotation} to define vertical alignment around the X1,Y1 coordinates
 */
typedef NS_ENUM(NSUInteger, SCIVerticalAnchorPoint) {
	/**
	 * Align Top
	 */
	SCIVerticalAnchorPoint_Top,
	
	/**
	 * Align Center
	 */
	SCIVerticalAnchorPoint_Center,
	
	/**
	 * Align Bottom
	 */
	SCIVerticalAnchorPoint_Bottom
};

@interface SCIAnchorPointAnnotation : SCIAnnotationBase

@property (nonatomic) SCIHorizontalAnchorPoint horizontalAnchorPoint;
@property (nonatomic) SCIVerticalAnchorPoint verticalAnchorPoint;

@end
