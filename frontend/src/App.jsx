import './App.css';

import React from 'react';
import { BrowserRouter, Route, Routes } from 'react-router';

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
  );
};

export default App;