/**************************************************************************/
/*                                                                        */
/*  This file is part of Frama-C.                                         */
/*                                                                        */
/*  Copyright (C) 2007-2016                                               */
/*    CEA (Commissariat à l'énergie atomique et aux énergies              */
/*         alternatives)                                                  */
/*                                                                        */
/*  All rights reserved.                                                  */
/*  Contact CEA LIST for licensing.                                       */
/*                                                                        */
/**************************************************************************/

/* ISO C: 7.12 */

#include "math.h"

/*@ assigns \result \from x; */
double Frama_C_exp(double x);
/*@ assigns \result \from x; */
double exp(double x){
  return Frama_C_exp(x);
}

/*@ assigns \result \from x; */
double Frama_C_cos(double x);
/*@ assigns \result \from x; */
double cos(double x){
  return Frama_C_cos(x);
}

/*@ assigns \result \from x; */
double Frama_C_sin(double x);
/*@ assigns \result \from x; */
double sin(double x){
  return Frama_C_sin(x);
}

/*@ assigns \result \from x; */
double Frama_C_sqrt(double x);
/*@ assigns \result \from x; */
double sqrt(double x)
{
  return Frama_C_sqrt(x);
}

double fabs(double x){
  if(x==0.0) return 0.0;
  if (x>0.0) return x;
  return -x;
}

