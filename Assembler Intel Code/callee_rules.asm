.486
.MODEL FLAT
.CODE
PUBLIC _myFunc
	_myFunc PROC
		; Subroutine Prologue
		push ebp     ; Save the old base pointer value.
		mov ebp, esp ; Set the new base pointer value.
		sub esp, 4   ; Make room for one 4-byte local variable.
		push edi     ; Save the values of registers that the function
		push esi     ; will modify. This function uses EDI and ESI.
		; (no need to save EBX, EBP, or ESP)

		; Subroutine Body
		mov eax, [ebp+8]   ; Move value of parameter 1 into EAX
		mov esi, [ebp+12]  ; Move value of parameter 2 into ESI
		mov edi, [ebp+16]  ; Move value of parameter 3 into EDI

		mov [ebp-4], edi   ; Move EDI into the local variable
		add [ebp-4], esi   ; Add ESI into the local variable
		add eax, [ebp-4]   ; Add the contents of the local variable
						 ; into EAX (final result)

		; Subroutine Epilogue 
		pop esi      ; Recover register values
		pop  edi
		mov esp, ebp ; Deallocate local variables
		pop ebp ; Restore the caller's base pointer value
		ret
	_myFunc ENDP
END