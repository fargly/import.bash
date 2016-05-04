tests:make-tmp-dir -p vendor/lib-a/vendor/lib-b

tests:put vendor/lib-a/vendor/lib-b/lib-b.bash <<EOF
echo -n 3
EOF

tests:put vendor/lib-a/lib-a.bash <<EOF
import lib-b
echo -n 2
EOF

tests:put script.bash <<EOF
source import.bash

import lib-a
echo -n 1
EOF

tests:ensure source script.bash
tests:assert-stdout 321
