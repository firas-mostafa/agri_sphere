import React, { useState } from 'react';
import { X, Edit2, Plus, Package } from 'lucide-react';
import './modal.css'; 

const ProductModal = ({ product, onSave, onClose }) => {
  const [formData, setFormData] = useState(product || { name: '', price: '', quantity: '', unit: 'kg', category: 'seeds', image: '' });
  const [imagePreview, setImagePreview] = useState(product?.image || '');

  const handleImageUpload = (e) => {
    const file = e.target.files[0];
    if (file && file.size <= 5 * 1024 * 1024) {
      const reader = new FileReader();
      reader.onloadend = () => {
        setImagePreview(reader.result);
        setFormData({ ...formData, image: reader.result });
      };
      reader.readAsDataURL(file);
    } else {
      alert('Image size should be less than 5MB');
    }
  };

  const handleRemoveImage = () => {
    setImagePreview('');
    setFormData({ ...formData, image: '' });
  };

  return (
    <div className="harvest-overlay">
      <div className="crop-card">
        <h3 className="crop-title">{product ? 'Edit Product' : 'Add New Product'}</h3>
        <div className="agri-form">
          <div className="field-group">
            <label className="field-label">Product Name</label>
            <input
              type="text"
              value={formData.name}
              onChange={(e) => setFormData({ ...formData, name: e.target.value })}
              className="field-input"
              placeholder="Product Name"
            />
          </div>

          <div className="field-row">
            <div className="field-group">
              <label className="field-label">Price (SYP)</label>
              <input
                type="number"
                value={formData.price}
                onChange={(e) => setFormData({ ...formData, price: e.target.value })}
                className="field-input"
              />
            </div>
            <div className="field-group">
              <label className="field-label">Quantity</label>
              <input
                type="number"
                value={formData.quantity}
                onChange={(e) => setFormData({ ...formData, quantity: e.target.value })}
                className="field-input"
              />
            </div>
          </div>

          <div className="field-group">
            <label className="field-label">Unit</label>
            <select
              value={formData.unit}
              onChange={(e) => setFormData({ ...formData, unit: e.target.value })}
              className="field-select"
            >
              <option value="kg">kg</option>
              <option value="L">L</option>
              <option value="units">units</option>
            </select>
          </div>

          <div className="field-group">
            <label className="field-label">Category</label>
            <select
              value={formData.category}
              onChange={(e) => setFormData({ ...formData, category: e.target.value })}
              className="field-select"
            >
              <option value="seeds">Seeds</option>
              <option value="fertilizer">Fertilizer</option>
              <option value="insecticide">Insecticide</option>
            </select>
          </div>

          <div className="field-group">
            <label className="field-label">Product Image</label>
            {imagePreview ? (
              <div className="preview-area">
                <img src={imagePreview} alt="preview" className="crop-image" />
                <button onClick={handleRemoveImage} className="clear-btn icon-red">
                  <X size={18} />
                </button>
                <button
                  onClick={() => document.getElementById('image-upload').click()}
                  className="replace-btn icon-blue"
                >
                  <Edit2 size={18} /> Change Image
                </button>
              </div>
            ) : (
              <div className="upload-zone">
                <Package size={48} className="upload-icon" />
                <p className="upload-text">Upload product image</p>
                <button
                  onClick={() => document.getElementById('image-upload').click()}
                  className="upload-btn"
                >
                  Choose Image
                </button>
                <p className="upload-hint">Maximum size: 5MB</p>
              </div>
            )}
            <input
              id="image-upload"
              type="file"
              accept="image/*"
              onChange={handleImageUpload}
              className="hidden-file-input"
            />
          </div>
        </div>

        <div className="action-bar">
          <button
            onClick={() => {
              if (formData.name && formData.price && formData.quantity && formData.image) {
                onSave(formData);
              } else {
                alert('Fill all fields including image');
              }
            }}
            className="confirm-btn"
          >
            Save Product
          </button>
          <button onClick={onClose} className="discard-btn">
            Cancel
          </button>
        </div>
      </div>
    </div>
  );
};

export default ProductModal;