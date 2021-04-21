set(FRAMEWORK_NAME "BanubaOEP") 

# cmake_policy(SET CMP0079 NEW)

set(APP_HEADER_FILES
    ${PROJECT_SOURCE_DIR}/offscreen_effect_player/include/BNBOffscreenEffectPlayer.h
)

set(APP_SOURCE_FILES
    # ${CMAKE_CURRENT_LIST_DIR}/offscreen_effect_player/dummy.cpp
    ${PROJECT_SOURCE_DIR}/offscreen_effect_player/src/BNBOffscreenEffectPlayer.mm
    # /Users/vadim.voloshanov/banuba_projects/test/OEP_macos/offscreen_render_target/src/offscreen_render_target.mm
)

add_library(${FRAMEWORK_NAME} STATIC
    ${APP_SOURCE_FILES}
    ${APP_HEADER_FILES}
)

target_link_libraries(${FRAMEWORK_NAME}
    full_image_data
    ogl_utils
    offscreen_ep
    offscreen_rt
    glad
)

set(ST_STATIC_LIB_OUTPUT_DIR ${PROJECT_SOURCE_DIR}/build/framework)

# create_linking_flags(linking_flags ${FRAMEWORK_NAME})
# set_target_properties(${LibraryId} PROPERTIES XCODE_ATTRIBUTE_OTHER_LIBTOOLFLAGS "-lpostal_peerconnection_static ${linking_flags}")

# collect_public_headers(public_headers ${FRAMEWORK_NAME})
set(public_headers ${PROJECT_SOURCE_DIR}/offscreen_effect_player/include/BNBOffscreenEffectPlayer.h)

add_custom_command(TARGET ${FRAMEWORK_NAME} POST_BUILD
  COMMAND sh ${PROJECT_SOURCE_DIR}/toolchain/pack_framework.sh ${FRAMEWORK_NAME} ${PROJECT_SOURCE_DIR}/offscreen_effect_player/include ${ST_STATIC_LIB_OUTPUT_DIR} $<IF:$<CONFIG:Debug>,Debug,Release> ${public_headers}
)
