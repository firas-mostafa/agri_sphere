import React from 'react';

import Layout from '../../../components/common/Layout';
import SectionTitle from '../../../components/title/SectionTitle';

import { farmer_about_data, farmer_weather_data } from '../../../Data';

import './farmer.css';

function Farmer() {
    return (
        <Layout>

            {/* =============== HERO =============== */}
            <section className="hero__farmer section">
                <div className="hero__farmer__container container grid">
                    <div className="hero__farmer__content">
                        <h6 className="hero__farmer-subtitle">
                            Empowering Farmers with Technology
                        </h6>
                        
                        <h1 className="hero__farmer-title">
                            Make Smarter <span>Farming</span> Decisions
                        </h1>

                        <p className="hero__farmer-description">
                            Get real-time weather insights, optimal planting schedules, expert consultations, and everything you need to maximize your harvest—all in one platform.
                        </p>

                        <div className="hero__farmer-buttons">
                            <button type="button" className="hero__farmer-singup-btn">
                                Sing Up
                            </button>

                            <button type="button" className="hero__farmer-singin-btn">
                                Log In
                            </button>
                        </div>
                    </div>

                    <div className="hero__farmer__content">
                        <div className="hero__farmer-card grid">
                            {
                                farmer_weather_data.map( ( { icon, title, data, description, img}, index) => {
                                    return (
                                        <div key={index} className="hero__farmer-card-content">
                                            <div className="hero__farmer-icon-wrapper">
                                                <img 
                                                    src={icon} 
                                                    alt={`Farmer-Card-Icon-${index + 1}`} 
                                                    className="hero__farmer-card-icon" 
                                                />
                                            </div>

                                            <div className="hero__farmer-card-data">
                                                <h6>
                                                    {title}
                                                </h6>

                                                <p>
                                                    {data}
                                                </p>
                                            </div>

                                            { img && <img src={img} alt={`Farmer-Card-Image-${index + 1}`} className="hero__farmer-card-img" /> }

                                            { description && <span className="hero__farmer-card-description">{description}</span> }
                                        </div>
                                    )
                                })
                            }
                        </div>
                    </div>
                </div>
            </section> 
            
            
            {/* =============== CONSULTATION INFO =============== */}
            <section className="about__farmer">
                <SectionTitle
                    title="Everything You Need to Succeed"
                    description={
                        'Comprehensive tools and services designed specifically for modern farmers.'
                    }
                />

                <div className="about__farmer-cards grid">
                    {
                        farmer_about_data.map( ( { icon, title, description }, index) => {
                            return (
                                <div key={index} className="about__farmer-card flex">
                                    <div className="about__farmer-icon-wrapper">
                                        <img 
                                            src={icon}
                                            alt={`About-Farmer-Card-Icon-${index + 1}`} 
                                            className='about__farmer-card-icon'
                                        />
                                    </div>

                                    <h6 className="about__farmer-card-title">
                                        {title}
                                    </h6>

                                    <p className="about__farmer-card-description">
                                        {description}
                                    </p>
                                </div>
                            )
                        })
                    }
                </div>
            </section>

        </Layout>
    );
};

export default Farmer;