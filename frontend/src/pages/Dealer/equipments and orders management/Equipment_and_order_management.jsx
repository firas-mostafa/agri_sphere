import React, { useState } from 'react';
import './Equipment_and_order.css';
import {
  Tractor, Calendar, DollarSign, Edit, Plus, Check, X,
  AlertTriangle, Wrench
} from "lucide-react";
import Footer from '../../../components/common/Footer/Footer'
const EquipmentAndOrdersPage = ({
  equipment,
  orders,
  handleStatusUpdate,
  handleApproveOrder,
  handleRejectOrder,
  getStatusColor,
  getOrderStatusColor,
  handleEditClick,
  setAddDialogOpen,
  editDialogOpen,
  addDialogOpen,
  editingEquipment,
  newEquipment,
  setEditingEquipment,
  setNewEquipment,
  handleEditSave,
  handleAddEquipment,
  setEditDialogOpen
}) => {
  const [activeTab, setActiveTab] = useState('orders');

  const getEquipmentStatusClass = (status) => {
    if (status === 'ready') return 'Equipment_Dealer_status_ready';
    if (status === 'under maintenance') return 'Equipment_Dealer_status_maintenance';
    if (status === 'reserved') return 'Equipment_Dealer_status_reserved';
    return '';
  };
  const getOrderStatusClass = (status) => {
    if (status === 'approved') return 'Equipment_Dealer_status_reserved';
    if (status === 'pending') return 'Equipment_Dealer_status_maintenance';
    if (status === 'completed') return 'Equipment_Dealer_status_ready';
    if (status === 'rejected') return 'Equipment_Dealer_status_maintenance';
    return '';
  };

  return (
    <div className="Equipment_Dealer_container">
      <main className="Equipment_Dealer_main">
        <div className="Equipment_Dealer_header">
          <h1>Equipment & Orders Management</h1>
          <p>Manage your equipment inventory and rental orders</p>
        </div>

        <div className="Equipment_Dealer_tabs">
          <button
            onClick={() => setActiveTab('equipment')}
            className={`Equipment_Dealer_tab ${activeTab === 'equipment' ? 'active' : 'inactive'}`}
          >
            Equipment
          </button>
          <button
            onClick={() => setActiveTab('orders')}
            className={`Equipment_Dealer_tab ${activeTab === 'orders' ? 'active' : 'inactive'}`}
          >
            Orders
          </button>
        </div>

        {activeTab === 'equipment' && (
          <div className="Equipment_Dealer_card">
            <div className="Equipment_Dealer_section_header">
              <Tractor className="Equipment_Dealer_icon Equipment_Dealer_icon_tractor" />
              <h2>Equipment Inventory</h2>
            </div>
            <p className="Equipment_Dealer_section_desc">View and manage all equipment available for rent</p>
            <div className="Equipment_Dealer_table_container">
              <table className="Equipment_Dealer_table">
                <thead>
                  <tr>
                    <th>Equipment</th>
                    <th>Type</th>
                    <th>Daily Rate</th>
                    <th>Operating Hours</th>
                    <th>Last Maintenance</th>
                    <th>Status</th>
                    <th>Action</th>
                  </tr>
                </thead>
                <tbody>
                  {equipment.map((item) => (
                    <tr key={item.id}>
                      <td className="Equipment_Dealer_font_medium">{item.name}</td>
                      <td>{item.type}</td>
                      <td>
                        <div className="Equipment_Dealer_daily_rate">
                          <DollarSign className="Equipment_Dealer_icon Equipment_Dealer_icon_dollar" />
                          <span>{item.dailyRate}</span>
                        </div>
                      </td>
                      <td>{item.operatingHours}h</td>
                      <td>{item.lastMaintenance}</td>
                      <td>
                        <span className={`Equipment_Dealer_status_badge ${getEquipmentStatusClass(item.status)}`}>
                          {item.status}
                        </span>
                      </td>
                      <td>
                        <div className="Equipment_Dealer_actions_wrapper">
                          <select
                            value={item.status}
                            onChange={(e) => handleStatusUpdate(item.id, e.target.value)}
                            className="Equipment_Dealer_action_select"
                          >
                            <option value="ready">Ready</option>
                            <option value="under maintenance">Under Maintenance</option>
                            <option value="reserved">Reserved</option>
                          </select>
                          <button
                            className="Equipment_Dealer_edit_button"
                            onClick={() => handleEditClick(item)}
                          >
                            <Edit className="Equipment_Dealer_icon Equipment_Dealer_icon_edit" />
                          </button>
                        </div>
                      </td>
                    </tr>
                  ))}
                </tbody>
              </table>
            </div>
            <div className="Equipment_Dealer_add_button_container">
              <button
                className="Equipment_Dealer_add_button"
                onClick={() => setAddDialogOpen(true)}
              >
                <Plus className="Equipment_Dealer_icon Equipment_Dealer_icon_plus" />
                <span>Add Equipment</span>
              </button>
            </div>
          </div>
        )}
        {activeTab === 'orders' && (
          <div className="Equipment_Dealer_card">
            <div className="Equipment_Dealer_section_header">
              <Calendar className="Equipment_Dealer_icon Equipment_Dealer_icon_calendar" />
              <h2>Rental Orders</h2>
            </div>
            <p className="Equipment_Dealer_section_desc">Track all rental orders and bookings</p>
            <div className="Equipment_Dealer_table_container">
              <table className="Equipment_Dealer_table">
                <thead>
                  <tr>
                    <th>Order ID</th>
                    <th>Equipment</th>
                    <th>Farmer</th>
                    <th>Start Date</th>
                    <th>End Date</th>
                    <th>Total Amount</th>
                    <th>Status</th>
                    <th>Action</th>
                  </tr>
                </thead>
                <tbody>
                  {orders.map((order) => (
                    <tr key={order.id}>
                      <td className="Equipment_Dealer_font_medium">#{order.id}</td>
                      <td>{order.equipmentName}</td>
                      <td>{order.farmerName}</td>
                      <td>{order.startDate}</td>
                      <td>{order.endDate}</td>
                      <td>
                        <div className="Equipment_Dealer_daily_rate">
                          <DollarSign className="Equipment_Dealer_icon Equipment_Dealer_icon_dollar" />
                          <span>{order.totalAmount}</span>
                        </div>
                      </td>
                      <td>
                        <span className={`Equipment_Dealer_status_badge ${getOrderStatusClass(order.status)}`}>
                          {order.status}
                        </span>
                      </td>
                      <td>
                        {order.status === "pending" ? (
                          <div className="Equipment_Dealer_order_actions">
                            <button
                              className="Equipment_Dealer_approve_button"
                              onClick={() => handleApproveOrder(order.id)}
                            >
                              <Check className="Equipment_Dealer_icon Equipment_Dealer_icon_check" />
                              <span>Approve</span>
                            </button>
                            <button
                              className="Equipment_Dealer_reject_button"
                              onClick={() => handleRejectOrder(order.id)}
                            >
                              <X className="Equipment_Dealer_icon Equipment_Dealer_icon_x" />
                              <span>Reject</span>
                            </button>
                          </div>
                        ) : (
                          <span className="Equipment_Dealer_order_status_text">
                            {order.status === "approved" && "Equipment Reserved"}
                            {order.status === "active" && "In Progress"}
                            {order.status === "completed" && "Completed"}
                            {order.status === "rejected" && "Request Rejected"}
                          </span>
                        )}
                      </td>
                    </tr>
                  ))}
                </tbody>
              </table>
            </div>
          </div>
        )}
        {editDialogOpen && (
          <div className="Equipment_Dealer_dialog_overlay">
            <div className="Equipment_Dealer_dialog_content">
              <div className="Equipment_Dealer_dialog_header">
                <h3 className="Equipment_Dealer_dialog_title">Edit Equipment</h3>
                <button 
                  onClick={() => setEditDialogOpen(false)} 
                  className="Equipment_Dealer_dialog_close"
                >
                  <X className="Equipment_Dealer_icon Equipment_Dealer_icon_close" />
                </button>
              </div>
              <p className="Equipment_Dealer_dialog_desc">Update the details of the equipment</p>
              <div className="Equipment_Dealer_form_group">
                <label className="Equipment_Dealer_form_label">Name</label>
                <input
                  type="text"
                  value={editingEquipment?.name || ""}
                  onChange={(e) => setEditingEquipment(prev => prev ? { ...prev, name: e.target.value } : null)}
                  className="Equipment_Dealer_form_input"
                />
              </div>
              <div className="Equipment_Dealer_form_group">
                <label className="Equipment_Dealer_form_label">Type</label>
                <select
                  value={editingEquipment?.type || "Tractor"}
                  onChange={(e) => setEditingEquipment(prev => prev ? { ...prev, type: e.target.value } : null)}
                  className="Equipment_Dealer_form_select"
                >
                  <option value="Tractor">Tractor</option>
                  <option value="Harvester">Harvester</option>
                  <option value="Planter">Planter</option>
                  <option value="Sprayer">Sprayer</option>
                </select>
              </div>
              <div className="Equipment_Dealer_form_group">
                <label className="Equipment_Dealer_form_label">Daily Rate</label>
                <input
                  type="number"
                  value={editingEquipment?.dailyRate || 0}
                  onChange={(e) => setEditingEquipment(prev => prev ? { ...prev, dailyRate: parseFloat(e.target.value) } : null)}
                  className="Equipment_Dealer_form_input"
                />
              </div>
              <div className="Equipment_Dealer_form_group">
                <label className="Equipment_Dealer_form_label">Operating Hours</label>
                <input
                  type="number"
                  value={editingEquipment?.operatingHours || 0}
                  onChange={(e) => setEditingEquipment(prev => prev ? { ...prev, operatingHours: parseFloat(e.target.value) } : null)}
                  className="Equipment_Dealer_form_input"
                />
              </div>
              <div className="Equipment_Dealer_form_group">
                <label className="Equipment_Dealer_form_label">Last Maintenance</label>
                <input
                  type="text"
                  value={editingEquipment?.lastMaintenance || ""}
                  onChange={(e) => setEditingEquipment(prev => prev ? { ...prev, lastMaintenance: e.target.value } : null)}
                  className="Equipment_Dealer_form_input"
                />
              </div>
              <div className="Equipment_Dealer_dialog_footer">
                <button
                  onClick={() => setEditDialogOpen(false)}
                  className="Equipment_Dealer_cancel_button"
                >
                  Cancel
                </button>
                <button
                  onClick={handleEditSave}
                  className="Equipment_Dealer_save_button"
                >
                  Save
                </button>
              </div>
            </div>
          </div>
        )}

        {/* Add Equipment Dialog */}
        {addDialogOpen && (
          <div className="Equipment_Dealer_dialog_overlay">
            <div className="Equipment_Dealer_dialog_content">
              <div className="Equipment_Dealer_dialog_header">
                <h3 className="Equipment_Dealer_dialog_title">Add Equipment</h3>
                <button 
                  onClick={() => setAddDialogOpen(false)} 
                  className="Equipment_Dealer_dialog_close"
                >
                  <X className="Equipment_Dealer_icon Equipment_Dealer_icon_close" />
                </button>
              </div>
              <p className="Equipment_Dealer_dialog_desc">Add a new equipment to the inventory</p>
              <div className="Equipment_Dealer_form_group">
                <label className="Equipment_Dealer_form_label">Name</label>
                <input
                  type="text"
                  value={newEquipment.name}
                  onChange={(e) => setNewEquipment(prev => ({ ...prev, name: e.target.value }))}
                  className="Equipment_Dealer_form_input"
                />
              </div>
              <div className="Equipment_Dealer_form_group">
                <label className="Equipment_Dealer_form_label">Type</label>
                <select
                  value={newEquipment.type}
                  onChange={(e) => setNewEquipment(prev => ({ ...prev, type: e.target.value }))}
                  className="Equipment_Dealer_form_select"
                >
                  <option value="Tractor">Tractor</option>
                  <option value="Harvester">Harvester</option>
                  <option value="Planter">Planter</option>
                  <option value="Sprayer">Sprayer</option>
                </select>
              </div>
              <div className="Equipment_Dealer_form_group">
                <label className="Equipment_Dealer_form_label">Daily Rate</label>
                <input
                  type="number"
                  value={newEquipment.dailyRate}
                  onChange={(e) => setNewEquipment(prev => ({ ...prev, dailyRate: parseFloat(e.target.value) }))}
                  className="Equipment_Dealer_form_input"
                />
              </div>
              <div className="Equipment_Dealer_form_group">
                <label className="Equipment_Dealer_form_label">Operating Hours</label>
                <input
                  type="number"
                  value={newEquipment.operatingHours}
                  onChange={(e) => setNewEquipment(prev => ({ ...prev, operatingHours: parseFloat(e.target.value) }))}
                  className="Equipment_Dealer_form_input"
                />
              </div>
              <div className="Equipment_Dealer_form_group">
                <label className="Equipment_Dealer_form_label">Last Maintenance</label>
                <input
                  type="text"
                  value={newEquipment.lastMaintenance}
                  onChange={(e) => setNewEquipment(prev => ({ ...prev, lastMaintenance: e.target.value }))}
                  className="Equipment_Dealer_form_input"
                />
              </div>
              <div className="Equipment_Dealer_dialog_footer">
                <button
                  onClick={() => setAddDialogOpen(false)}
                  className="Equipment_Dealer_cancel_button"
                >
                  Cancel
                </button>
                <button
                  onClick={handleAddEquipment}
                  className="Equipment_Dealer_add_button_dialog"
                >
                  Add
                </button>
              </div>
            </div>
          </div>
        )}
      </main>
      <Footer/>
    </div>
  );
};

export default EquipmentAndOrdersPage;