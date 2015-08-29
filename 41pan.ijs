tenx =: ($&10) @: $
undigits =: (#.~ tenx)

a =: undigits (i. - !7 ) A. 1 + i.7

echo (#~ (1&p:) ) a
