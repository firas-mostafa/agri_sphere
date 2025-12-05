import './App.css';

import React from 'react';
import { BrowserRouter, Route, Routes } from 'react-router';

import Home from './pages/home/Home';
import FQA from './pages/fqa/FQA';
import Farmer from './pages/farmer/Farmer';
import Engineer from './pages/engineer/Engineer';
import Equipment from './pages/equipment/Equipment';
import Contact from './pages/contact/Contact';


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