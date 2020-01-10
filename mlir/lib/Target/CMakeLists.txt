add_mlir_library(MLIRTargetLLVMIRModuleTranslation
  LLVMIR/ModuleTranslation.cpp

  ADDITIONAL_HEADER_DIRS
  ${MLIR_MAIN_INCLUDE_DIR}/mlir/Target/LLVMIR
  DEPENDS
  intrinsics_gen
  )
target_link_libraries(MLIRTargetLLVMIRModuleTranslation
  MLIRLLVMIR LLVMCore LLVMIRReader LLVMSupport LLVMTransformUtils
  MLIRTranslation)
add_mlir_library(MLIRTargetLLVMIR
  LLVMIR/ConvertFromLLVMIR.cpp
  LLVMIR/ConvertToLLVMIR.cpp

  ADDITIONAL_HEADER_DIRS
  ${MLIR_MAIN_INCLUDE_DIR}/mlir/Target/LLVMIR
  )
target_link_libraries(MLIRTargetLLVMIR MLIRTargetLLVMIRModuleTranslation)
add_mlir_library(MLIRTargetNVVMIR
  LLVMIR/ConvertToNVVMIR.cpp

  ADDITIONAL_HEADER_DIRS
  ${MLIR_MAIN_INCLUDE_DIR}/mlir/Target/LLVMIR
  DEPENDS
  intrinsics_gen
  )
target_link_libraries(MLIRTargetNVVMIR
  MLIRGPU
  MLIRIR
  MLIRLLVMIR
  MLIRNVVMIR
  MLIRTargetLLVMIRModuleTranslation
  )
add_mlir_library(MLIRTargetROCDLIR
  LLVMIR/ConvertToROCDLIR.cpp

  ADDITIONAL_HEADER_DIRS
  ${MLIR_MAIN_INCLUDE_DIR}/mlir/Target/LLVMIR
  DEPENDS
  intrinsics_gen
  )
target_link_libraries(MLIRTargetROCDLIR
  MLIRGPU
  MLIRIR
  MLIRLLVMIR
  MLIRROCDLIR
  MLIRTargetLLVMIRModuleTranslation
  )
