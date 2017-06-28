#!/bin/sh

# See here: https://pqrs.org/osx/karabiner/document.html.en#export
# Save settings with:
# >>> karabiner export >> karabiner.sh
# Load settings with:
# >>> karabiner be_careful_to_use__clear_all_values_by_name PROFILE_NAME
# >>> bash karabiner.sh

cli=/usr/local/bin/karabiner

# Remap Caps to Esc, Needs system settings -> keyboard -> advanced -> no action
# $cli set remap.controlL2controlL_escape 1
# /bin/echo -n .
# $cli set remap.escape2capslock 1
# /bin/echo -n .
# Remap Fn with CtrL for MacBook
$cli set remap.controlL2fn 1
/bin/echo -n .
$cli set remap.fn_consumer_to_fkeys_f1 1
/bin/echo -n .
$cli set remap.fn_consumer_to_fkeys_f10 1
/bin/echo -n .
$cli set remap.fn_consumer_to_fkeys_f3 1
/bin/echo -n .
$cli set remap.fn_consumer_to_fkeys_f5 1
/bin/echo -n .
$cli set remap.fn_consumer_to_fkeys_f7 1
/bin/echo -n .
$cli set remap.fn2controlL 1
/bin/echo -n .
$cli set repeat.initial_wait 150
/bin/echo -n .
$cli set repeat.wait 10
/bin/echo -n .
/bin/echo
