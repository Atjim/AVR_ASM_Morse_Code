Initialization:
	ldi r16,0x20   
	out 0x04,r16	;Sets port bit to output

	ldi r21, 0x04   ;Used for number loops.  Reassigned between each number
	ldi r22, -0x01	;Used for decrementation

	ldi r16, 0x00 	;R16 will be used to turn light off
	ldi r17, 0x20 	;R17 will be used to turn light on


ZeroLoop:
	out 0x05,r17 	
	call WaitThreeUnits    
	out 0x05, r16
	call WaitOneUnit
	
	add r21, r22
	brbc 1, ZeroLoop  ;Loop for the first four parts of zero


ZeroContinued:
	out 0x05,r17	
	call WaitThreeUnits    	


TransitionOne:	
	out 0x05, r16
	call WaitThreeUnits		
	ldi r21, 0x03	;Set for the next loop


EightLoop:
	out 0x05,r17 	
	call WaitThreeUnits    
	out 0x05, r16
	call WaitOneUnit

	add r21, r22
	brbc 1, EightLoop	;Loop for the first three parts of eight


EightContinued:
	out 0x05,r17 	
	call WaitOneUnit    
	out 0x05, r16
	call WaitOneUnit
	
	out 0x05,r17 	
	call WaitOneUnit
	

TransitionTwo:
	out 0x05, r16
	call WaitThreeUnits
	ldi r21, 0x04	;Set for the next loop


FourLoop:
	out 0x05,r17 	
	call WaitOneUnit    
	out 0x05, r16
	call WaitOneUnit

	add r21, r22
	brbc 1, FourLoop	;Loop for the first four parts of four


FourContinued:
	out 0x05,r17 	
	call WaitThreeUnits    


TransitionThree:
	out 0x05, r16
	call WaitThreeUnits	
	ldi r21, 0x03	;Set for the next loop


EightLoopTwo:
	out 0x05,r17 	
	call WaitThreeUnits    
	out 0x05, r16
	call WaitOneUnit

	add r21, r22
	brbc 1, EightLoopTwo	;Loop for the first three parts of eight


EightContinuedTwo:
	out 0x05,r17 	
	call WaitOneUnit    
	out 0x05, r16
	call WaitOneUnit
	
	out 0x05,r17 	
	call WaitOneUnit


WaitSevenUnits:
	out 0x05, r16
	call WaitThreeUnits
	call WaitThreeUnits
	call WaitOneUnit	

	rjmp Initialization ;Waits seven units before restarting the program

WaitOneUnit:
    ldi  r18, 82	;WaitOneUnit delays the Arduino one second
    ldi  r19, 43
    ldi  r20, 0
Loops: 
    add  r20, r22
    brbc 1, Loops
    add  r19, r22
    brbc 1, Loops
    add  r18, r22
    brbc 1, Loops
    nop
    ret


WaitThreeUnits:
    ldi  r18, 244	;WaitThreeUnits delays the Arduino three seconds
    ldi  r19, 130
    ldi  r20, 6
Loops2: 
	add  r20, r22
    brbc 1, Loops2
    add  r19, r22
    brbc 1, Loops2
    add  r18, r22
    brbc 1, Loops2
	ret
