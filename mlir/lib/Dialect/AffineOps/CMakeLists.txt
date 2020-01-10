add_mlir_library(MLIRAffineOps
  AffineOps.cpp
  DialectRegistration.cpp

  ADDITIONAL_HEADER_DIRS
  ${MLIR_MAIN_INCLUDE_DIR}/mlir/Dialect/AffineOps

  DEPENDS
  MLIRAffineOpsIncGen
  MLIRLoopLikeInterfaceIncGen
  )
add_dependencies(MLIRAffineOps
  MLIRAffineOpsIncGen
  MLIRIR
  MLIRLoopLikeInterfaceIncGen
  MLIRStandardOps)
target_link_libraries(MLIRAffineOps MLIRIR MLIRStandardOps)

