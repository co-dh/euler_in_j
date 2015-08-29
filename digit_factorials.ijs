digits =: (($&10) @: >. @: (10& ^.) #: ] )"0
digit_factorials =: ((+/ @: ! @: digits) = ] )"0
echo (digit_factorials # ]) 3 + i.1000000


