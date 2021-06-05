export LDFLAGS="-rdynamic"
./configure --with-features=huge \
    --with-python3-config-dir=/usr/lib/python3.9/config-3.9-x86_64-linux-gnu \
    --with-python3-command=/usr/bin/python \
    --enable-python3interp=yes \
    --with-x \
    --enable-fontset \
    --enable-cscope \
    --enable-fail-if-missing \
    --enable-multibyte \
    --with-compiledby="IjonTichy"
