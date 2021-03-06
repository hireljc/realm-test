include("${CMAKE_CURRENT_LIST_DIR}/Utilities.cmake")

check_generator("Xcode")

fix_xcode_try_compile()

set_common_xcode_attributes()

set(REALM_SKIP_SHARED_LIB ON)
set(CPACK_SYSTEM_NAME "watchos")

# CMake special-cases the compiler detection for iOS in a way that happens
# to also work for watchOS, so use the iphoneos base SDK to opt-in to that and
# then override the platform to watchOS below
set(CMAKE_OSX_SYSROOT "iphoneos")

set(CMAKE_XCODE_ATTRIBUTE_SUPPORTED_PLATFORMS "watchos watchsimulator")
set(CMAKE_XCODE_EFFECTIVE_PLATFORMS "-watchos;-watchsimulator")
set(CMAKE_XCODE_ATTRIBUTE_WATCHOS_DEPLOYMENT_TARGET "2.0")

set(CMAKE_XCODE_ATTRIBUTE_CODE_SIGN_IDENTITY "")
set(CMAKE_XCODE_ATTRIBUTE_CODE_SIGNING_REQUIRED "NO")

set(CMAKE_XCODE_ATTRIBUTE_ENABLE_BITCODE[sdk=watch*] "YES")

set_bitcode_attributes()

install_arch_slices_for_platform("watch")
