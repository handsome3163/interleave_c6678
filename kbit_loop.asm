				.global kbit_loop

;-----------------------
;カウンタコピペ↓
;-----------------------
;MVC.S2		TSCL,		B30	;カウンタスタート
;MVC.S2		TSCL,		B31	;カウンタストップ
;SUB.L2		B31, B30,	B29	;クロック数カウント

;--------------------
;	kbit(256bit) ここから
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
				;---必要な値の格納---
				;Aの格納(第二テスト値)			0xFAA2163A 8A92D2CD 4F84C583 20B243FD B300C4A0 60203169 14A30327 D3D75D47
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
				;Bの格納(下位ビットから格納するよ)	0xE8C2AF08 B5C031D5 89972BFB 12D2606A FED12880 9BF8AA4D EBC19790 F35879D5 (256bit)
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
				MVKL.S2		9,			B20;比較用
				;ZERO.S2		B28
				;Mの格納(下位ビットから格納するよ) 0xFC622E0E 65F96944 56685605 702EC673 A16746D1 C6535C99 DCEB93D0 EB393839 (256bit)
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
				;Siの初期化
				ZERO.L1					A31:A30
				ZERO.L1					A29:A28
				ZERO.L1					A27:A26
				ZERO.L1					A25:A24
				ZERO.L1					A23:A22
				;M'の格納						0x17D6C9F7
				MVKL.S1		0x17D6C9F7, A31
				MVKH.S1		0x17D6C9F7, A31
				;test
				LDW.D2			*B22[B21],		B23


				;
				;------------------------------
				;以下レジスタマッピング
				;------------------------------
				; A0  A1  A2  A3  A4  A5  A6  A7  A8  A9  A10 A11 A12 A13 A14 A15 A16 A17 A18 A19 A20 A21 A22 A23 A24 A25 A26 A27 A28 A29 A30 A31
				;+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+
				;|qM0|qM1|qM2|qM3|qM4|qM5|qM6|qM7|qM8|   |add|add|add|add|M0 |M1 |M2 |M3 |M4 |M5 |M6 |M7 |Si0|Si1|Si2|Si3|Si4|Si5|Si6|Si7|Si8|M' |
				;+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+
				;  =c                                                    |<----------------------------->|<--------------------------------->|
				;                                                        |*************given*************| Si+1 (init=0, 9個あれば良いはず)      |
				;
				; B0  B1  B2  B3  B4  B5  B6  B7  B8  B9  B10 B11 B12 B13 B14 B15 B16 B17 B18 B19 B20 B21 B22 B23 B24 B25 B26 B27 B28 B29 B30 B31
				;+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+
				;|bA0|bA1|bA2|bA3|bA4|bA5|bA6|bA7|bA8|   |add|add|add|add| X | X |   |   |   |   |   |num|mem| B |A_0|A_1|A_2|A_3|A_4|A_5|A_6|A_7|
				;+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+
				;  =q                                                            |<----------------------------->|<----------------------------->|
				;
				;moq=移動後のq, B0は途中でqになる, A0は途中でA23:A22のキャリー(c)に

loop_counter:
				ZERO.L2		B21
				MVC.S2		TSCL,		B30	;カウンタスタート
