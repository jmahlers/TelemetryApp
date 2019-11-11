//******************************************************************************
// SCICHART® Copyright SciChart Ltd. 2011-2018. All rights reserved.
//
// Web: http://www.scichart.com
// Support: support@scichart.com
// Sales:   sales@scichart.com
//
// SCICallbackBlock.h is part of SCICHART®, High Performance Scientific Charts
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

#ifndef SciChart_DelegateBlock_h
#define SciChart_DelegateBlock_h

typedef void (^SCIActionBlock) (void);
typedef void (^SCIActionBlock_Pint) (int);

typedef id (^SCIFuncBlock_Rid) (void);
typedef double (^SCIFuncBlock_RdoublePint) (int);
typedef double (^SCIFuncBlock_RdoublePdouble) (double);
typedef bool (^SCIFuncBlock_Rbool) (void);
typedef id (^SCIFunc_RidPidPdoublePdouble) (id, double, double);
typedef id (^SCIFunc_RidPdoublePdouble) (double, double);

typedef id (^SCIFunc_RidP1) (id);
typedef id (^SCIFunc_RidP2) (id, id);
typedef id (^SCIFunc_RidP3) (id, id, id);

#endif
