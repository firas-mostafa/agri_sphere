import React from 'react';
import {MessageSquare,Video,AlertTriangle,ShoppingCart,Star,Package,} from 'lucide-react';
import './home.css';
const DashboardOverview = ({
  consultationsPending,
  scheduledCalls,
  activeWarnings,
  pestIncidents,
  newOrders,
  avgRating,
  itemsSold,
  farmerReviews,
  earnings,
  monthlySessions,
}) => (
  <>
    <div className="overview">
      <div className="overview-item">
        <div className="overview-content">
          <div className="overview-text">
            <h3 className="overview-label">Pending Consultations</h3>
            <p className="overview-value">{consultationsPending}</p>
            <p className="overview-note positive">+3 today</p>
          </div>
          <MessageSquare className="overview-icon icon--primary" size={24} />
        </div>
      </div>

      <div className="overview-item">
        <div className="overview-content">
          <div className="overview-text">
            <h3 className="overview-label">Video Calls Scheduled</h3>
            <p className="overview-value">{scheduledCalls}</p>
            <p className="overview-note upcoming">2 upcoming</p>
          </div>
          <Video className="overview-icon icon--call" size={24} />
        </div>
      </div>

      <div className="overview-item">
        <div className="overview-content">
          <div className="overview-text">
            <h3 className="overview-label">Active Alerts</h3>
            <p className="overview-value">{activeWarnings}</p>
            <p className="overview-note critical">{pestIncidents} pest reports</p>
          </div>
          <AlertTriangle className="overview-icon icon--warning" size={24} />
        </div>
      </div>
    </div>

    <div className="overview">
      <div className="overview-item">
        <div className="overview-content">
          <div className="overview-text">
            <h3 className="overview-label">New Orders</h3>
            <p className="overview-value">{newOrders}</p>
            <p className="overview-note positive">+5 new</p>
          </div>
          <ShoppingCart className="overview-icon icon--order" size={24} />
        </div>
      </div>

      <div className="overview-item">
        <div className="overview-content">
          <div className="overview-text">
            <h3 className="overview-label">Average Rating</h3>
            <p className="overview-value">{avgRating}</p>
            <p className="overview-note muted">From {farmerReviews.length} reviews</p>
          </div>
          <Star className="overview-icon icon--rating" size={24} />
        </div>
      </div>

      <div className="overview-item">
        <div className="overview-content">
          <div className="overview-text">
            <h3 className="overview-label">Products Sold</h3>
            <p className="overview-value">{itemsSold}</p>
            <p className="overview-note muted">This month</p>
          </div>
          <Package className="overview-icon icon--neutral" size={24} />
        </div>
      </div>
    </div>
  </>
);

