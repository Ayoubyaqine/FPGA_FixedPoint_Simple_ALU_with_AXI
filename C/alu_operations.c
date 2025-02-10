/*
 * File: alu_operations.c
 * Author: Ayoub Yaqine
 * Date: 10/02/2025
 * Description: Source file implementing functions for addition, subtraction, and multiplication
 *              of floating-point numbers with fixed-point scaling.
 */

#include "alu_operations.h"
#include <stdio.h>
#include <time.h>
#include "sleep.h"


float add(float a, float b)
{
    // Scale the inputs
    int32_t scaled_a = (int32_t)(a * SCALE_FACTOR);
    int32_t scaled_b = (int32_t)(b * SCALE_FACTOR);

    // Write inputs to memory
    write_to_memory((uint32_t*)ALU_INPUT1_ADDR, scaled_a);
    write_to_memory((uint32_t*)ALU_INPUT2_ADDR, scaled_b);

    // Write the operation code to the command register
    write_to_memory((uint32_t*)ALU_GPIO_CMD_ADDR, 0);

    // Read the result from memory
    int32_t result = read_from_memory((uint32_t*)ALU_RESULT_ADDR);

    // Convert the result back to float
    float final_result = (float)result / SCALE_FACTOR;

    // Output the result
    printf("The sum of %.5f and %.5f is %.5f\n", a, b, final_result);
    return final_result;
}

float subtract(float a, float b)
{
    // Scale the inputs
    int32_t scaled_a = (int32_t)(a * SCALE_FACTOR);
    int32_t scaled_b = (int32_t)(b * SCALE_FACTOR);

    // Write inputs to memory
    write_to_memory((uint32_t*)ALU_INPUT1_ADDR, scaled_a);
    write_to_memory((uint32_t*)ALU_INPUT2_ADDR, scaled_b);

    // Write the operation code to the command register
    write_to_memory((uint32_t*)ALU_GPIO_CMD_ADDR, 1);

    // Read the result from memory
    int32_t result = read_from_memory((uint32_t*)ALU_RESULT_ADDR);

    // Convert the result back to float
    float final_result = (float)result / SCALE_FACTOR;

    // Output the result
    printf("The difference between %.5f and %.5f is %.5f\n", a, b, final_result);
    return final_result;
}

float multiply(float a, float b)
{
    // Scale the inputs
    int32_t scaled_a = (int32_t)(a * SCALE_FACTOR);
    int32_t scaled_b = (int32_t)(b * SCALE_FACTOR);

    // Write inputs to memory
    write_to_memory((uint32_t*)ALU_INPUT1_ADDR, scaled_a);
    write_to_memory((uint32_t*)ALU_INPUT2_ADDR, scaled_b);

    // Write the operation code to the command register
    write_to_memory((uint32_t*)ALU_GPIO_CMD_ADDR, 2);

    // Read the result from memory
    int32_t result = read_from_memory((uint32_t*)ALU_RESULT_ADDR);

    // Convert the result back to float
    float final_result = (float)result / SCALE_FACTOR;

    // Output the result
    printf("The product of %.5f and %.5f is %.5f\n", a, b, final_result);
    return final_result;
}
