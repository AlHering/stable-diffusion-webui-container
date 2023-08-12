#################################################
# Script for installing common extensions for webui.
# The extensions are selected based on own preferences.
#################################################

# stable diffusion extension installer v0.2
import os


extensions = [
    ("https://github.com/KohakuBlueleaf/a1111-sd-webui-lycoris.git",
     "8e97bf54", "a1111-sd-webui-lycoris"),
    ("https://github.com/DominikDoom/a1111-sd-webui-tagcomplete.git",
     "b937e853", "a1111-sd-webui-tagcomplete"),
    ("https://github.com/richrobber2/canvas-zoom.git", "44c13878", "canvas-zoom"),
    ("https://github.com/pharmapsychotic/clip-interrogator-ext.git",
     "c0bf9005", "clip-interrogator-ext"),
    ("https://github.com/s9roll7/ebsynth_utility.git", "44c18e0e", "ebsynth_utility"),
    ("https://github.com/LonicaMewinsky/gif2gif.git", "5121851e", "gif2gif"),
    ("https://github.com/fkunn1326/openpose-editor.git", "722bca6f", "openpose-editor"),
    ("https://github.com/hnmr293/posex.git", "292f92d5", "posex"),
    ("https://github.com/jtydhr88/sd-canvas-editor.git",
     "e89e0682", "sd-canvas-editor"),
    ("https://github.com/nonnonstop/sd-webui-3d-open-pose-editor.git",
     "f2d5aac5", "sd-webui-3d-open-pose-editor"),
    ("https://github.com/thomasasfk/sd-webui-aspect-ratio-helper.git",
     "99fcf9b0", "sd-webui-aspect-ratio-helper"),
    ("https://github.com/Mikubill/sd-webui-controlnet.git",
     "d67f31a3", "sd-webui-controlnet"),
    ("https://github.com/Akegarasu/sd-webui-model-converter.git",
     "b1f10148", "sd-webui-model-converter"),
    ("https://github.com/d8ahazard/sd_dreambooth_extension.git",
     "c2a5617c", "sd_dreambooth_extension"),
    ("https://github.com/AlUlkesh/sd_save_intermediate_images.git",
     "8115a847", "sd_save_intermediate_images"),
    ("https://github.com/opparco/stable-diffusion-webui-composable-lora.git",
     "d4963e48", "stable-diffusion-webui-composable-lora"),
    ("https://github.com/toshiaki1729/stable-diffusion-webui-dataset-tag-editor.git",
     "7a2f4c53", "stable-diffusion-webui-dataset-tag-editor"),
    ("https://github.com/AlUlkesh/stable-diffusion-webui-images-browser.git",
     "a3aeb93f", "stable-diffusion-webui-images-browser"),
    ("https://github.com/AUTOMATIC1111/stable-diffusion-webui-rembg.git",
     "3d9eedbb", "stable-diffusion-webui-rembg"),
    ("https://github.com/ilian6806/stable-diffusion-webui-state.git",
     "f2bb3809", "stable-diffusion-webui-state"),
    ("https://github.com/ashen-sensored/stable-diffusion-webui-two-shot.git",
     "6b55dd52", "stable-diffusion-webui-two-shot"),
    ("https://github.com/Coyote-A/ultimate-upscale-for-automatic1111.git",
     "c99f382b", "ultimate-upscale-for-automatic1111")
]

base_cd_command = "cd /stable-diffusion-webui-container/stable-diffusion-webui/extensions"
for extension in extensions:
    print(f"Handling {extension[2]}")
    os.system(
        f"{base_cd_command} && git clone {extension[0]} && cd {extension[2]} && git checkout {extension[1]}")

print("Finished adding extensions.")
