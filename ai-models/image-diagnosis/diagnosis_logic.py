

import tensorflow as tf
from tensorflow.keras import layers, models, Input
from tensorflow.keras.utils import plot_model
import matplotlib.pyplot as plt
import os


try:
    from roboflow import Roboflow
except ImportError:
    !pip install -q roboflow
    from roboflow import Roboflow

print(f"TensorFlow Version: {tf.__version__}")

rf = Roboflow(api_key="")
project = rf.workspace("m-phxif").project("kaggle-dataset-iziin")
version = project.version(1)


print("Downloading dataset using CLIP format to convert Detection -> Classification structure...")
dataset = version.download("clip") 


DATA_DIR = os.path.join(dataset.location, "train") 
IMG_HEIGHT = 224  
IMG_WIDTH = 224
BATCH_SIZE = 32

print("\n--- Loading and Preprocessing Data ---")
train_ds = tf.keras.utils.image_dataset_from_directory(
    DATA_DIR,
    validation_split=0.2,
    subset="training",
    seed=123,
    image_size=(IMG_HEIGHT, IMG_WIDTH),
    batch_size=BATCH_SIZE,
    label_mode='categorical' 
)

val_ds = tf.keras.utils.image_dataset_from_directory(
    DATA_DIR,
    validation_split=0.2,
    subset="validation",
    seed=123,
    image_size=(IMG_HEIGHT, IMG_WIDTH),
    batch_size=BATCH_SIZE,
    label_mode='categorical'
)

class_names = train_ds.class_names
num_classes = len(class_names)
print(f"Classes Detected ({num_classes}): {class_names}")

AUTOTUNE = tf.data.AUTOTUNE
train_ds = train_ds.cache().shuffle(1000).prefetch(buffer_size=AUTOTUNE)
val_ds = val_ds.cache().prefetch(buffer_size=AUTOTUNE)

data_augmentation = tf.keras.Sequential([
    layers.RandomFlip("horizontal_and_vertical", name="aug_flip"),
    layers.RandomRotation(0.2, name="aug_rotation"),
    layers.RandomZoom(0.2, name="aug_zoom"),
    layers.RandomContrast(0.2, name="aug_contrast")
], name="Augmentation_Block")

def build_custom_cnn():
    inputs = Input(shape=(IMG_HEIGHT, IMG_WIDTH, 3))

    x = data_augmentation(inputs)
    x = layers.Rescaling(1./255, name="normalization")(x) 

    
    x = layers.Conv2D(32, (3, 3), padding='same', activation='relu', name="conv_1")(x)
    x = layers.BatchNormalization(name="batch_norm_1")(x) 
    x = layers.MaxPooling2D((2, 2), name="pool_1")(x)

    
    x = layers.Conv2D(64, (3, 3), padding='same', activation='relu', name="conv_2")(x)
    x = layers.BatchNormalization(name="batch_norm_2")(x)
    x = layers.MaxPooling2D((2, 2), name="pool_2")(x)

    
    x = layers.Conv2D(128, (3, 3), padding='same', activation='relu', name="conv_3")(x)
    x = layers.BatchNormalization(name="batch_norm_3")(x)
    x = layers.MaxPooling2D((2, 2), name="pool_3")(x)

    
    x = layers.Conv2D(256, (3, 3), padding='same', activation='relu', name="conv_4")(x)
    x = layers.MaxPooling2D((2, 2), name="pool_4")(x)

   
    x = layers.Flatten(name="flatten")(x)
    x = layers.Dense(256, activation='relu', name="dense_hidden")(x)
    x = layers.Dropout(0.5, name="dropout")(x) 
    outputs = layers.Dense(num_classes, activation='softmax', name="output_layer")(x)

    model = models.Model(inputs=inputs, outputs=outputs, name="AgriSphere_Custom_Net")
    return model

model = build_custom_cnn()

model.compile(
    optimizer=tf.keras.optimizers.Adam(learning_rate=0.001),
    loss='categorical_crossentropy',
    metrics=['accuracy', tf.keras.metrics.Precision(), tf.keras.metrics.Recall()]
)

model.summary()

