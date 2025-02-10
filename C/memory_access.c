/*
 * File: memory_access.c
 * Author: Ayoub Yaqine
 * Date: 10/02/2025
 * Description: Source file implementing functions for writing to and reading from a specific memory address.
 *              This file includes the header file 'memory_access.h' and provides the function definitions.
 */
#include "memory_access.h"

// Function to write a 32-bit integer to a specific memory address
void write_to_memory(uint32_t* address, uint32_t value)
{
    *address = value;
}

// Function to read a 32-bit integer from a specific memory address
int32_t read_from_memory(uint32_t* address)
{
    return *address;
}
