set(LLVM_OPTIONAL_SOURCES
  Builders.cpp
  CoreAPIs.cpp
  Helpers.cpp
  Intrinsics.cpp
  )

add_mlir_library(MLIREDSC
  Builders.cpp
  Helpers.cpp
  Intrinsics.cpp

  ADDITIONAL_HEADER_DIRS
  ${MLIR_MAIN_INCLUDE_DIR}/mlir/EDSC
  )
target_link_libraries(MLIREDSC
  PUBLIC
    MLIRAffineOps
    MLIRLoopOps
    MLIRStandardOps
    MLIRTransformUtils
    MLIRVectorOps
    )

add_mlir_library(MLIREDSCInterface
  CoreAPIs.cpp

  ADDITIONAL_HEADER_DIRS
  ${MLIR_MAIN_INCLUDE_DIR}/mlir/EDSC
  )
add_dependencies(MLIREDSCInterface MLIRIR)
target_link_libraries(MLIREDSCInterface
  PUBLIC
    MLIRIR
    MLIRSupport
    MLIRParser
    )
