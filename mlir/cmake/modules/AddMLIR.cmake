# wrapper around llvm_add_library to enforce LIBTYPE=STATIC for MLIR
macro(add_mlir_library name)
  cmake_parse_arguments(ARG
    "SHARED;STATIC;MODULE"
    ""
    ""
    ${ARGN})

  # LIBTYPE=STATIC as the default within MLIR even with BUILD_SHARED_LIBS=ON
  # since MLIR cannot be built as shared libraries.
  set(LIBTYPE STATIC)

  if(ARG_MODULE)
    set(LIBTYPE MODULE)
  elseif( ARG_SHARED )
    set(LIBTYPE SHARED)
  elseif( ARG_STATIC )
    set(LIBTYPE STATIC)
  endif()
  llvm_add_library(${name} ${LIBTYPE} ${ARG_UNPARSED_ARGUMENTS})
endmacro(add_mlir_library)
