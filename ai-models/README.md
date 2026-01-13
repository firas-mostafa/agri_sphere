# AI Model (aimodel)

This folder contains the code, scripts, and documentation for the machine learning model(s) used by Agri Sphere. The repository aims to provide models for plant/disease detection, yield prediction, or other agricultural insights.

## Prerequisites
- Python 3.8+ (recommend 3.10)
- pip or poetry/poetryv1/venv
- GPU drivers and CUDA if using GPU (for PyTorch/TensorFlow training)

## Recommended packages
- numpy, pandas, scikit-learn
- PyTorch or TensorFlow (depending on implementation)
- torchvision (if using PyTorch and image models)
- albumentations (optional, for augmentation)

## Setup
1. Create a virtual environment: `python -m venv .venv`
2. Activate the environment:
   - macOS / Linux: `source .venv/bin/activate`
   - Windows (PowerShell): `.\.venv\Scripts\Activate.ps1`
3. Install dependencies: `pip install -r requirements.txt` (or `poetry install` if configured)

## Data
- Place training and validation datasets under `data/` (gitignore large datasets).
- Use `data/README.md` (if present) for dataset-specific formatting instructions.

## Training
- Typical training command: `python train.py --config configs/my_config.yaml --device cuda`
- Checkpoints are stored in `checkpoints/` by default.

## Inference
- Run inference with: `python infer.py --model checkpoints/best.pth --input path/to/image_or_folder --output results/`

## Integration with backend
- Export models (ONNX/TorchScript) to `models/` so the backend can load them for inference.
- See `aimodel/export/` for scripts that convert checkpoints to production formats.

## Notes
- Keep models and large binaries out of Git. Use object storage or a model registry for large files.
