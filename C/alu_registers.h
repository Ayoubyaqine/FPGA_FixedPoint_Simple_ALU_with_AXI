/*
 * File: alu_registers.h
 * Author: Ayoub Yaqine
 * Date: 10/02/2025
 * Description: Header file defining the base addresses and register offsets for the ALU operations.
 *              This file is intended to be included in source files that interact with the ALU hardware.
 */

#ifndef ALU_REGISTERS_H
#define ALU_REGISTERS_H

// Base address of the AXI Lite for the ALU
#define ALU_AXI_LITE_BASE_ADDR 0x40000000

// Addresses of the ALU registers
#define ALU_INPUT1_ADDR        (ALU_AXI_LITE_BASE_ADDR + 0x00) // Address of the first input
#define ALU_INPUT2_ADDR        (ALU_AXI_LITE_BASE_ADDR + 0x04) // Address of the second input
#define ALU_RESULT_ADDR        (ALU_AXI_LITE_BASE_ADDR + 0x08) // Address of the result
// Base address of the AXI GPIO for the command
#define ALU_AXI_GPIO_BASE_ADDR 0x41200000

// Address of the command register of the AXI GPIO
#define ALU_GPIO_CMD_ADDR      (ALU_AXI_GPIO_BASE_ADDR + 0x00) // Address of the command register

#endif // ALU_REGISTERS_H
