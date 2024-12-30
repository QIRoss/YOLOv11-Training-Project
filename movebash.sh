#!/bin/bash

# Renomear e mover arquivos Dog
for file in ./runs/detect/predict/*.jpg; do
  mv "$file" "./PetImages/train/images/dog_$(basename $file)"
done

for file in ./runs/detect/predict/labels/*.txt; do
  mv "$file" "./PetImages/train/labels/dog_$(basename $file)"
done

# Renomear e mover arquivos Cat
for file in ./runs/detect/predict2/*.jpg; do
  mv "$file" "./PetImages/train/images/cat_$(basename $file)"
done

for file in ./runs/detect/predict2/labels/*.txt; do
  mv "$file" "./PetImages/train/labels/cat_$(basename $file)"
done
