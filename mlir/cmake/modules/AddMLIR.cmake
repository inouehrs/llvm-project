macro(add_mlir_library name)
  cmake_parse_arguments(ARG
    "SHARED"
    ""
    ""
    ${ARGN})
  
  if( ARG_SHARED )
    set(LIBTYPE SHARED)
  else()
    # enforce LIBTYPE STATIC within MLIR even if BUILD_SHARED_LIBS is set
    set(LIBTYPE STATIC)
  endif()
  llvm_add_library(${name} ${LIBTYPE} ${ARG_UNPARSED_ARGUMENTS})
endmacro(add_mlir_library)
