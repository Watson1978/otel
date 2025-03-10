// ruby.h contains a C++ template, which cannot be included in extern "C".
// Therefore, it includes the header in advance.
#include "ruby/defines.h"

extern "C" {
    #include "ruby.h"

    extern void Init_otel(void);
}