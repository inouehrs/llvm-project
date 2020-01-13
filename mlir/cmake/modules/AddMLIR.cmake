macro(add_mlir_library name)
  cmake_parse_arguments(ARG
    "SHARED;STATIC;BUILDTREE_ONLY;MODULE;INSTALL_WITH_TOOLCHAIN"
    ""
    ""
    ${ARGN})

  # LIBTYPE=STATIC as the default within MLIR even with BUILD_SHARED_LIBS=ON
  set(LIBTYPE SHARED)

  if(ARG_MODULE)
    set(LIBTYPE MODULE)
  elseif( ARG_SHARED )
    set(LIBTYPE SHARED)
  elseif( ARG_STATIC )
    set(LIBTYPE STATIC)
  endif()
  llvm_add_library(${name} ${LIBTYPE} ${ARG_UNPARSED_ARGUMENTS})

  # Libraries that are meant to only be exposed via the build tree only are
  # never installed and are only exported as a target in the special build tree
  # config file.
  if (NOT ARG_BUILDTREE_ONLY AND NOT ARG_MODULE)
    set_property( GLOBAL APPEND PROPERTY LLVM_LIBS ${name} )
    set(in_llvm_libs YES)
  endif()

  if (ARG_MODULE AND NOT TARGET ${name})
    # Add empty "phony" target
    add_custom_target(${name})
  elseif( EXCLUDE_FROM_ALL )
    set_target_properties( ${name} PROPERTIES EXCLUDE_FROM_ALL ON)
  elseif(ARG_BUILDTREE_ONLY)
    set_property(GLOBAL APPEND PROPERTY LLVM_EXPORTS_BUILDTREE_ONLY ${name})
  else()
    if (NOT LLVM_INSTALL_TOOLCHAIN_ONLY OR ARG_INSTALL_WITH_TOOLCHAIN)

      set(export_to_llvmexports)
      if(${name} IN_LIST LLVM_DISTRIBUTION_COMPONENTS OR
          (in_llvm_libs AND "llvm-libraries" IN_LIST LLVM_DISTRIBUTION_COMPONENTS) OR
          NOT LLVM_DISTRIBUTION_COMPONENTS)
        set(export_to_llvmexports EXPORT LLVMExports)
        set_property(GLOBAL PROPERTY LLVM_HAS_EXPORTS True)
      endif()

      install(TARGETS ${name}
              ${export_to_llvmexports}
              LIBRARY DESTINATION lib${LLVM_LIBDIR_SUFFIX} COMPONENT ${name}
              ARCHIVE DESTINATION lib${LLVM_LIBDIR_SUFFIX} COMPONENT ${name}
              RUNTIME DESTINATION bin COMPONENT ${name})

      if (NOT LLVM_ENABLE_IDE)
        add_llvm_install_targets(install-${name}
                                 DEPENDS ${name}
                                 COMPONENT ${name})
      endif()
    endif()
    set_property(GLOBAL APPEND PROPERTY LLVM_EXPORTS ${name})
  endif()
  if (ARG_MODULE)
    set_target_properties(${name} PROPERTIES FOLDER "Loadable modules")
  else()
    set_target_properties(${name} PROPERTIES FOLDER "Libraries")
  endif()
endmacro(add_mlir_library)
