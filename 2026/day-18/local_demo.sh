#!/bin/bash

var() {
local var1="khushi"
var2="Avni"
echo "$var1"
echo "$var2"
}
var
 << Comment
Only the variable var2 gets displayed when called outside the function
The other variable var1 doesn't get displayed!
Comment
echo "$var1"
echo "$var2"