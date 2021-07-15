Home::
chastota_sbrosa:=200
vikopaltmp:=0
vikopal:=1
vikopal_all:=1
fail:=0
sum1sproba:=0
FormatTime, TimeString,, HH:mm:ss
FileAppend,%TimeString% | Bot start`n, log.txt
	Loop{
		PixelGetColor, color, 1136, 560	
		if (color = 0x78D0F1){
			FormatTime, TimeString,, HH:mm:ss		
			FileAppend,%TimeString% | CPCH color found `n, log.txt
			pixarr := []
			kdarr := []
			kdarrv := ""
			i:=0

			odin:="ddkkkk"
			dva:="ddkk"
			tri:="kkkk"
			chetire:="kdkdkkd"
			pyat:="kkkkkd"
			pyat2:="kkkkkk"
			pyat3:="kkkkdd"
			shest:="dddkd"
			sem:="ddkkd"
			sem2:="dkkd"
			vosem:="ddddkkd"
			vosem2:="dkddkkd"
			devyat:="dddkkkd"


			Loop, 340
			{
				i:=A_Index+760
				PixelGetColor, pix1, i, 297, Fast
				PixelGetColor, pix2, i, 298, Fast
				
				pix1d:= pix1
				SetFormat, IntegerFast, d
				pix1d += 0
				pix1d .= ""

				pix2d:= pix2
				SetFormat, IntegerFast, d
				pix2d += 0
				pix2d .= ""

			    pixraz := Abs(pix1d - pix2d)

			    if ( pixraz = 0 ) {
			    	pixraz:=999999
			    }else{
			    	pixraz:=0
			    }
			    pixarr[A_Index]:=pixraz
				;FileAppend,%pixraz% `n, log.txt

			}

			FormatTime, TimeString,, HH:mm:ss		
			FileAppend,%TimeString% | Pixels scaned `n, log.txt

			pixarr[0]:=0
			Loop, 340
			{
				i:=A_Index
				if (pixarr[i-1] = 0 and pixarr[i+1] = 0){
			    	pixarr[i]:=0
			    }else if (pixarr[i-1] = 0 and pixarr[i+2] = 0){
			    	pixarr[i]:=0
			    	pixarr[i+1]:=0
			    }

			    ;pixraz:= pixarr[i]
				;FileAppend,%pixraz% `n, log.txt

			}
			FormatTime, TimeString,, HH:mm:ss		
			FileAppend,%TimeString% | Deleted noise `n, log.txt

			;Ниже проблема (переписал всё в пизду) 

			i:=2
			j:=1
			stop:=0
			kdarr:=[]
			while (i<340)
			{
				if(pixarr[i-1]=0 and pixarr[i]=0){
					j:=j+1
				}
				if(pixarr[i-1]!=0 and pixarr[i]!=0){
					j:=j+1
				}
				if(pixarr[i-1]=0 and pixarr[i]!=0){
					if(kdarr.Count()>0){			
						if (j>19){
							kdarr.Push(" ")
							FileAppend,` , log.txt
						}
					}
					j:=1
				}
				if(pixarr[i-1]!=0 and pixarr[i]=0){
					if (j<7){
						kdarr.Push("k")
						FileAppend,k, log.txt
					}
					if (j>6){
						kdarr.Push("d")
						FileAppend,d, log.txt
					}
					j:=1
				}
				i:=i+1
			}
			FormatTime, TimeString,, HH:mm:ss		
			FileAppend,`n%TimeString% | KD array found `n, log.txt





			nado:= 0
			1ch_code:=s
			2ch_code:=s
			for i, element in kdarr
			{
				if (kdarr[i] = " "){
					StringLen, Length, 1ch_code
					if (Length < 4){
						1ch_code:=""
					}else{
						nado:= 1
					}
				}
				if (nado=0){
					1ch_code.=kdarr[i]
				}
				if (nado=1){
					2ch_code.=kdarr[i]
				}
			}
			FormatTime, TimeString,, HH:mm:ss		
			FileAppend,%TimeString% | KD array splited | %1ch_code% - %2ch_code% `n, log.txt


			1ch:=0
			2ch:=0

			if(RegExMatch(1ch_code, odin)!=0){
				1ch:= 1
			}else if(RegExMatch(1ch_code, pyat)!=0){
				1ch:= 5
			}else if(RegExMatch(1ch_code, pyat2)!=0){
				1ch:= 5
			}else if(RegExMatch(1ch_code, pyat3)!=0){
				1ch:= 5
			}else if(RegExMatch(1ch_code, tri)!=0){
				1ch:= 3
			}else if(RegExMatch(1ch_code, chetire)!=0){
				1ch:= 4
			}else if(RegExMatch(1ch_code, shest)!=0){
				1ch:= 6
			}else if(RegExMatch(1ch_code, vosem)!=0){
				1ch:= 8
			}else if(RegExMatch(1ch_code, vosem2)!=0){
				1ch:= 8
			}else if(RegExMatch(1ch_code, sem)!=0){
				1ch:= 7
			}else if(RegExMatch(1ch_code, sem2)!=0){
				1ch:= 7
			}else if(RegExMatch(1ch_code, devyat)!=0){
				1ch:= 9
			}else if(RegExMatch(1ch_code, dva)!=0){
				1ch:= 2
			}


			if(RegExMatch(2ch_code, odin)!=0){
				2ch:= 1
			}else if(RegExMatch(2ch_code, pyat)!=0){
				2ch:= 5
			}else if(RegExMatch(2ch_code, pyat2)!=0){
				2ch:= 5
			}else if(RegExMatch(2ch_code, pyat3)!=0){
				1ch:= 5
			}else if(RegExMatch(2ch_code, tri)!=0){
				2ch:= 3
			}else if(RegExMatch(2ch_code, chetire)!=0){
				2ch:= 4
			}else if(RegExMatch(2ch_code, shest)!=0){
				2ch:= 6
			}else if(RegExMatch(2ch_code, vosem)!=0){
				2ch:= 8
			}else if(RegExMatch(2ch_code, vosem2)!=0){
				2ch:= 8
			}else if(RegExMatch(2ch_code, sem)!=0){
				2ch:= 7
			}else if(RegExMatch(2ch_code, sem2)!=0){
				2ch:= 7
			}else if(RegExMatch(2ch_code, devyat)!=0){
				2ch:= 9
			}else if(RegExMatch(2ch_code, dva)!=0){
				2ch:= 2
			}
			FormatTime, TimeString,, HH:mm:ss		
			FileAppend,%TimeString% | Transform ch_code to ch `n, log.txt

			sum:=1ch+2ch

			;msgbox, %1ch_code% - %2ch_code% `n %1ch% + %2ch% = %sum%
			FormatTime, TimeString,, HH:mm:ss		
			FileAppend,%TimeString% | %1ch% + %2ch% = %sum% | Latest: %sum1sproba% `n, log.txt

			if (sum1sproba=sum){
				sum1sproba:=0
				MouseMove, 1070, 450
				sleep 150
				click
				sleep 150
				Send {WheelUp}
				sleep 150
				Send {WheelUp}
				sleep 150
				Send {WheelUp}
				sleep 150
				MouseMove, 1070, 450
				sleep 150
				click
				sleep 1000
				ImageSearch, XF, YF, 930, 435, 980, 480, *90 %sum%.jpg
				if (ErrorLevel = 0 and 1ch!=0 and 2ch!=0) {
					;msgbox Found ans 1
					MouseMove, 900, 790
					sleep 150
					click
					FormatTime, TimeString,, HH:mm:ss		
					FileAppend,%TimeString% | CHPC INSERT`, VALUE 1 `n, log.txt
					sum1sproba:=0
				
				}else{
					sleep 150
					MouseMove, 1070, 540
					sleep 150
					click
					sleep 1000
					ImageSearch, XF, YF, 930, 520, 980, 565, *90 %sum%.jpg
					if (ErrorLevel = 0  and 1ch!=0 and 2ch!=0) {
						;msgbox Found ans 2
						MouseMove, 900, 790
						sleep 150
						click
						FormatTime, TimeString,, HH:mm:ss		
						FileAppend,%TimeString% | CHPC INSERT`, VALUE 2 `n, log.txt
						sum1sproba:=0
					
					}else{
						sleep 150
						MouseMove, 1070, 630
						sleep 150
						click
						sleep 1000
						ImageSearch, XF, YF, 930, 610, 980, 660, *90 %sum%.jpg
						if (ErrorLevel = 0  and 1ch!=0 and 2ch!=0) {
							;msgbox Found ans 3
							MouseMove, 900, 790
							sleep 150
							click
							FormatTime, TimeString,, HH:mm:ss		
							FileAppend,%TimeString% | CHPC INSERT`, VALUE 3 `n, log.txt
							sum1sproba:=0

						
						}else{
							sleep 150
							Send {WheelDown}
							sleep 150
							Send {WheelDown}
							sleep 150
							Send {WheelDown}
							sleep 150
							MouseMove, 1070, 540
							sleep 150
							click
							sleep 1000
							ImageSearch, XF, YF, 930, 520, 980, 565, *90 %sum%.jpg
							if (ErrorLevel = 0  and 1ch!=0 and 2ch!=0) {
								;msgbox Found ans 4
								MouseMove, 900, 790
								sleep 150
								click
								FormatTime, TimeString,, HH:mm:ss		
								FileAppend,%TimeString% | CHPC INSERT`, VALUE 4 `n, log.txt
								sum1sproba:=0
							
							}else{
								sleep 150
								MouseMove, 1070, 630
								sleep 150
								click
								sleep 1000
								ImageSearch, XF, YF, 930, 610, 980, 660, *90 %sum%.jpg
								if (ErrorLevel = 0  and 1ch!=0 and 2ch!=0) {
									;msgbox Found ans 5
									MouseMove, 900, 790
									sleep 150
									click
									FormatTime, TimeString,, HH:mm:ss		
									FileAppend,%TimeString% | CHPC INSERT`, VALUE 5 `n, log.txt
									sum1sproba:=0

								
								}else{
									fail:=fail+1
									FormatTime, TimeString,, HH:mm:ss		
									FileAppend,%TimeString% | FAIL %fail% `n, log.txt
									if (fail=3){
										fail:=0
										FormatTime, TimeString,, HH:mm:ss		
										FileAppend,%TimeString% | FAIL_TOTAL `n, log.txt
										MouseMove, 900, 790
										sleep 150
										click
										sum1sproba:=0
									}
								}
							}
						}
					}
				}
			}else{
				sum1sproba:=sum
			}


			;msgbox %sum%.jpg
		}else{

			Send {e down}
			sleep, 8000
			Send {e up}
			Send {Space down}
			sleep, 5000
			Send {Space up}
			FileAppend,%TimeString% | Fish %vikopal% | All %vikopal_all%`n, log.txt
			vikopal:=vikopal+1
			vikopal_all:=vikopal_all+1
		}
		if (vikopal>chastota_sbrosa){
			;msgbox Vikopano %vikopal% iz %chastota_sbrosa%
			sleep 200
			;send {Esc}
			sleep 200
			Send {i}
			sleep 200
			PixelGetColor, color, 953, 89
			if (color = 0xFFFFFF){
				sleep 500
				FormatTime, TimeString,, HH:mm:ss		
				FileAppend,%TimeString% | Drop resourses `n, log.txt

				MouseMove, 326, 256, 20
				send {LButton down}
				MouseMove, 1040, 430, 20
				send {LButton up}

				sleep 500
				send {Esc}
				vikopal:=1
			}
			sleep 500
			send {e}
			sleep 500
		}
	}



Return

F7::
FormatTime, TimeString,, HH:mm:ss
FileAppend,%TimeString% | Bot pause `n`n, log.txt
msgbox Pause | Mined %vikopal% from %chastota_sbrosa%
Pause, On
Return
F8::
Pause, Off
msgbox Run | Mined %vikopal% from %chastota_sbrosa%
FormatTime, TimeString,, HH:mm:ss
FileAppend,%TimeString% | Bot run `n, log.txt
Return

End::
ExitApp
Return





