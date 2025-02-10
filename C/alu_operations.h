/*
 * File: alu_operations.h
 * Author: Ayoub Yaqine
 * Date: 10/02/2025
 * Description: Header file defining functions for addition, subtraction, and multiplication
 *              of floating-point numbers with fixed-point scaling.
 *              This file includes memory access and ALU register definitions.
 */

#ifndef ALU_OPERATIONS_H
#define ALU_OPERATIONS_H

#include <stdint.h>
#include "memory_access.h"  // Include memory access functions
#include "alu_registers.h"  // Include ALU register definitions

#define FRACTIONAL_BITS 16
#define SCALE_FACTOR (1 << FRACTIONAL_BITS)

// Function prototypes
float add(float a, float b);
float subtract(float a, float b);
float multiply(float a, float b);

#endif // ALU_OPERATIONS_H
