C_COLLECTION:C1488($col)
C_OBJECT:C1216($elem)

If (bTrace)
	TRACE:C157
End if 

$col:=WP Get elements:C1550(WParea; wk type image anchored:K81:248)
For each ($elem; $col)
	WP RESET ATTRIBUTES:C1344($elem; wk image expression:K81:258)
End for each 


