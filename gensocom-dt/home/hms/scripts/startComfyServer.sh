#!/bin/bash
# --enable-manager, --disable-all-custom-nodes
source ~/git/ComfyUI/.venv/bin/activate; python ~/git/ComfyUI/main.py --disable-all-custom-nodes --listen 0.0.0.0; deactivate