plot_model(model, to_file='agrisphere_model_architecture.png', show_shapes=True, show_layer_names=True, dpi=96)
print("\nModel architecture diagram saved as 'agrisphere_model_architecture.png'")

print("\n--- Starting Training Process ---")
history = model.fit(
    train_ds,
    validation_data=val_ds,
    epochs=10, 
    verbose=1
)

acc = history.history['accuracy']
val_acc = history.history['val_accuracy']
loss = history.history['loss']
val_loss = history.history['val_loss']
epochs_range = range(len(acc))

plt.figure(figsize=(12, 6))
plt.subplot(1, 2, 1)
plt.plot(epochs_range, acc, label='Training Accuracy')
plt.plot(epochs_range, val_acc, label='Validation Accuracy')
plt.legend(loc='lower right')
plt.title('Training and Validation Accuracy')

plt.subplot(1, 2, 2)
plt.plot(epochs_range, loss, label='Training Loss')
plt.plot(epochs_range, val_loss, label='Validation Loss')
plt.legend(loc='upper right')
plt.title('Training and Validation Loss')
plt.show()



# # pip install fastapi uvicorn Pillow

# # Import FastAPI and related utilities
# # from fastapi import FastAPI, UploadFile, File, HTTPException
# # from PIL import Image
# # import io
# # import uvicorn
# # import numpy as np

# # # app = FastAPI(title="AgriSphere Plant Disease Classification API", version="1.0")

# # # def preprocess_image(image: Image.Image):
# # #     """Resizes and normalizes the image for model prediction."""
# # #     # Resize the image to the model's expected input dimensions (224x224)
# # #     image = image.resize((IMG_HEIGHT, IMG_WIDTH))
# # #     img_array = np.array(image, dtype=np.float32)
# # #     
# # #     # The model already contains a Rescaling(1./255) layer internally, 
# # #     # so minimal initial preprocessing is needed here for raw pixel values.
# # #     
# # #     # Add a batch dimension (B, H, W, C)
# # #     img_array = np.expand_dims(img_array, axis=0)
# # #     return img_array

# # # @app.post("/predict/disease")
# # # async def predict_disease(file: UploadFile = File(...)):
# # #     """
# # #     Accepts an image file and returns the predicted disease class and confidence.
# # #     """
# # #     # Ensure the model is loaded/defined before predicting
# # #     if 'model' not in globals():
# # #         raise HTTPException(status_code=503, detail="Model is not loaded or trained yet.")

# # #     try:
# # #         # Read the image file contents
# # #         contents = await file.read()
# # #         
# # #         # Open the image using PIL
# # #         image = Image.open(io.BytesIO(contents)).convert("RGB")

# # #         # Preprocess the image
# # #         processed_image = preprocess_image(image)

# # #         # Get predictions (softmax probabilities)
# # #         predictions = model.predict(processed_image)
# # #         
# # #         # Extract the top prediction
# # #         predicted_class_index = np.argmax(predictions[0])
# # #         predicted_class_name = class_names[predicted_class_index]
# # #         confidence = float(predictions[0][predicted_class_index])

# # #         # Format all results for the API response
# # #         all_predictions = {name: float(p) for name, p in zip(class_names, predictions[0])}

# # #         # Return the structured response
# # #         return {
# # #             "filename": file.filename,
# # #             "status": "success",
# # #             "predicted_class": predicted_class_name,
# # #             "confidence": confidence,
# # #             "all_probabilities": all_predictions
# # #         }
# # #     except Exception as e:
# # #         # Return a detailed error if something goes wrong during processing
# # #         raise HTTPException(status_code=500, detail=f"Prediction failed due to internal error: {e}")

# # # @app.get("/")
# # # def home():
# # #     return {"message": "AgriSphere Classification API is operational. Visit /docs for more info."}

# # # # To run the API from your terminal, you would use: uvicorn <filename>:app --reload
# # # # The block below is if you want to execute the server directly from this script:
# # # if __name__ == "__main__":
# # #    # This needs to be uncommented ONLY if you are running the script locally 
# # #    # (e.g., in a standalone Python environment) and want to start the server.
# # #    # print("Starting FastAPI server on http://127.0.0.1:8000")
# # #    # uvicorn.run(app, host="0.0.0.0", port=8000)

