set $_LABEL_.background _backgr_
set $_LABEL_.foreground _foregr_
set $_LABEL_.gray 	    _altblack_
set $_LABEL_.primary    _primary_
set $_LABEL_.secondary  _secondary_
set $_LABEL_.tertiary   _tertiary_
set $_LABEL_.warning    _special_

client.focused	        _LABEL_ $_LABEL_.primary $_LABEL_.primary	 $_LABEL_.background $_LABEL_.primary
client.focused_inactive _LABEL_ $_LABEL_.primary $_LABEL_.primary 	 $_LABEL_.background $_LABEL_.primary
client.unfocused        _LABEL_ $_LABEL_.gray    $_LABEL_.gray      $_LABEL_.foreground $_LABEL_.secondary
client.urgent           _LABEL_ $_LABEL_.warning $_LABEL_.warning   $_LABEL_.foreground $_LABEL_.warning
