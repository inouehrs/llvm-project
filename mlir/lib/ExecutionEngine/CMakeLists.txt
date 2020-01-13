llvm_map_components_to_libnames(outlibs "nativecodegen" "IPO")
add_mlir_library(MLIRExecutionEngine
  ExecutionEngine.cpp
  OptUtils.cpp

  ADDITIONAL_HEADER_DIRS
  ${MLIR_MAIN_INCLUDE_DIR}/mlir/ExecutionEngine
  )
target_link_libraries(MLIRExecutionEngine
  MLIRLLVMIR
  MLIRTargetLLVMIR
  LLVMAggressiveInstCombine
  LLVMAnalysis
  LLVMBitReader
  LLVMBitWriter
  LLVMExecutionEngine
  LLVMInstCombine
  LLVMMC
  LLVMOrcJIT
  LLVMScalarOpts
  LLVMSupport
  LLVMTarget
  LLVMTransformUtils
  LLVMVectorize
  ${outlibs})
