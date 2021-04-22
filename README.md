Quick start examples for integrating [Banuba SDK on macos](https://docs.banuba.com/docs/core/effect_player).

# Getting Started

1. Get the latest Banuba SDK archive for MacOS/Windows and the client token. Please fill out our form at [form at banuba.com](https://www.banuba.com/face-filters-sdk) website, or contact us via [info@banuba.com](mailto:info@banuba.com).
2. Copy `bnb_viewer_standalone/bnb_sdk/` into the `OEP_macos/bnb_sdk` dir:
    `bnb_viewer_standalone/bnb_sdk/` => `OEP_macos/bnb_sdk`
3. Copy `bnb_viewer_standalone/resources/` files into the `OEP_macos/resources` dir:
    `bnb_viewer_standalone/resources/` => `OEP_macos/resources`
4. Copy `bnb_viewer_standalone/third` files into the `OEP_macos/third` dir:
    `bnb_viewer_standalone/third/` => `OEP_macos/third`
5. Copy and Paste your client token into the appropriate section of `OEP_macos/ViewController.swift`
6. Generate project files by executing the following commands:
    ##### MacOS build:
    ```
        cd %path_to_repository%
        mkdir build
        cd build
        cmake -G Xcode ..
    ```
7. The previous step will generate a Xcode project for MacOS. Open the offscreen_effect_player_macos project in an appropriate IDE on your platform.
8. Select target `example_mac`.
9. Run build.

# Integration of the banuba_oep framework into the Xcode project

1. Follow the first 7 steps from "Getting Started".
2. Select target `banuba_oep` and build(Release and Debug).
3. Copy the assembly framework `banuba_oep.framework` to your application directory
4. Copy the `bnb_sdk` to your application direcory
5. Copy the `resources` to your application direcory
6. Add in your project settings in the `General` tab in `Frameworks, Libraries, and Embedded Content` references to frameworks:
    - Accelerate
    - OpenGL
    - BanubaEffectPlayer
    - BanubaPostprocess
    - banuba_oep
![Alt text](/resources/images/2DB863E6-8769-43CF-BAD9-21872C4147DA_4_5005_c.jpeg?raw=true "Title")
7. Add in the `Build Settings` tab paths to headers to `banuba_oep.framework/Headers`
![Alt text](/resources/images/EE331F32-85E8-4FDC-8818-3640F0315FEB_4_5005_c.jpeg?raw=true "Title")
8. Add in the `Build Settings` tab linker flag `-lc++`
![Alt text](/resources/images/613B7E40-66DA-4C65-9F44-5FAAF93760CB_4_5005_c.jpeg?raw=true "Title")
9. Add in the `Build Phases` tab in `Copy Bundle Resources` path to effects(from `resources` directory)
![Alt text](/resources/images/3BAA3154-EF4F-4873-A694-AA25353AB950_4_5005_c.jpeg?raw=true "Title")
10. Add or update bridging header, adding to it `#import "BNBOffscreenEffectPlayer.h"`

These steps are enough for you to use in your project BNBOffscreenEffectPlayer.

# Contributing

Contributions are what make the open source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

# Sample structure

- **interfaces** - offscreen effect player interfaces
- **offscreen_effect_player** - is a wrapper for effect_player. It allows you to use your own implementation for offscreen_render_target
- **offscreen_render_target** - is an implementation option for the offscreen_render_target interface. Allows to prepare gl framebuffers and textures for receiving a frame from gpu, receive bytes of the processed frame from the gpu and pass them to the cpu, as well as, if necessary, set the orientation for the received frame. This implementation uses GLFW to work with gl context
- **libraries**
    - **utils**
        - **ogl_utils** - contains helper classes to work with Open GL
        - **utils** - сontains common helper classes such as thread_pool
- **ViewController.swift** - contains a pipeline of frames received from the camera and sent for processing the effect and the subsequent receipt of processed frames

# Note

For integration of the Offscreen Effect player to your application it is necessary to copy the offscreen_effect_player folder and implement interfaces for offscreen_render_target, or you can just reuse offscreen_render_target.
