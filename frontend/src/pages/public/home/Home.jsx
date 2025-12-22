import React from 'react';

import { Link } from 'react-router';

import Layout from '../../../components/common/Layout';
import SectionSubTitle from '../../../components/subtitle/SectionSubTitle';

import Wheat from '../../../assets/wheat.svg';
import WeatherCard from '../../../assets/Weather_card.png'
import MemberShips from '../../../assets/memberships.png';
import ScrollDown from '../../../assets/scroll_down.svg';
import LinkIcon from '../../../assets/link.svg';

import './home.css';

function Home() {
    return (
        <Layout>
            {/* =============== HOME =============== */}
            <section className="home section">
                <div className="home__container container grid">
                    <div className="home__content">
                        <h1 className="home__title">
                            Part  Of Future Agriculture
                            <img 
                                src={Wheat} 
                                alt='What Icon' 
                                className="home__title-img" 
                            />
                        </h1>

                        <div className="home__weather-widget">
                            <img 
                                src={WeatherCard} 
                                alt="Weather Widget" 
                                className="home__weather-widget-img" 
                            />
                        </div>

                        <div className="home__memberships">
                            <img 
                                src={MemberShips} 
                                alt="Memberships Widget" 
                                className="home__memberships-img" 
                            />
                        </div>
                    </div>

                    <div className="home__content">
                        <p className="home__welcome">
                            Welcome to AgriSphere
                        </p>

                        <h2 className="home__subtitle">Bring Growth Fresh Agricultur</h2>

                        <p className="home__description">
                            Experience the ultimate golfing journey with expert tips,
                            premium gear, and professional insights.
                        </p>

                        <div className="home__links">
                            <Link to='#' className="home__link join-now-link">
                                <p className="home__link-join-txt">
                                    Join Now
                                </p>

                                <img src={LinkIcon} alt="Link Icon" className='home__link-img'/>
                            </Link>

                            <Link to='#' className="home__link learn-more-link">
                                <p className='home__link-learn-txt'>Learn More</p>
                            </Link>
                        </div>
                    </div>
                </div>

                <div className="home__scroll">
                    <img 
                        src={ScrollDown} 
                        alt="Scroll Down Icon" 
                        className='home__scroll-img'
                    />
                    <p className='home__scroll-txt'>Grow With Us</p>
                </div>
            </section>

            
            {/* =============== ABOUT =============== */}
            <section className='about'>
                <div className="about__content">
                    <SectionSubTitle subtitle='about agriShpere' />

                    <p className="about__description">
                        AgriSphere is revolutionizing agriculture by connecting farmers, agricultural engineers, and equipment dealers through intelligent technology.
                        Our platform provides real-time insights, expert consultations, and smart resource management to help you achieve optimal crop yields and sustainable farming practices.
                    </p>

                    <p className="about__info">
                        Founded by agricultural experts and technology innovators, we understand the unique challenges of modern farming. 
                        Our mission is to empower every farmer with the tools and knowledge needed to thrive in an ever-changing agricultural landscape.
                    </p>
                </div>
            </section>

        </Layout>
    );
};

export default Home;