# clean base image containing only comfyui, comfy-cli and comfyui-manager
FROM runpod/worker-comfyui:5.5.1-base

# install custom nodes into comfyui (first node with --mode remote to fetch updated cache)
# Could not resolve custom node ReferenceLatent (no aux_id provided in workflow analysis)
# Could not resolve custom node FluxGuidance (no aux_id provided in workflow analysis)
# Could not resolve custom node ConditioningZeroOut (no aux_id provided in workflow analysis)
# Could not resolve custom node VAEEncode (no aux_id provided in workflow analysis)
# Could not resolve custom node UNETLoader (no aux_id provided in workflow analysis)
# Could not resolve custom node VAELoader (no aux_id provided in workflow analysis)
# Could not resolve custom node CLIPLoader (no aux_id provided in workflow analysis)
# Could not resolve custom node GetImageSize+ (no aux_id provided in workflow analysis)
# Could not resolve custom node JWImageResize (no aux_id provided in workflow analysis)
# Could not resolve custom node VAEDecode (no aux_id provided in workflow analysis)
# Could not resolve custom node KSampler (no aux_id provided in workflow analysis)
# Could not resolve custom node LoadImage (no aux_id provided in workflow analysis)
# Could not resolve custom node CLIPTextEncode (no aux_id provided in workflow analysis)
# Could not resolve custom node SaveImage (no aux_id provided in workflow analysis)
# Could not resolve custom node ResizeAndPadImage (no aux_id provided in workflow analysis)

# download models into comfyui
RUN comfy model download --url https://huggingface.co/rhdev7/flux-2-klein-9b.safetensors/resolve/main/flux-2-klein-9b.safetensors --relative-path models/diffusion_models --filename flux-2-klein-9b.safetensors
RUN comfy model download --url https://huggingface.co/Comfy-Org/flux2-dev/resolve/main/split_files/vae/flux2-vae.safetensors --relative-path models/vae --filename flux2-vae.safetensors
RUN comfy model download --url https://huggingface.co/Comfy-Org/vae-text-encorder-for-flux-klein-9b/resolve/main/split_files/text_encoders/qwen_3_8b.safetensors --relative-path models/clip --filename qwen_3_8b.safetensors
# COPY input/ /comfyui/input/