const ActivityFeed = ({ latestUpdates }) => (
  <div className="activity-feed">
    <div className="feed-header">
      <h3 className="feed-title">Recent Activity</h3>
      <button className="view-all-link">View All</button>
    </div>
    <div>
      {latestUpdates.map((entry) => (
        <div key={entry.id} className="feed-entry">
          <div>
            {entry.kind === 'consultation' && (
              <MessageSquare className="entry-icon icon--primary" size={20} />
            )}
            {entry.kind === 'alert' && (
              <AlertTriangle className="entry-icon icon--warning" size={20} />
            )}
            {entry.kind === 'order' && (
              <ShoppingCart className="entry-icon icon--order" size={20} />
            )}
            {entry.kind === 'review' && (
              <Star className="entry-icon icon--rating" size={20} />
            )}
          </div>
          <div className="entry-details">
            <p className="farmer-name">Farmer {entry.farmer}</p>
            <p className="action-desc">{entry.description}</p>
            <p className="timestamp">{entry.when}</p>
          </div>
        </div>
      ))}
    </div>
  </div>
);
const ToolsPanel = ({
  switchView,
  sessionsThisMonth,
  unitsSold,
  totalEarnings,
}) => (
  <div className="tools-panel">
    <h3 className="panel-title">Quick Actions</h3>
    <div>
      <button onClick={() => switchView('videocall')} className="tool-button">
        <Video className="tool-icon icon--call" size={20} />
        <span>Start Video Call</span>
      </button>
      <button onClick={() => switchView('alerts')} className="tool-button">
        <AlertTriangle className="tool-icon icon--warning" size={20} />
        <span>View Alerts</span>
      </button>
      <button onClick={() => switchView('store')} className="tool-button">
        <ShoppingCart className="tool-icon icon--order" size={20} />
        <span>Manage Store</span>
      </button>
      <button onClick={() => switchView('reviews')} className="tool-button">
        <Star className="tool-icon icon--rating" size={20} />
        <span>Check Feedback</span>
      </button>
    </div>
    <div className="monthly-wrapup">
      <h4>This Month</h4>
      <div className="wrapup-row">
        <span className="wrapup-label">Consultations</span>
        <span className="wrapup-value">{sessionsThisMonth}</span>
      </div>
      <div className="wrapup-row">
        <span className="wrapup-label">Products Sold</span>
        <span className="wrapup-value">{unitsSold}</span>
      </div>
      <div className="wrapup-row">
        <span className="wrapup-label">Revenue</span>
        <span className="wrapup-value">${totalEarnings.toLocaleString()}</span>
      </div>
    </div>
  </div>
);

const HomePage = ({
  consultations,
  upcomingCalls,
  alerts,
  orders,
  feedback,
  setCurrentPage,
}) => {
  const consultationsPending = consultations.filter(consultation => consultation.status === 'pending').length;
  const scheduledCalls = upcomingCalls.length;
  const activeWarnings = alerts.length;
  const pestIncidents = alerts.filter(alert => alert.type === 'pest').length;
  const newOrders = orders.filter(order => order.status === 'pending').length;
  const avgRating = feedback.length > 0
    ? (feedback.reduce((sum, f) => sum + f.rating, 0) / feedback.length).toFixed(1)
    : '0.0';
  const itemsSold = orders
    .filter(order => order.status === 'delivered')
    .reduce((sum, order) => sum + order.quantity, 0);
  const totalEarnings = orders
    .filter(order => order.status === 'delivered')
    .reduce((sum, order) => sum + order.totalPrice, 0);
  const sessionsThisMonth = consultations.length;

  const latestUpdates = [
    { id: 1, farmer: 'Ahmed Hassan', description: 'Requested video consultation', when: '5 min ago', kind: 'consultation' },
    { id: 2, farmer: 'Fatima', description: 'Reported tomato blight disease', when: '12 min ago', kind: 'alert' },
    { id: 3, farmer: 'Khalid', description: 'Purchased organic fertilizer (25kg)', when: '25 min ago', kind: 'order' },
    { id: 4, farmer: 'Sara', description: 'Gave you 5 stars for consultation', when: '1 hour ago', kind: 'review' },
    { id: 5, farmer: 'Omar', description: 'Requested pest control advice', when: '2 hours ago', kind: 'consultation' }
  ];
  return (
    <div className="dashboard">
      <DashboardOverview
        consultationsPending={consultationsPending}
        scheduledCalls={scheduledCalls}
        activeWarnings={activeWarnings}
        pestIncidents={pestIncidents}
        newOrders={newOrders}
        avgRating={avgRating}
        itemsSold={itemsSold}
        farmerReviews={feedback}
        earnings={totalEarnings}
        monthlySessions={sessionsThisMonth}
      />
      <div className="main-section">
        <ActivityFeed latestUpdates={latestUpdates} />
        <ToolsPanel
          switchView={setCurrentPage}
          sessionsThisMonth={sessionsThisMonth}
          unitsSold={itemsSold}
          totalEarnings={totalEarnings}
        />
      </div>
    </div>
  );
};
export default HomePage;