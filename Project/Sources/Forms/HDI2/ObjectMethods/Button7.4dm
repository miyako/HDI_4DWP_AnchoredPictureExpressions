var $obImage : Object

If (bTrace)
	TRACE:C157
End if 

$obImage:=WP Add picture:C1536(WParea)  //second argument is now otionnal (empty pict by defaut)
WP SET ATTRIBUTES:C1342($obImage; wk image expression:K81:258; "TimestampPicture(0)")

// more attributes
WP SET ATTRIBUTES:C1342($obImage; wk anchor origin:K81:235; wk paper box:K81:215)
WP SET ATTRIBUTES:C1342($obImage; wk anchor horizontal align:K81:237; wk right:K81:96)
WP SET ATTRIBUTES:C1342($obImage; wk anchor vertical align:K81:239; wk top:K81:97)

