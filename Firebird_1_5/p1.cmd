echo n| copy firebird.conf firebird.conf.original
echo n| copy firebird.conf firebird.conf.second

patch -p 1 firebird.conf < firebird.conf.patched.diff
echo n| copy firebird.conf firebird.conf.patched

patch -p 1 firebird.conf.second < firebird.conf.second.diff