loopMAIN:

				;b0*(A0~A3)
				;
				LDW.D2			*B22[B21],		B23			;
				NOP		4
				MPY32U.M2		B23, B24,		B1:B0		;
				MPY32U.M2		B23, B25,		B3:B2		;
				MPY32U.M2		B23, B26,		B5:B4		;
				MPY32U.M2		B23, B27,		B7:B6		; B0確定
				ADDU.L1			A22, B0,		A13:A12		; Si0+biA0のところ			A13:A12(=Si0+b0A0)使用 B0不要
				MPY32U.M1		A31, A12,		A11:A10		; (~)*M' のところ			A11は不要
			||	ADDU.L2			B1,  B2,		B13:B12		; biAを決めるための足し算↓
				MV.S2			B12, 			B1			; B1確定
			||	ADDU.L2			B3,  B13,		B11:B10		;						B3不要
				ADDU.L2			B4,  B11:B10,	B11:B10		;						B4不要
				MV.S2			B10,			B2			; B2確定
			||	ADDU.L2			B5,  B11,		B13:B12		; 以下からA10(q)使用可		B5不要
				;ここからqM乱入(Unit.1)
				ADDU.L2			B6,  B13:B12,	B13:B12		;						B6不要
			||	MV.S2			A10,			B0			;^-^-^qをA10からB0に移行^-^-^
				MV.S2			B12,			B3			; B3確定
			||	ADDU.L2			B7,  B13,		B11:B10		;						B7不要 B13:B12不要
			||	MPY32U.M1		A14, B0,		A1:A0		; q*M0					---mark---
			||	MPY32U.M2		B23, B28,		B5:B4		; b0*A4
				MPY32U.M1		A15, B0,		A3:A2		; q*M1
			||	MPY32U.M2		B23, B29,		B7:B6		; b0*A5
				MPY32U.M1		A16, B0,		A5:A4		; q*M2
			||	MPY32U.M2		B23, B30,		B9:B8		; b0*A6
				MPY32U.M1		A17, B0,		A7:A6		; q*M3					---mark から A0~A7, B0~B9 使用中---
				ADDU.L1			A0,  A13:A12,	A13:A12		; Si+biA+qM の１桁目確定	A0確定済み->その後A0不要に
			||	ADDU.L2			B4,  B11:B10,	B11:B10		; biAの残りの足し算
				MV.S1			A12, 			A22			; A22確定				A12不要
			||	MV.D1			A13,			A0			; Si+1を決める足し算は一時保留	A0使用中 A13不要
			||	MV.S2			B10,			B4			; B4確定
			||	ADDU.L1			A1,  A2,		A11:A10		; qMの足し算
			||	ADDU.L2			B5,  B11,		B13:B12		; biAの残りの足し算			B11:B10不要
				MV.S1			A10,			A1			; A1確定
			||	ADDU.L1			A3,  A11,		A13:A12		; qMの残りの足し算			備考：AとBの計算を合わせるためにB側は一回休み
				ADDU.L1			A4,  A13:A12,	A13:A12		; qMの残りの足し算
			||	ADDU.L2			B6,  B13:B12,	B13:B12		; biAの残りの足し算
				MV.S1			A12,			A2			; A2確定
			||	MV.S2			B12,			B5			; B5確定
			||	ADDU.L1			A5,  A13,		A11:A10		; qMの残りの足し算
			||	ADDU.L2			B7,  B13,		B11:B10		; biAの残りの足し算
				ADDU.L1			A6,  A11:A10,	A11:A10		;
			||	ADDU.L2			B8,  B11:B10,	B11:B10		;
			||	MPY32U.M1		A18, B0,		A5:A4		; q*M4					A4~A7不要
			||	MPY32U.M2		B23, B31,		B9:B8		; b0*A7 : biAの掛け算終わり
				MV.S1			A10,			A3			; A3確定
			||	MV.S2			B10,			B6			; B6確定
			||	ADDU.L1			A7,  A11,		A13:A12		;
			||	ADDU.L2			B9,  B11,		B13:B12		;
				MPY32U.M1		A19, B0,		A7:A6		; q*M5
			||	ADD.D1			A0,	 A23,		A23			; Si+biA+qMの繰り上がりの計算
				MPY32U.M1		A20, B0,		A9:A8		; q*M6
				ADDU.L1			A4,  A13:A12,	A13:A12		;
			||	ADDU.L2			B8,  B13:B12,	B13:B12		;
				MV.S1			A12,			A4			; A4確定
			||	MV.S2			B12,			B7			; B7確定
			||	ADDU.L1			A5,  A13,		A11:A10		;
			||	ADDU.L2			B9,  B13,		B9:B8		; B8確定 (B9は0のはず):biA計算終わり <-合ってるok
				ADDU.L1			A6,  A11:A10,	A11:A10		;
			||	MPY32U.M1		A21, B0,		A9:A8		; q*M7 : qMの掛け算終わり
				MV.S1			A10,			A5			; A5確定
			||	ADDU.L1			A7,  A11,		A13:A12		;
				ADDU.L1			A8,  A13:A12,	A13:A12		;
				MV.S1			A12,			A6			; A6確定
			||	ADDU.L1			A9,  A13,		A11:A10		;
				ADDU.L1			A8,  A11:A10,	A11:A10		;
			||	ADDU.L2			B1,  A23,		B13:B12		; note:1			:ここから足し算開始
				MV.S1			A10,			A7			; A7確定
			||	ADDU.L1			A9,  A11,		A9:A8		; A8確定 :qM計算終わり <-合ってるok
			||	ADDU.L2			B2,  A24,		B11:B10		; note:2
