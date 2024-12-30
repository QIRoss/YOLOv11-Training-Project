# YOLOv11 Training Project

## Overview
This project demonstrates the training of a YOLO model on a custom dataset of cats and dogs. The process was carried out locally using VSCode on the following system specifications:

### System Specifications
- **Processor**: Intel Core i3-10100F
- **Memory**: 32GB (2x16GB) DDR4
- **GPU**: NVIDIA GeForce GTX 1050 Ti
- **Operating System**: Ubuntu Linux 20.04

## Training Details
The YOLO model was trained for **10 epochs** on the dataset. The dataset used was `kagglecatanddogs_5340.zip`, which was extended and organized for optimized training with cats and dogs. The training process included the following steps:

1. Organizing the dataset into training and validation directories.
2. Using the `movebash.sh` script to rename files for clarity. This included swapping `cats` and `dogs` during the renaming process.
3. Training was performed with the pre-trained YOLO weights to preserve the generalized learning capabilities of the model.

## Commands Used
Below are some of the key commands used during the project:

1. **Creating Directories for Training and Validation**:
   ```bash
   mkdir -p ./PetImages/train/images
   mkdir -p ./PetImages/train/labels
   mkdir -p ./PetImages/val/images
   mkdir -p ./PetImages/val/labels
   ```

2. **Organizing Dataset**:
   ```bash
   mv ./runs/detect/predict/images/*.jpg ./PetImages/train/images/
   mv ./runs/detect/predict/labels/*.txt ./PetImages/train/labels/
   mv ./runs/detect/predict6/images/*.jpg ./PetImages/train/images/
   mv ./runs/detect/predict6/labels/*.txt ./PetImages/train/labels/
   ```

3. **Executing the `movebash.sh` Script**:
   ```bash
   chmod +x movebash.sh
   ./movebash.sh
   ```

4. **Training the YOLO Model**:
   ```bash
   yolo task=detect mode=train model=yolo11n.pt data=./data.yaml epochs=10 imgsz=640
   ```

5. **Validation of the Trained Model**:
   ```bash
   yolo task=detect mode=val model=./runs/detect/train/weights/best.pt data=./data.yaml
   ```

6. **Prediction on a Single Image**:
   ```bash
   yolo task=detect mode=predict model=last.pt source=PetImages/train/images/dog_6380.jpg
   ```

7. **Comparing with Original YOLO Performance**:
   To verify that the model still aligns with the original YOLO's capabilities, you can compare predictions on the default dataset:
   ```bash
   yolo task=detect mode=predict model=last.pt source='https://ultralytics.com/images/bus.jpg'
   ```

## Outputs
The following weights were generated and saved outside the repository for evaluation:

- **`best.pt`**: This file contains the weights of the best-performing model based on validation metrics.
- **`last.pt`**: This file contains the weights from the final epoch of training, allowing further fine-tuning if necessary.

Both files were saved separately for evaluation and potential deployment.

## Notes on File Renaming
During the file renaming process, the script `movebash.sh` was used within the `ultralytics` folder to systematically rename and organize files. This step included swapping naming conventions for `cats` and `dogs`, ensuring a consistent structure for training and validation datasets.

## Repository Structure
- **`PetImages/`**: Contains the organized dataset for training and validation.
- **`ultralytics/`**: Contains the scripts and configuration files, including `movebash.sh` and the YOLO training scripts.
- **`best.pt` and `last.pt`**: Saved externally for evaluation purposes.

## Tools Used
- **VSCode**: For managing the project and running the scripts.
- **YOLO by Ultralytics**: For training and evaluating the model.
- **Python 3.11** with PyTorch and CUDA 11.7: For efficient model training using GPU acceleration.

## Summary
This project showcases the training of a YOLO model on a custom dataset of cats and dogs using a local machine. The dataset `kagglecatanddogs_5340.zip` was extended and optimized for this purpose. The generated weights (`best.pt` and `last.pt`) provide a foundation for further evaluation and potential deployment in real-world applications.

