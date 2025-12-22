import React from 'react';

import Layout from '../../../components/common/Layout';

import './equipment.css';

function Equipment() {
    return (
        <Layout>

            {/* =============== HERO =============== */}
            <section className="hero__equipment section">
                <div className="hero__equipment__container container grid">
                    <h1 className="hero__equipment-title">
                        Empower Your Dealership. Connect with Farmers.
                    </h1>

                    <p className="hero__equipment-description">
                        Join our platform to increase equipment rentals, streamline maintenance, and grow your business.
                    </p>

                    <div className="hero__equipment-buttons">
                        <button type="button" className='hero__equipment-singin-btn'>
                            Log In
                        </button>

                        <button type="button" className='hero__equipment-singup-btn'>
                            Sing Up
                        </button>
                    </div>
                </div>
            </section>
            
        </Layout>
    );
};

export default Equipment;