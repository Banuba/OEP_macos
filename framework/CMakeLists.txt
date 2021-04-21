set(FRAMEWORK_NAME "BanubaOEP") 

set(APP_HEADER_FILES
    ${PROJECT_SOURCE_DIR}/offscreen_effect_player/include/BNBOffscreenEffectPlayer.h
)

set(APP_SOURCE_FILES
    ${PROJECT_SOURCE_DIR}/offscreen_effect_player/src/BNBOffscreenEffectPlayer.mm
    ${PROJECT_SOURCE_DIR}/offscreen_effect_player/src/offscreen_effect_player.cpp
    ${PROJECT_SOURCE_DIR}/offscreen_effect_player/src/pixel_buffer.cpp
    ${PROJECT_SOURCE_DIR}/offscreen_render_target/src/offscreen_render_target.mm
    ${PROJECT_SOURCE_DIR}/offscreen_render_target/src/utils.mm
    ${PROJECT_SOURCE_DIR}/third/glad/src/glad.c
    ${PROJECT_SOURCE_DIR}/libraries/utils/ogl_utils/src/program.cpp
    ${PROJECT_SOURCE_DIR}/libraries/utils/ogl_utils/src/opengl.cpp
    ${PROJECT_SOURCE_DIR}/libraries/objcpp_helper/src/BNBFullImageData.m
    ${PROJECT_SOURCE_DIR}/libraries/objcpp_helper/src/BNBFullImageData+Private.mm
    ${PROJECT_SOURCE_DIR}/libraries/objcpp_helper/src/conversion.cpp
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

# collect_public_headers(public_headers ${FRAMEWORK_NAME})
set(public_headers ${PROJECT_SOURCE_DIR}/offscreen_effect_player/include/BNBOffscreenEffectPlayer.h)

add_custom_command(TARGET ${FRAMEWORK_NAME} POST_BUILD
  COMMAND sh ${PROJECT_SOURCE_DIR}/toolchain/pack_framework.sh ${FRAMEWORK_NAME} ${PROJECT_SOURCE_DIR}/offscreen_effect_player/include ${ST_STATIC_LIB_OUTPUT_DIR} $<IF:$<CONFIG:Debug>,Debug,Release> ${public_headers}
)
