file(GLOB globbed *.c *.cpp)
add_mlir_library(MLIRLoopOps
  ${globbed}

  ADDITIONAL_HEADER_DIRS
  ${MLIR_MAIN_INCLUDE_DIR}/mlir/LoopOps
  )
add_dependencies(MLIRLoopOps MLIRLoopLikeInterfaceIncGen MLIRLoopOpsIncGen MLIRStandardOps LLVMSupport)
target_link_libraries(MLIRLoopOps LLVMSupport)
