add_mlir_library(MLIRVectorToLLVM
  ConvertVectorToLLVM.cpp

  ADDITIONAL_HEADER_DIRS
  ${MLIR_MAIN_INCLUDE_DIR}/mlir/Conversion/VectorToLLVM
)
set(LIBS
  MLIRLLVMIR
  MLIRStandardOps
  MLIRStandardToLLVM
  MLIRTransforms
  LLVMCore
  LLVMSupport
  )

add_dependencies(MLIRVectorToLLVM ${LIBS})
target_link_libraries(MLIRVectorToLLVM ${LIBS})
