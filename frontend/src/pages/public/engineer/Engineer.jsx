import React from 'react';

import Layout from '../../../components/common/Layout';

import FarmerImage from '../../../assets/farmer.jpg';

import './engineer.css';

function Engineer() {
    return (
        <Layout>
            
            {/* =============== HERO =============== */}
            <section className="hero__engineer section">
                <div className="hero__engineer__container grid">
                    <div className="hero__engineer-content">
                        <h1 className="hero__engineer-title">
                            Empowering Agricultural Engineers 
                        </h1>

                        <p className="hero__engineer-description">
                            Connect with farmers and agribusinesses to deliver data-driven, scalable solutions — and grow your impact.
                            <br />
                            Partner with us to provide personalized consultations, smart inventory strategies, 
                            and actionable insights that maximize farm productivity — while building your professional network and reputation.
                        </p>

                        <div className="hero__engineer-buttons">
                            <button type="button" className='hero__engineer-singup-btn'>
                                Sing Up
                            </button>

                            <button type="button" className='hero__engineer-singin-btn'>
                                Log In
                            </button>
                        </div>
                    </div>

                    <div className="hero__engineer-image-wrapper">
                        <img 
                            src={FarmerImage}
                            alt="Farmer Image" 
                            className='hero__engineer-img'
                        />
                    </div>
                </div>
            </section>


        </Layout>
    );
};

export default Engineer;