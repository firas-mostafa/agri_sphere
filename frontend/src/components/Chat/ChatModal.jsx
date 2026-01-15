import React from 'react';
import { X, User, Send } from 'lucide-react';
import './chat.css';

const ChatModal = ({ 
  showChatModal, 
  setShowChatModal, 
  currentChatFarmer, 
  setCurrentChatFarmer, 
  chatMessages, 
  setChatMessages 
}) => {
  if (!showChatModal || !currentChatFarmer) return null;

  const messages = chatMessages[currentChatFarmer] || [];

  const initializeChatMessages = (farmerName) => {
    if (!chatMessages[farmerName]) {
      setChatMessages(prev => ({
        ...prev,
        [farmerName]: [
          { id: 1, text: `Hello! I'm having issues with my crop.`, sender: 'farmer', timestamp: '9:30 AM' },
          { id: 2, text: `Good morning! Can you send photos?`, sender: 'expert', timestamp: '9:32 AM', status: 'read' }
        ]
      }));
    }
  };

  const sendMessage = (message) => {
    if (!message.trim()) return;
    const newMessage = {
      id: Date.now(),
      text: message,
      sender: 'expert',
      timestamp: new Date().toLocaleTimeString([], { hour: '2-digit', minute: '2-digit' }),
      status: 'sent'
    };
    setChatMessages(prev => ({
      ...prev,
      [currentChatFarmer]: [...prev[currentChatFarmer], newMessage]
    }));
  };

  return (
    <div className="chat-overlay">
      <div className="chat-container">
        {/* Sidebar */}
        <div className="chat-sidebar">
          <div className="sidebar-header">
            <h3 className="sidebar-title">Chats</h3>
          </div>
          <div className="chat-list">
            {['Fatima', ' Amira', 'Omar', 'Mosa'].map((farmer, i) => (
              <div
                key={i}
                className={`chat-list-item ${currentChatFarmer === farmer ? 'active' : ''}`}
                onClick={() => {
                  setCurrentChatFarmer(farmer);
                  initializeChatMessages(farmer);
                }}
              >
                <div className="avatar">
                  <User size={16} className="user-icon" />
                </div>
                <div className="chat-info">
                  <h4 className="farmer-name-chat">{farmer}</h4>
                </div>
              </div>
            ))}
          </div>
        </div>

        {/* Main Chat Area */}
        <div className="chat-main">
          <div className="chat-header">
            <div className="chat-header-content">
              <div className="avatar">
                <User size={16} className="user-icon" />
              </div>
              <h3 className="chat-title">{currentChatFarmer}</h3>
            </div>
            <button 
              onClick={() => setShowChatModal(false)} 
              className="close-btn"
              aria-label="Close chat"
            >
              <X size={20} />
            </button>
          </div>

          <div className="messages-container">
            {messages.map(msg => (
              <div
                key={msg.id}
                className={`message-bubble ${msg.sender === 'farmer' ? 'farmer-message' : 'expert-message'}`}
              >
                <div className="message-text">{msg.text}</div>
                <div className="message-meta">
                  {msg.timestamp}
                  {msg.sender === 'expert' && (
                    <span className="message-status">
                      {msg.status === 'read' ? '✓✓' : '✓'}
                    </span>
                  )}
                </div>
              </div>
            ))}
          </div>

          <div className="input-area">
            <div className="input-wrapper">
              <input
                type="text"
                placeholder="Type a message"
                className="message-input"
                onKeyDown={(e) => {
                  if (e.key === 'Enter') {
                    sendMessage(e.target.value);
                    e.target.value = '';
                  }
                }}
              />
              <button
                onClick={() => {
                  const input = document.querySelector('.message-input');
                  if (input?.value.trim()) {
                    sendMessage(input.value);
                    input.value = '';
                  }
                }}
                className="send-button"
                aria-label="Send message"
              >
                <Send size={20} />
              </button>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
};

export default ChatModal;