;まあ始まってるけど足し算開始ってことで Si+biA+qMのところ
				ADDU.L1			A1,  B12,		A13:A12		; note:3
			||	ADDU.L2			B13, B11:B10,	B11:B10		;
				MV.S1			A12,			A22			; note:4 A22確定
			||	ADDU.L1			A2,  A13,		A11:A10		;
			||	ADDU.L2			B3,  A25,		B13:B12		;
				ADDU.S1			A11:A10, B10,	A11:A10		; note:5
			||	ADDU.L2			B11, B13:B12,	B13:B12		;
				MV.S1			A10,			A23			; note:6 A23確定
			||	ADDU.L1			A3,  A11,		A13:A12		;
			||	ADDU.L2			B4,  A26,		B11:B10		;
				ADDU.S1			A13:A12, B12,	A13:A12		; note:7
			||	ADDU.L2			B13, B11:B10,	B11:B10		;
				MV.S1			A12,			A24			; note:8 A24確定		:::以下コピペ
			||	ADDU.L1			A4,  A13,		A11:A10		;
			||	ADDU.L2			B5,  A27,		B13:B12		;
				ADDU.S1			A11:A10, B10,	A11:A10		; note:9
			||	ADDU.L2			B11, B13:B12,	B13:B12		;
				MV.S1			A10,			A25			; note:10 A25確定
			||	ADDU.L1			A5,  A11,		A13:A12		;
			||	ADDU.L2			B6,  A28,		B11:B10		;
				ADDU.S1			A13:A12, B12,	A13:A12		; note:11
			||	ADDU.L2			B13, B11:B10,	B11:B10		;
				MV.S1			A12,			A26			; note:12 A26確定	:::
			||	ADDU.L1			A6,  A13,		A11:A10		;
			||	ADDU.L2			B7,  A29,		B13:B12		;
				ADDU.S1			A11:A10, B10,	A11:A10		; note:13
			||	ADDU.L2			B11, B13:B12,	B13:B12		;
				MV.S1			A10,			A27			; note:14 A27確定
			||	ADDU.L1			A7,  A11,		A13:A12		;
			||	ADDU.L2			B8,  A30,		B11:B10		;
				ADDU.S1			A13:A12, B12,	A13:A12		; note:15
			||	ADDU.L2			B13, B11:B10,	B11:B10		;
				MV.S1			A12,			A28			; note:16 A28確定	:::最後は変則
			||	ADDU.S2			B11:B10, A8,	B11:B10		;
				ADDU.S2			B11:B10, A13,	B11:B10		; note:17
				MV.S1			B10,			A29			; note:18 A29確定
			||	ADD.D2			1,  B21,		B21			; B21 + 1
				MV.S1			B11,			A30			; note:19 A30確定
			||	CMPEQ.L2		B21,  8,		B0			; B21 == B20 -> B0 = 1
		[!B0]	B.S1			loopMAIN,					; loop
				NOP				5


loopNOP:
				MVC.S2		TSCL,		B31	;カウンタストップ
				SUB.L2		B31, B30,	B27	;クロック数カウント
				BNOP.S1		loop_counter,	5
				NOP
				NOP
				NOP
				NOP

