# Support.
add_mlir_library(MLIRQuantizerSupport
  Support/Configuration.cpp
  Support/ConstraintAnalysisGraph.cpp
  Support/Metadata.cpp
  Support/Statistics.cpp
  Support/TypeUtils.cpp
  Support/UniformConstraints.cpp
  Support/UniformSolvers.cpp

  ADDITIONAL_HEADER_DIRS
  )
add_dependencies(MLIRQuantizerSupport
                 MLIRIR
                 MLIRQuantOps
                 MLIRStandardOps
                 MLIRSupport
                 )

target_link_libraries(MLIRQuantizerSupport
                      MLIRIR
                      MLIRQuantOps
                      MLIRStandardOps
                      MLIRSupport
                      )

# Configurations.
add_mlir_library(MLIRQuantizerFxpMathConfig
  Configurations/FxpMathConfig.cpp

  ADDITIONAL_HEADER_DIRS
  )
add_dependencies(MLIRQuantizerFxpMathConfig
                 MLIRFxpMathOps
                 MLIRFxpMathOpsIncGen
                 MLIRQuantizerSupport)
target_link_libraries(MLIRQuantizerFxpMathConfig
                 MLIRFxpMathOps
                 MLIRQuantizerSupport)
# Transforms.
add_mlir_library(MLIRQuantizerTransforms
  Transforms/AddDefaultStatsTestPass.cpp
  Transforms/InferQuantizedTypesPass.cpp
  Transforms/RemoveInstrumentationPass.cpp

  ADDITIONAL_HEADER_DIRS
  )
add_dependencies(MLIRQuantizerTransforms
  MLIRQuantizerFxpMathConfig
  MLIRQuantizerSupport
  MLIRPass)
target_link_libraries(MLIRQuantizerTransforms
                      MLIRPass
                      MLIRQuantizerFxpMathConfig
                      MLIRQuantizerSupport)
