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
          //dealer
import  HomePage from './pages/Dealer/home/HomePage';
import FeedbackPage from './pages/FeedbackPage';
import EquipmentAndOrdersPage from './pages/dealer/equipments and orders management/Equipment_and_order_management';
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
  /*
  const [currentPage, setCurrentPage] = useState('home');

  const [equipment, setEquipment] = useState([
    { id: 1, name: "Tractor #1", type: "Tractor", dailyRate: 150, status: "ready", operatingHours: 124, lastMaintenance: "Jan 10, 2026" },
    { id: 2, name: "Harvester #1", type: "Harvester", dailyRate: 350, status: "under maintenance", operatingHours: 98, lastMaintenance: "Dec 15, 2025" },
    { id: 3, name: "Tractor #2", type: "Tractor", dailyRate: 140, status: "reserved", operatingHours: 156, lastMaintenance: "Jan 5, 2026" },
    { id: 4, name: "Planter #1", type: "Planter", dailyRate: 120, status: "ready", operatingHours: 87, lastMaintenance: "Jan 12, 2026" },
    { id: 5, name: "Sprayer #1", type: "Sprayer", dailyRate: 80, status: "ready", operatingHours: 45, lastMaintenance: "Jan 15, 2026" },
    { id: 6, name: "Harvester #2", type: "Harvester", dailyRate: 320, status: "under maintenance", operatingHours: 210, lastMaintenance: "Dec 20, 2025" },
    { id: 7, name: "Tractor #3", type: "Tractor", dailyRate: 160, status: "ready", operatingHours: 178, lastMaintenance: "Jan 8, 2026" },
    { id: 8, name: "Sprayer #2", type: "Sprayer", dailyRate: 85, status: "reserved", operatingHours: 92, lastMaintenance: "Jan 3, 2026" },
    { id: 9, name: "Planter #2", type: "Planter", dailyRate: 130, status: "ready", operatingHours: 67, lastMaintenance: "Jan 14, 2026" },
    { id: 10, name: "Tractor #4", type: "Tractor", dailyRate: 145, status: "under maintenance", operatingHours: 201, lastMaintenance: "Dec 28, 2025" },
    { id: 11, name: "Harvester #3", type: "Harvester", dailyRate: 380, status: "ready", operatingHours: 134, lastMaintenance: "Jan 7, 2026" },
    { id: 12, name: "Sprayer #3", type: "Sprayer", dailyRate: 75, status: "ready", operatingHours: 56, lastMaintenance: "Jan 16, 2026" },
    { id: 13, name: "Tractor #5", type: "Tractor", dailyRate: 155, status: "reserved", operatingHours: 189, lastMaintenance: "Jan 2, 2026" },
    { id: 14, name: "Planter #3", type: "Planter", dailyRate: 125, status: "ready", operatingHours: 73, lastMaintenance: "Jan 11, 2026" },
    { id: 15, name: "Tractor #6", type: "Tractor", dailyRate: 150, status: "ready", operatingHours: 145, lastMaintenance: "Dec 30, 2025" }
  ]);

  const [orders, setOrders] = useState([
    {
      id: 1,
      equipmentName: "Tractor #2",
      equipmentId: 3,
      farmerName: "Mohammed Hassan",
      startDate: "Jan 17, 2026",
      endDate: "Jan 20, 2026",
      totalAmount: 420,
      status: "active"
    },
    {
      id: 2,
      equipmentName: "Sprayer #2",
      equipmentId: 8,
      farmerName: "Ahmed Ali",
      startDate: "Jan 15, 2026",
      endDate: "Jan 18, 2026",
      totalAmount: 255,
      status: "completed"
    },
    {
      id: 3,
      equipmentName: "Harvester #3",
      equipmentId: 11,
      farmerName: "Khalid Omar",
      startDate: "Jan 19, 2026",
      endDate: "Jan 25, 2026",
      totalAmount: 2280,
      status: "approved"
    },
    {
      id: 4,
      equipmentName: "Tractor #5",
      equipmentId: 13,
      farmerName: "Omar Farooq",
      startDate: "Jan 20, 2026",
      endDate: "Jan 22, 2026",
      totalAmount: 310,
      status: "pending"
    },
    {
      id: 5,
      equipmentName: "Planter #2",
      equipmentId: 9,
      farmerName: "Fatima Zahra",
      startDate: "Jan 16, 2026",
      endDate: "Jan 19, 2026",
      totalAmount: 390,
      status: "approved"
    },
    {
      id: 6,
      equipmentName: "Planter #1",
      equipmentId: 4,
      farmerName: "Sara Ahmed",
      startDate: "Jan 18, 2026",
      endDate: "Jan 21, 2026",
      totalAmount: 480,
      status: "pending"
    }
  ]);

  const [feedbackData] = useState([
    { farmer: 'Farmer Ahmed Ali', equipment: 'Tractor #1', time: '2 hours ago', rating: 4 },
    { farmer: 'Farmer Mohammed Hassan', equipment: 'Harvester #2', time: '1 day ago', rating: 5 },
    { farmer: 'Farmer Nora Abdullah', equipment: 'Tractor #14', time: '4 days ago', rating: 5 },
    { farmer: 'Farmer Khalid Omar', equipment: 'Sprayer #3', time: '1 week ago', rating: 3 },
    { farmer: 'Farmer Sara Ahmed', equipment: 'Planter #1', time: '2 weeks ago', rating: 4 }
  ]);

  const totalEquipment = equipment.length;
  const readyEquipment = equipment.filter(eq => eq.status === 'ready').length;
  const reservedEquipment = equipment.filter(eq => eq.status === 'reserved').length;
  const maintenanceEquipment = equipment.filter(eq => eq.status === 'under maintenance').length;
  const activeAlerts = maintenanceEquipment + 2;
  const pendingMaintenance = maintenanceEquipment;

  const calculateAverageRating = () => {
    if (feedbackData.length === 0) return 0;
    const total = feedbackData.reduce((sum, f) => sum + f.rating, 0);
    return parseFloat((total / feedbackData.length).toFixed(1));
  };
  const avgRating = calculateAverageRating();

  const dashboardStats = [
    { 
      title: 'Total Equipment', 
      value: totalEquipment.toString(), 
      subtitle: `${readyEquipment} ready, ${reservedEquipment} reserved, ${maintenanceEquipment} maintenance`, 
      icon: <Wrench className="icon-size icon-gray-600" /> 
    },
    { 
      title: 'Active Alerts', 
      value: activeAlerts.toString(), 
      subtitle: `${maintenanceEquipment} maintenance, 2 safety`, 
      icon: <AlertTriangle className="icon-size icon-yellow-500" /> 
    },
    { 
      title: 'Pending Maintenance', 
      value: pendingMaintenance.toString(), 
      subtitle: 'Requires attention', 
      icon: <Wrench className="icon-size icon-orange-500" /> 
    },
    { 
      title: 'Avg. Rating', 
      value: avgRating.toString(), 
      subtitle: `Based on ${feedbackData.length} reviews`, 
      icon: <Star className="icon-size icon-yellow-500" /> 
    }
  ];

  const recentActivity = [
    { type: 'star', text: 'Farmer Ahmed gave you 4 stars for fast delivery', time: '2 hours ago' },
    { type: 'wrench', text: 'Tractor #3 maintenance completed - now ready', time: '5 hours ago' },
    { type: 'alert', text: 'Harvester #1 needs oil change (98 hours)', time: '1 day ago' },
    { type: 'trend', text: 'Tractor #5 reserved by Farmer Hassan', time: '1 day ago' }
  ];

  const thisWeekStats = { newRentals: 8, completed: 6, revenue: '$4,200' };
  const equipmentUtilization = [
    { status: 'Ready', count: readyEquipment },
    { status: 'Reserved', count: reservedEquipment },
    { status: 'Maintenance', count: maintenanceEquipment }
  ];

  const feedbackStats = {
    averageRating: avgRating,
    oneStarReviews: feedbackData.filter(f => f.rating === 1).length,
    fiveStarReviews: feedbackData.filter(f => f.rating === 5).length,
    thisMonthChange: '+4'
  };

  const ratingDistribution = [1,2,3,4,5].map(stars => {
    const count = feedbackData.filter(f => f.rating === stars).length;
    const percentage = feedbackData.length ? Math.round((count / feedbackData.length) * 100) : 0;
    return { stars, percentage, filled: stars };
  });

  // ===== MODAL STATE =====
  const [editDialogOpen, setEditDialogOpen] = useState(false);
  const [addDialogOpen, setAddDialogOpen] = useState(false);
  const [editingEquipment, setEditingEquipment] = useState(null);
  const [newEquipment, setNewEquipment] = useState({
    name: "",
    type: "Tractor",
    dailyRate: 0,
    status: "ready",
    operatingHours: 0,
    lastMaintenance: new Date().toLocaleDateString('en-US', { month: 'short', day: 'numeric', year: 'numeric' })
  });

  // ===== HANDLERS =====
  const handleStatusUpdate = (id, newStatus) => {
    setEquipment(prev => prev.map(item => item.id === id ? { ...item, status: newStatus } : item));
  };

  const handleEditClick = (item) => {
    setEditingEquipment({ ...item });
    setEditDialogOpen(true);
  };

  const handleEditSave = () => {
    if (editingEquipment) {
      setEquipment(prev => prev.map(item => item.id === editingEquipment.id ? editingEquipment : item));
      setEditDialogOpen(false);
      setEditingEquipment(null);
    }
  };

  const handleAddEquipment = () => {
    if (!newEquipment.name || newEquipment.dailyRate <= 0) return;
    const newId = Math.max(...equipment.map(e => e.id), 0) + 1;
    setEquipment(prev => [...prev, { ...newEquipment, id: newId }]);
    setAddDialogOpen(false);
    setNewEquipment({
      name: "",
      type: "Tractor",
      dailyRate: 0,
      status: "ready",
      operatingHours: 0,
      lastMaintenance: new Date().toLocaleDateString('en-US', { month: 'short', day: 'numeric', year: 'numeric' })
    });
  };
  const handleApproveOrder = (orderId) => {
    const order = orders.find(o => o.id === orderId);
    if (!order) return;
    setOrders(prev => prev.map(o => o.id === orderId ? { ...o, status: "approved" } : o));
    setEquipment(prev => prev.map(e => e.id === order.equipmentId ? { ...e, status: "reserved" } : e));
  };
  const handleRejectOrder = (orderId) => {
    setOrders(prev => prev.map(o => o.id === orderId ? { ...o, status: "rejected" } : o));
  };
  const getStatusColor = (status) => {
    switch (status) {
      case "ready": return "status-badge status-ready";
      case "under maintenance": return "status-badge status-under-maintenance";
      case "reserved": return "status-badge status-reserved";
      default: return "status-badge";
    }
  };
  const getOrderStatusColor = (status) => {
    switch (status) {
      case "active": return "status-badge status-active";
      case "completed": return "status-badge status-completed";
      case "approved": return "status-badge status-approved";
      case "pending": return "status-badge status-pending";
      default: return "status-badge";
    }
  };

  return (
    <div className="app-container">
      <NavBar currentPage={currentPage} setCurrentPage={setCurrentPage} />
      <main className="app-main">
        {currentPage === 'home' && (
          <HomePage
            dashboardStats={dashboardStats}
            recentActivity={recentActivity}
            thisWeekStats={thisWeekStats}
            equipmentUtilization={equipmentUtilization}
          />
        )}
        {currentPage === 'feedback' && (
          <FeedbackPage
            feedbackStats={feedbackStats}
            ratingDistribution={ratingDistribution}
            equipmentFeedback={feedbackData}
          />
        )}
        {currentPage === 'orders' && (
          <EquipmentAndOrdersPage
            equipment={equipment}
            orders={orders}
            handleStatusUpdate={handleStatusUpdate}
            handleApproveOrder={handleApproveOrder}
            handleRejectOrder={handleRejectOrder}
            getStatusColor={getStatusColor}
            getOrderStatusColor={getOrderStatusColor}
            handleEditClick={handleEditClick}
            setAddDialogOpen={setAddDialogOpen}
            editDialogOpen={editDialogOpen}
            addDialogOpen={addDialogOpen}
            editingEquipment={editingEquipment}
            newEquipment={newEquipment}
            setEditingEquipment={setEditingEquipment}
            setNewEquipment={setNewEquipment}
            handleEditSave={handleEditSave}
            handleAddEquipment={handleAddEquipment}
            setEditDialogOpen={setEditDialogOpen}
          />
        )}
      </main>
    </div>
  */
  );
};

export default App;