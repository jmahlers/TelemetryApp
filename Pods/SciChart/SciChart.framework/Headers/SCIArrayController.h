//******************************************************************************
// SCICHART® Copyright SciChart Ltd. 2011-2018. All rights reserved.
//
// Web: http://www.scichart.com
// Support: support@scichart.com
// Sales:   sales@scichart.com
//
// SCIArrayController.h is part of SCICHART®, High Performance Scientific Charts
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

/** \addtogroup DataSeries
 *  @{
 */

#import <Foundation/Foundation.h>
#import "SCIArrayControllerProtocol.h"

/**
 * The Class implements only SCIArrayControllerProtocol. More details you can see in SCIArrayControllerProtocol. The class is used by all dataSeries which is not category. The main idea of the class is providing simple interface to work with array of pointers on simple types (e.g. double, integer etc.)
 * @see SCIArrayControllerProtocol
 */
@interface SCIArrayController : NSObject <SCIArrayControllerProtocol> {
    /**
     * Instance variables for private using in classes which inheriting SCIArrayController.
     */
@protected
    /**
     * Array of values.
     */
    void * _data;
    
    /**
     * Max count of current array.
     */
    int _maxSize;
    
    /**
     * Count of values in array.
     */
    int _count;
    
    /**
     * Type of values in array.
     * @see SCIDataType
     */
    SCIDataType _type;
}

@end

/** @}*/
