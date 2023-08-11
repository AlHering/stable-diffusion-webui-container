#################################################
# Script for installing common extensions for webui.
# The extensions are selected based on own preferences.
#################################################

# stable diffusion extension installer v0.2
import os


extensions = [
    ("https://github.com/KohakuBlueleaf/a1111-sd-webui-lycoris.git", "ce584a0f", "a1111-sd-webui-lycoris"),
    ("https://github.com/DominikDoom/a1111-sd-webui-tagcomplete.git", "3b51035c", "a1111-sd-webui-tagcomplete"),
    ("https://github.com/richrobber2/canvas-zoom.git", "72b90783", "canvas-zoom"),
    ("https://github.com/pharmapsychotic/clip-interrogator-ext.git", "9e6bbd9b", "clip-interrogator-ext"),
    ("https://github.com/s9roll7/ebsynth_utility.git", "c255e64a", "ebsynth_utility"),
    ("https://github.com/LonicaMewinsky/gif2gif.git", "cc164474", "gif2gif"),
    ("https://github.com/fkunn1326/openpose-editor.git", "0b10737e", "openpose-editor"),
    ("https://github.com/hnmr293/posex.git", "61169d30", "posex"),
    ("https://github.com/jtydhr88/sd-canvas-editor.git", "4f3ffe4a", "sd-canvas-editor"),
    ("https://github.com/nonnonstop/sd-webui-3d-open-pose-editor.git", "f2d5aac5", "sd-webui-3d-open-pose-editor"),
    ("https://github.com/thomasasfk/sd-webui-aspect-ratio-helper.git", "b03cce20", "sd-webui-aspect-ratio-helper"),
    ("https://github.com/Mikubill/sd-webui-controlnet.git", "cfc37659", "sd-webui-controlnet"),
    ("https://github.com/Akegarasu/sd-webui-model-converter.git", "d19e2816", "sd-webui-model-converter"),
    ("https://github.com/d8ahazard/sd_dreambooth_extension.git", "926ae204", "sd_dreambooth_extension"),
    ("https://github.com/AlUlkesh/sd_save_intermediate_images.git", "8115a847", "sd_save_intermediate_images"),
    ("https://github.com/opparco/stable-diffusion-webui-composable-lora.git", "d4963e48", "stable-diffusion-webui-composable-lora"),
    ("https://github.com/toshiaki1729/stable-diffusion-webui-dataset-tag-editor.git", "344fd995", "stable-diffusion-webui-dataset-tag-editor"),
    ("https://github.com/AlUlkesh/stable-diffusion-webui-images-browser.git", "84cb6174", "stable-diffusion-webui-images-browser"),
    ("https://github.com/AUTOMATIC1111/stable-diffusion-webui-rembg.git", "64821f04", "stable-diffusion-webui-rembg"),
    ("https://github.com/ilian6806/stable-diffusion-webui-state.git", "4cc8fa3c", "stable-diffusion-webui-state"),
    ("https://github.com/ashen-sensored/stable-diffusion-webui-two-shot.git", "6b55dd52", "stable-diffusion-webui-two-shot"),
    ("https://github.com/Coyote-A/ultimate-upscale-for-automatic1111.git", "d002fdfc", "ultimate-upscale-for-automatic1111")
]

base_cd_command = "cd /stable-diffusion-webui-container/stable-diffusion-webui/extensions"
for extension in extensions:
    print(f"Handling {extension[2]}")
    os.system(f"{base_cd_command} && git clone {extension[0]} && cd {extension[2]} && git checkout {extension[1]}")

print("Finished adding extensions.")
