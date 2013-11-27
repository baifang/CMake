
macro(find_dependency dep)
  if (NOT ${dep}_FOUND)
    if (${ARGV1})
      set(version ${ARGV1})
    endif()
    set(exact_arg)
    if(${CMAKE_FIND_PACKAGE_NAME}_FIND_VERSION_EXACT)
      set(exact_arg EXACT)
    endif()
    set(quiet_arg)
    if(${CMAKE_FIND_PACKAGE_NAME}_FIND_QUIETLY)
      set(quiet_arg QUIET)
    endif()
    set(required_arg)
    if(${CMAKE_FIND_PACKAGE_NAME}_FIND_REQUIRED)
      set(required_arg REQUIRED)
    endif()

    find_package(${dep} ${version} ${exact_arg} ${quiet_arg} ${required_arg})
    if (NOT ${dep}_FOUND)
      set(${CMAKE_FIND_PACKAGE_NAME}_NOT_FOUND_MESSAGE \"${CMAKE_FIND_PACKAGE_NAME} could not be found because dependency ${dep} could not be found.\")
      set(${CMAKE_FIND_PACKAGE_NAME}_FOUND False)
      return()
    endif()
    set(required_arg)
    set(quiet_arg)
    set(exact_arg)
  endif()
endmacro()
