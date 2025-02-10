/*
 * File: memory_access.h
 * Author: Ayoub Yaqine
 * Date: 10/02/2025
 * Description: Header file defining functions for writing to and reading from a specific memory address.
 *              This file is intended to be included in source files that perform memory operations.
 */

#ifndef MEMORY_ACCESS_H
#define MEMORY_ACCESS_H

#include <stdint.h>

// Function to write a 32-bit integer to a specific memory address
void write_to_memory(uint32_t* address, uint32_t value);

// Function to read a 32-bit integer from a specific memory address
int32_t read_from_memory(uint32_t* address);

#endif // MEMORY_ACCESS_H
