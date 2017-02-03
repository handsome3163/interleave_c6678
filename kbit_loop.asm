				.global kbit_loop

;-----------------------
;�J�E���^�R�s�y��
;-----------------------
;MVC.S2		TSCL,		B30	;�J�E���^�X�^�[�g
;MVC.S2		TSCL,		B31	;�J�E���^�X�g�b�v
;SUB.L2		B31, B30,	B29	;�N���b�N���J�E���g

;--------------------
;	kbit(256bit) ��������
;--------------------
kbit_loop:
				;
				;A = 0xCFB2C80E DF296937 CBAAF19C 264463EB 4B06E9A3 6121BCB1 B9BB1C66 7292477F (256bit)
				;B = 0xE8C2AF08 B5C031D5 89972BFB 12D2606A FED12880 9BF8AA4D EBC19790 F35879D5 (256bit)
				;M = 0xFC622E0E 65F96944 56685605 702EC673 A16746D1 C6535C99 DCEB93D0 EB393839 (256bit)
				;M'= 0x17D6C9F7
				;n = 9
				;k = 32
				;
				;---�K�v�Ȓl�̊i�[---
				;A�̊i�[(���e�X�g�l)			0xFAA2163A 8A92D2CD 4F84C583 20B243FD B300C4A0 60203169 14A30327 D3D75D47
				MVKL.S2		0xD3D75D47, B24
				MVKH.S2		0xD3D75D47, B24
				MVKL.S2		0x14A30327, B25
				MVKH.S2		0x14A30327, B25
				MVKL.S2		0x60203169, B26
				MVKH.S2		0x60203169, B26
				MVKL.S2		0xB300C4A0, B27
				MVKH.S2		0xB300C4A0, B27
				MVKL.S2		0x20B243FD, B28
				MVKH.S2		0x20B243FD, B28
				MVKL.S2		0x4F84C583, B29
				MVKH.S2		0x4F84C583, B29
				MVKL.S2		0x8A92D2CD, B30
				MVKH.S2		0x8A92D2CD, B30
				MVKL.S2		0xFAA2163A, B31
				MVKH.S2		0xFAA2163A, B31
				;B�̊i�[(���ʃr�b�g����i�[�����)	0xE8C2AF08 B5C031D5 89972BFB 12D2606A FED12880 9BF8AA4D EBC19790 F35879D5 (256bit)
				MVKL.S1		0x80000000, A30
				MVKH.S1		0x80000000, A30
				MVKL.S2		0xF35879D5, B16
				MVKH.S2		0xF35879D5, B16
				MVKL.S2		0xEBC19790, B17
				MVKH.S2		0xEBC19790, B17
				MVKL.S2		0x9BF8AA4D, B18
				MVKH.S2		0x9BF8AA4D, B18
				MVKL.S2		0xFED12880, B19
				MVKH.S2		0xFED12880, B19
				MVKL.S2		0x12D2606A, B20
				MVKH.S2		0x12D2606A, B20
				MVKL.S2		0x89972BFB, B21
				MVKH.S2		0x89972BFB, B21
				MVKL.S2		0xB5C031D5, B22
				MVKH.S2		0xB5C031D5, B22
				MVKL.S2		0xE8C2AF08, B23
				MVKH.S2		0xE8C2AF08, B23
				STW.D1		B16,		*A30[0]
				STW.D1		B17,		*A30[1]
				STW.D1		B18,		*A30[2]
				STW.D1		B19,		*A30[3]
				STW.D1		B20,		*A30[4]
				STW.D1		B21,		*A30[5]
				STW.D1		B22,		*A30[6]
				STW.D1		B23,		*A30[7]
				ZERO.L2		B16
				STW.D1		B16,		*A30[8]
				MV.D2		A30,		B22
				MVKL.S2		0,			B21
				MVKL.S2		9,			B20;��r�p
				;ZERO.S2		B28
				;M�̊i�[(���ʃr�b�g����i�[�����) 0xFC622E0E 65F96944 56685605 702EC673 A16746D1 C6535C99 DCEB93D0 EB393839 (256bit)
				MVKL.S1		0xEB393839, A14
				MVKH.S1		0xEB393839, A14
				MVKL.S1		0xDCEB93D0, A15
				MVKH.S1		0xDCEB93D0, A15
				MVKL.S1		0xC6535C99, A16
				MVKH.S1		0xC6535C99, A16
				MVKL.S1		0xA16746D1, A17
				MVKH.S1		0xA16746D1, A17
				MVKL.S1		0x702EC673, A18
				MVKH.S1		0x702EC673, A18
				MVKL.S1		0x56685605, A19
				MVKH.S1		0x56685605, A19
				MVKL.S1		0x65F96944, A20
				MVKH.S1		0x65F96944, A20
				MVKL.S1		0xFC622E0E, A21
				MVKH.S1		0xFC622E0E, A21
				;Si�̏�����
				ZERO.L1					A31:A30
				ZERO.L1					A29:A28
				ZERO.L1					A27:A26
				ZERO.L1					A25:A24
				ZERO.L1					A23:A22
				;M'�̊i�[						0x17D6C9F7
				MVKL.S1		0x17D6C9F7, A31
				MVKH.S1		0x17D6C9F7, A31
				;test
				LDW.D2			*B22[B21],		B23


				;
				;------------------------------
				;�ȉ����W�X�^�}�b�s���O
				;------------------------------
				; A0  A1  A2  A3  A4  A5  A6  A7  A8  A9  A10 A11 A12 A13 A14 A15 A16 A17 A18 A19 A20 A21 A22 A23 A24 A25 A26 A27 A28 A29 A30 A31
				;+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+
				;|qM0|qM1|qM2|qM3|qM4|qM5|qM6|qM7|qM8|   |add|add|add|add|M0 |M1 |M2 |M3 |M4 |M5 |M6 |M7 |Si0|Si1|Si2|Si3|Si4|Si5|Si6|Si7|Si8|M' |
				;+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+
				;  =c                                                    |<----------------------------->|<--------------------------------->|
				;                                                        |*************given*************| Si+1 (init=0, 9����Ηǂ��͂�)      |
				;
				; B0  B1  B2  B3  B4  B5  B6  B7  B8  B9  B10 B11 B12 B13 B14 B15 B16 B17 B18 B19 B20 B21 B22 B23 B24 B25 B26 B27 B28 B29 B30 B31
				;+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+
				;|bA0|bA1|bA2|bA3|bA4|bA5|bA6|bA7|bA8|   |add|add|add|add| X | X |   |   |   |   |   |num|mem| B |A_0|A_1|A_2|A_3|A_4|A_5|A_6|A_7|
				;+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+
				;  =q                                                            |<----------------------------->|<----------------------------->|
				;
				;moq=�ړ����q, B0�͓r����q�ɂȂ�, A0�͓r����A23:A22�̃L�����[(c)��

loop_counter:
				ZERO.L2		B21
				MVC.S2		TSCL,		B30	;�J�E���^�X�^�[�g
loopMAIN:

				;b0*(A0~A3)
				;
				LDW.D2			*B22[B21],		B23			;
				NOP		4
				MPY32U.M2		B23, B24,		B1:B0		;
				MPY32U.M2		B23, B25,		B3:B2		;
				MPY32U.M2		B23, B26,		B5:B4		;
				MPY32U.M2		B23, B27,		B7:B6		; B0�m��
				ADDU.L1			A22, B0,		A13:A12		; Si0+biA0�̂Ƃ���			A13:A12(=Si0+b0A0)�g�p B0�s�v
				MPY32U.M1		A31, A12,		A11:A10		; (~)*M' �̂Ƃ���			A11�͕s�v
			||	ADDU.L2			B1,  B2,		B13:B12		; biA�����߂邽�߂̑����Z��
				MV.S2			B12, 			B1			; B1�m��
			||	ADDU.L2			B3,  B13,		B11:B10		;						B3�s�v
				ADDU.L2			B4,  B11:B10,	B11:B10		;						B4�s�v
				MV.S2			B10,			B2			; B2�m��
			||	ADDU.L2			B5,  B11,		B13:B12		; �ȉ�����A10(q)�g�p��		B5�s�v
				;��������qM����(Unit.1)
				ADDU.L2			B6,  B13:B12,	B13:B12		;						B6�s�v
			||	MV.S2			A10,			B0			;^-^-^q��A10����B0�Ɉڍs^-^-^
				MV.S2			B12,			B3			; B3�m��
			||	ADDU.L2			B7,  B13,		B11:B10		;						B7�s�v B13:B12�s�v
			||	MPY32U.M1		A14, B0,		A1:A0		; q*M0					---mark---
			||	MPY32U.M2		B23, B28,		B5:B4		; b0*A4
				MPY32U.M1		A15, B0,		A3:A2		; q*M1
			||	MPY32U.M2		B23, B29,		B7:B6		; b0*A5
				MPY32U.M1		A16, B0,		A5:A4		; q*M2
			||	MPY32U.M2		B23, B30,		B9:B8		; b0*A6
				MPY32U.M1		A17, B0,		A7:A6		; q*M3					---mark ���� A0~A7, B0~B9 �g�p��---
				ADDU.L1			A0,  A13:A12,	A13:A12		; Si+biA+qM �̂P���ڊm��	A0�m��ς�->���̌�A0�s�v��
			||	ADDU.L2			B4,  B11:B10,	B11:B10		; biA�̎c��̑����Z
				MV.S1			A12, 			A22			; A22�m��				A12�s�v
			||	MV.D1			A13,			A0			; Si+1�����߂鑫���Z�͈ꎞ�ۗ�	A0�g�p�� A13�s�v
			||	MV.S2			B10,			B4			; B4�m��
			||	ADDU.L1			A1,  A2,		A11:A10		; qM�̑����Z
			||	ADDU.L2			B5,  B11,		B13:B12		; biA�̎c��̑����Z			B11:B10�s�v
				MV.S1			A10,			A1			; A1�m��
			||	ADDU.L1			A3,  A11,		A13:A12		; qM�̎c��̑����Z			���l�FA��B�̌v�Z�����킹�邽�߂�B���͈��x��
				ADDU.L1			A4,  A13:A12,	A13:A12		; qM�̎c��̑����Z
			||	ADDU.L2			B6,  B13:B12,	B13:B12		; biA�̎c��̑����Z
				MV.S1			A12,			A2			; A2�m��
			||	MV.S2			B12,			B5			; B5�m��
			||	ADDU.L1			A5,  A13,		A11:A10		; qM�̎c��̑����Z
			||	ADDU.L2			B7,  B13,		B11:B10		; biA�̎c��̑����Z
				ADDU.L1			A6,  A11:A10,	A11:A10		;
			||	ADDU.L2			B8,  B11:B10,	B11:B10		;
			||	MPY32U.M1		A18, B0,		A5:A4		; q*M4					A4~A7�s�v
			||	MPY32U.M2		B23, B31,		B9:B8		; b0*A7 : biA�̊|���Z�I���
				MV.S1			A10,			A3			; A3�m��
			||	MV.S2			B10,			B6			; B6�m��
			||	ADDU.L1			A7,  A11,		A13:A12		;
			||	ADDU.L2			B9,  B11,		B13:B12		;
				MPY32U.M1		A19, B0,		A7:A6		; q*M5
			||	ADD.D1			A0,	 A23,		A23			; Si+biA+qM�̌J��オ��̌v�Z
				MPY32U.M1		A20, B0,		A9:A8		; q*M6
				ADDU.L1			A4,  A13:A12,	A13:A12		;
			||	ADDU.L2			B8,  B13:B12,	B13:B12		;
				MV.S1			A12,			A4			; A4�m��
			||	MV.S2			B12,			B7			; B7�m��
			||	ADDU.L1			A5,  A13,		A11:A10		;
			||	ADDU.L2			B9,  B13,		B9:B8		; B8�m�� (B9��0�̂͂�):biA�v�Z�I��� <-�����Ă�ok
				ADDU.L1			A6,  A11:A10,	A11:A10		;
			||	MPY32U.M1		A21, B0,		A9:A8		; q*M7 : qM�̊|���Z�I���
				MV.S1			A10,			A5			; A5�m��
			||	ADDU.L1			A7,  A11,		A13:A12		;
				ADDU.L1			A8,  A13:A12,	A13:A12		;
				MV.S1			A12,			A6			; A6�m��
			||	ADDU.L1			A9,  A13,		A11:A10		;
				ADDU.L1			A8,  A11:A10,	A11:A10		;
			||	ADDU.L2			B1,  A23,		B13:B12		; note:1			:�������瑫���Z�J�n
				MV.S1			A10,			A7			; A7�m��
			||	ADDU.L1			A9,  A11,		A9:A8		; A8�m�� :qM�v�Z�I��� <-�����Ă�ok
			||	ADDU.L2			B2,  A24,		B11:B10		; note:2
;�܂��n�܂��Ă邯�Ǒ����Z�J�n���Ă��Ƃ� Si+biA+qM�̂Ƃ���
				ADDU.L1			A1,  B12,		A13:A12		; note:3
			||	ADDU.L2			B13, B11:B10,	B11:B10		;
				MV.S1			A12,			A22			; note:4 A22�m��
			||	ADDU.L1			A2,  A13,		A11:A10		;
			||	ADDU.L2			B3,  A25,		B13:B12		;
				ADDU.S1			A11:A10, B10,	A11:A10		; note:5
			||	ADDU.L2			B11, B13:B12,	B13:B12		;
				MV.S1			A10,			A23			; note:6 A23�m��
			||	ADDU.L1			A3,  A11,		A13:A12		;
			||	ADDU.L2			B4,  A26,		B11:B10		;
				ADDU.S1			A13:A12, B12,	A13:A12		; note:7
			||	ADDU.L2			B13, B11:B10,	B11:B10		;
				MV.S1			A12,			A24			; note:8 A24�m��		:::�ȉ��R�s�y
			||	ADDU.L1			A4,  A13,		A11:A10		;
			||	ADDU.L2			B5,  A27,		B13:B12		;
				ADDU.S1			A11:A10, B10,	A11:A10		; note:9
			||	ADDU.L2			B11, B13:B12,	B13:B12		;
				MV.S1			A10,			A25			; note:10 A25�m��
			||	ADDU.L1			A5,  A11,		A13:A12		;
			||	ADDU.L2			B6,  A28,		B11:B10		;
				ADDU.S1			A13:A12, B12,	A13:A12		; note:11
			||	ADDU.L2			B13, B11:B10,	B11:B10		;
				MV.S1			A12,			A26			; note:12 A26�m��	:::
			||	ADDU.L1			A6,  A13,		A11:A10		;
			||	ADDU.L2			B7,  A29,		B13:B12		;
				ADDU.S1			A11:A10, B10,	A11:A10		; note:13
			||	ADDU.L2			B11, B13:B12,	B13:B12		;
				MV.S1			A10,			A27			; note:14 A27�m��
			||	ADDU.L1			A7,  A11,		A13:A12		;
			||	ADDU.L2			B8,  A30,		B11:B10		;
				ADDU.S1			A13:A12, B12,	A13:A12		; note:15
			||	ADDU.L2			B13, B11:B10,	B11:B10		;
				MV.S1			A12,			A28			; note:16 A28�m��	:::�Ō�͕ϑ�
			||	ADDU.S2			B11:B10, A8,	B11:B10		;
				ADDU.S2			B11:B10, A13,	B11:B10		; note:17
				MV.S1			B10,			A29			; note:18 A29�m��
			||	ADD.D2			1,  B21,		B21			; B21 + 1
				MV.S1			B11,			A30			; note:19 A30�m��
			||	CMPEQ.L2		B21,  8,		B0			; B21 == B20 -> B0 = 1
		[!B0]	B.S1			loopMAIN,					; loop
				NOP				5


loopNOP:
				MVC.S2		TSCL,		B31	;�J�E���^�X�g�b�v
				SUB.L2		B31, B30,	B27	;�N���b�N���J�E���g
				BNOP.S1		loop_counter,	5
				NOP
				NOP
				NOP
				NOP

