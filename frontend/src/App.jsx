import './App.css';
import React from 'react';
import { BrowserRouter, Route, Routes } from 'react-router';
import React, { useState } from 'react';
          // Engineer
//import NavBar from './components/NavBar';
import HomePage from './pages/Engineer/home/HomePage';
import ConsultationsPage from './pages/Engineer/consultation/Consultation';
import MarketplacePage from './pages/Engineer/marketplace/MarketplacePage';
import VideoCallPage from './pages/Engineer/video call/VideoCallPage';
import FeedbackPage from './pages/Engineer/feedback/FeedbackPage';
import ProductModal from './components/ProductModal/ProductModal';
import ChatModal from './components/Chat/ChatModal';
          // public
import Home from './pages/public/home/Home';
import FQA from './pages/public/fqa/FQA';
import Farmer from './pages/public/farmer/Farmer';
import Engineer from './pages/public/engineer/Engineer';
import Equipment from './pages/public/equipment/Equipment';
import Contact from './pages/public/contact/Contact';


function App() {

  return (
      <>
        <BrowserRouter>
          <Routes>

            {/* User Routes */}
            <Route path='/' element={<Home />} />
            <Route path='/fqa' element={<FQA />} />
            <Route path='/farmer' element={<Farmer />} />
            <Route path='/engineer' element={<Engineer />} />
            <Route path='/equipment' element={<Equipment />} />
            <Route path='/contact' element={<Contact />} />

          </Routes>
        </BrowserRouter>
        
      </>
      // Engineer
 /*  const [currentPage, setCurrentPage] = useState('home');
  const [showProductModal, setShowProductModal] = useState(false);
  const [editingProduct, setEditingProduct] = useState(null);
  const [showOrderModal, setShowOrderModal] = useState(false);
  const [selectedOrder, setSelectedOrder] = useState(null);
  const [showDownloadModal, setShowDownloadModal] = useState(false);
  const [showChatModal, setShowChatModal] = useState(false);
  const [currentChatFarmer, setCurrentChatFarmer] = useState(null);
  const [chatMessages, setChatMessages] = useState({});
  const [showRescheduleModal, setShowRescheduleModal] = useState(false);
  const [selectedCallId, setSelectedCallId] = useState(null);
  const [newDate, setNewDate] = useState('');
  const [newTime, setNewTime] = useState('');
  const [consultations, setConsultations] = useState([
    { id: 1, farmer: 'Fatima Al-Rashid', type: 'video', content: 'My wheat crop has yellow spots on leaves. Need urgent video consultation to identify the disease and get treatment recommendations.', status: 'pending', date: '2025-11-28 10:00', category: 'Video Call', topic: 'Wheat crop disease identification' },
    { id: 2, farmer: 'Fatima Al-Rashid', type: 'text', content: 'Looking for advice on the best organic fertilizer for my tomato plantation. Also need dosage recommendations.', status: 'pending', date: '2025-11-28 14:00', category: 'Text', topic: 'Best fertilizer for tomato plants' },
    { id: 3, farmer: 'Omar Hassan', type: 'video', content: 'Need consultation on setting up a drip irrigation system for my vegetable farm. Want to discuss equipment and installation.', status: 'pending', date: '2025-12-28 10:00', category: 'Video Call', topic: 'Irrigation system setup' },
    { id: 4, farmer: 'Sara Ibrahim', type: 'pest', content: 'Found small white insects on my cucumber plants. Need advice on safe pest control methods.', status: 'pending', date: '2025-05-28 14:00', category: 'Pest Report', topic: 'Pest control for cucumber plants' },
    { id: 5, farmer: 'Sofa Al-Rashid', type: 'video', content: 'My wheat crop has yellow spots on leaves. Need urgent video consultation to identify the disease and get treatment recommendations.', status: 'pending', date: '2025-11-28 11:00', category: 'Video Call', topic: 'Wheat crop disease identification' },
    { id: 6, farmer: 'Amira Youssef', type: 'text', content: 'Found small white insects on my cucumber plants. Need advice on safe pest control methods.', status: 'pending', date: '2025-05-28 14:00', category: 'Text', topic: 'Pest control for cucumber plants' }
  ]);

  const [products, setProducts] = useState([
    { id: 1, name: 'NPK Fertilizer', price: 4500, quantity: 50, unit: 'kg', category: 'fertilizer', image: 'image/svg+xml,%3Csvg xmlns="http://www.w3.org/2000/svg" width="100" height="100"%3E%3Crect fill="%234ade80" width="100" height="100"/%3E%3Ctext x="50" y="60" font-size="40" text-anchor="middle"%3E🌾%3C/text%3E%3C/svg%3E' },
    { id: 2, name: 'Organic Pesticide Spray', price: 3200, quantity: 15, unit: 'L', category: 'insecticide', image: 'image/svg+xml,%3Csvg xmlns="http://www.w3.org/2000/svg" width="100" height="100"%3E%3Crect fill="%233b82f6" width="100" height="100"/%3E%3Ctext x="50" y="60" font-size="40" text-anchor="middle"%3E💧%3C/text%3E%3C/svg%3E' }
  ]);

  const [orders, setOrders] = useState([
    { id: 1, farmer: 'Ahmed Hassan', productId: 1, productName: 'NPK Fertilizer', quantity: 10, unit: 'kg', totalPrice: 45000, status: 'pending', date: '2025-12-12 10:30' },
    { id: 2, farmer: 'Sara Mohamed', productId: 2, productName: 'Organic Pesticide Spray', quantity: 5, unit: 'L', totalPrice: 16000, status: 'processing', date: '2025-12-11 14:20', approvedDate: '2025-12-11 15:00' },
    { id: 3, farmer: 'Mahmoud Ali', productId: 1, productName: 'NPK Fertilizer', quantity: 20, unit: 'kg', totalPrice: 90000, status: 'on-way', date: '2025-12-10 09:15', approvedDate: '2025-12-10 10:00', shippedDate: '2025-12-11 08:00' }
  ]);

  const [feedback, setFeedback] = useState([
    { id: 1, farmer: 'Ahmed Hassan', type: 'consultation', rating: 5, date: '2025-12-11' },
    { id: 2, farmer: 'Sara Mohamed', type: 'product', rating: 4, date: '2025-12-10' },
    { id: 3, farmer: 'Omar Hassan', type: 'pest', rating: 4, date: '2025-12-09' },
    { id: 4, farmer: 'Sara Ibrahim', type: 'consultation', rating: 5, date: '2025-12-08' },
    { id: 5, farmer: 'Khalid Al-Mansour', type: 'consultation', rating: 4, date: '2025-12-07' },
    { id: 6, farmer: 'Amira Youssef', type: 'product', rating: 5, date: '2025-12-06' },
    { id: 7, farmer: 'Youssef Ibrahim', type: 'consultation', rating: 3, date: '2025-12-05' },
    { id: 8, farmer: 'Layla Hassan', type: 'product', rating: 5, date: '2025-12-04' },
    { id: 9, farmer: 'Hassan Ali', type: 'pest', rating: 4, date: '2025-12-03' },
    { id: 10, farmer: 'Nora Abdullah', type: 'product', rating: 5, date: '2025-12-02' },
    { id: 11, farmer: 'Fatima Al-Rashid', type: 'product', rating: 5, date: '2025-12-01' },
    { id: 12, farmer: 'Ahmed Khalil', type: 'consultation', rating: 5, date: '2025-11-30' }
  ]);

  const [upcomingCalls, setUpcomingCalls] = useState([
    { id: 1, farmer: 'Ahmed Khalil', topic: 'Wheat crop disease identification', date: 'Today at 10:00 AM', duration: '30 min' },
    { id: 2, farmer: 'Omar Hassan', topic: 'Irrigation system setup', date: 'Tomorrow at 11:00 AM', duration: '45 min' },
    { id: 3, farmer: 'Khalid Al-Mansour', topic: 'Soil quality assessment', date: 'Tomorrow at 3:00 PM', duration: '30 min' }
  ]);

  const [completedCalls, setCompletedCalls] = useState([
    { id: 1, farmer: 'Layla Hassan', topic: 'Pest management strategies', date: 'Yesterday at 9:00 AM', duration: '40 min' },
    { id: 2, farmer: 'Youssef Ibrahim', topic: 'Crop rotation planning', date: 'Yesterday at 2:00 PM', duration: '35 min' }
  ]);

  const handleSaveProduct = (product) => {
    if (editingProduct) {
      setProducts(products.map(p => p.id === product.id ? product : p));
    } else {
      setProducts([...products, { ...product, id: Date.now() }]);
    }
    setShowProductModal(false);
    setEditingProduct(null);
  };

  const handleOpenChat = (farmerName) => {
    setCurrentChatFarmer(farmerName);
    if (!chatMessages[farmerName]) {
      setChatMessages(prev => ({
        ...prev,
        [farmerName]: [{ id: 1, text: `Hello! I'm having issues with my crop.`, sender: 'farmer', timestamp: '9:30 AM' }]
      }));
    }
    setShowChatModal(true);
  };

  return (
    <div className="app-container">
      <NavBar currentPage={currentPage} setCurrentPage={setCurrentPage} />
      <div className="app-content">
        {currentPage === 'home' && (
          <HomePage 
            consultations={consultations} 
            upcomingCalls={upcomingCalls} 
            orders={orders} 
            feedback={feedback} 
            setCurrentPage={setCurrentPage} 
          />
        )}
        {currentPage === 'consultations' && (
          <ConsultationsPage 
            consultations={consultations} 
            setConsultations={setConsultations} 
            handleOpenChat={handleOpenChat} 
            setUpcomingCalls={setUpcomingCalls}
          />
        )}
        {currentPage === 'marketplace' && (
          <MarketplacePage 
            orders={orders} 
            setOrders={setOrders} 
            products={products} 
            setProducts={setProducts} 
            setShowProductModal={setShowProductModal} 
            setEditingProduct={setEditingProduct} 
            showOrderModal={showOrderModal} 
            setShowOrderModal={setShowOrderModal} 
            selectedOrder={selectedOrder} 
            setSelectedOrder={setSelectedOrder} 
          />
        )}
        {currentPage === 'videocall' && (
          <VideoCallPage 
            upcomingCalls={upcomingCalls} 
            setUpcomingCalls={setUpcomingCalls} 
            completedCalls={completedCalls} 
            setShowDownloadModal={setShowDownloadModal} 
            showDownloadModal={showDownloadModal} 
            setShowRescheduleModal={setShowRescheduleModal} 
            selectedCallId={selectedCallId} 
            setSelectedCallId={setSelectedCallId} 
            newDate={newDate} 
            setNewDate={setNewDate} 
            newTime={newTime} 
            setNewTime={setNewTime} 
            showRescheduleModal={showRescheduleModal} 
          />
        )}
        {currentPage === 'feedback' && <FeedbackPage feedback={feedback} />}
      </div>

      {showProductModal && (
        <ProductModal 
          product={editingProduct} 
          onSave={handleSaveProduct} 
          onClose={() => { 
            setShowProductModal(false); 
            setEditingProduct(null); 
          }} 
        />
      )}
      {showChatModal && (
        <ChatModal 
          showChatModal={showChatModal} 
          setShowChatModal={setShowChatModal} 
          currentChatFarmer={currentChatFarmer} 
          setCurrentChatFarmer={setCurrentChatFarmer} 
          chatMessages={chatMessages} 
          setChatMessages={setChatMessages} 
        />
      )}
    </div>*/
  );
};

export default App;