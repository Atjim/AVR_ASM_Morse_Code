#!/bin/bash 
name=$1
avr-as -mmcu=atmega328p $1.asm
avr-ld -m avr5 -o $1.elf a.out
avr-objcopy -O ihex -R .eeprom $1.elf $1.hex
ldino-lin -P $1.hex 

