import React from 'react';

import { Link } from 'react-router';

import Layout from '../../../components/common/Layout';
import SectionSubTitle from '../../../components/subtitle/SectionSubTitle';

import { benefits_data, howItWorks_home_data } from '../../../Data';

import Wheat from '../../../assets/wheat.svg';
import WeatherCard from '../../../assets/Weather_card.png'
import MemberShips from '../../../assets/memberships.png';
import ScrollDown from '../../../assets/scroll_down.svg';
import LinkIcon from '../../../assets/link.svg';
import Service1 from '../../../assets/service1.jpg';
import Service2 from '../../../assets/service2.png';
import Service3 from '../../../assets/service3.jpg';
import WheatImage from '../../../assets/wheat-image.png';
import Text from '../../../assets/text.png';
import Location from '../../../assets/location.png';

import './home.css';
import SectionTitle from '../../../components/title/SectionTitle';

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

            
            {/* =============== SERVICES =============== */}
            <section className="services">
                <SectionSubTitle subtitle='services of agriSphere' />

                <div className="services__container container grid">
                    <div className="services__content">
                        <div className="services__title">
                            <img 
                                src={WheatImage} 
                                alt="Services Tilte Icon" 
                                className='services__title-crop-img'
                            />

                            <p className="services__title-txt">
                                Smart alerts & Check the condition of the plant
                            </p>
                        </div>

                        <h4 className="services__subtitle">
                            +10000 Farmer
                        </h4>

                        <div className="services__description">
                            <p>They use our smart alerts monthly to improve their crops.</p>
                            <p>
                                Whether you're in the greenhouse or the field, we send you precise SMS alerts like:
                                "The optimal time to irrigate wheat is tomorrow at 9 AM" or "Heavy rain expected within 48 hours—postpone planting."
                            </p>
                        </div>

                        <div className="services__links">
                            <button type='button' className='services__link service__link-singup'>
                                Sign Up as Farmer
                            </button>

                            <Link to='#' className='services__link service__link-discover'>
                                <p className="service__link-discover-txt">
                                    Discover More
                                </p>

                                <img 
                                    src={LinkIcon} 
                                    alt="Link Icon" 
                                    className='service__link-discover-icon'
                                />
                            </Link>
                        </div>
                    </div>

                    <div className="services__image-wrapper">
                        <img 
                            src={Service1}
                            alt="Service Image 1" 
                            className='service-img'
                        />
                    </div>

                    <div className="services__image-wrapper">
                        <img 
                            src={Service2}
                            alt="Service Image 2" 
                            className='service-img'
                        />
                    </div>

                    <div className="services__content">
                        <div className="services__title">
                            <img 
                                src={Text} 
                                alt="Services Tilte Icon" 
                                className='services__title-note-img'
                            />

                            <p className="services__title-txt">
                                Smart dashboard for managing consultations & inventory
                            </p>
                        </div>

                        <h4 className="services__subtitle">
                            +500 agricultural engineers
                        </h4>

                        <div className="services__description">
                            <p>
                                They use our smart dashboard to efficiently manage their consultations and inventory.
                            </p>
                            <p>
                                Receive farmer requests and prioritize them (emergency pests vs. regular inquiries).
                                Monitor seed and fertilizer inventory and receive 
                                alerts when they are running low.
                                Specially designed for agricultural engineers and pharmacies.
                            </p>
                        </div>

                        <div className="services__links">
                            <button type='button' className='services__link service__link-singup'>
                                Sign Up as Engineer
                            </button>

                            <Link to='#' className='services__link service__link-discover'>
                                <p className="service__link-discover-txt">
                                    Discover More
                                </p>

                                <img 
                                    src={LinkIcon} 
                                    alt="Link Icon" 
                                    className='service__link-discover-icon'
                                />
                            </Link>
                        </div>
                    </div>

                    <div className="services__content">
                        <div className="services__title">
                            <img 
                                src={Location} 
                                alt="Services Tilte Icon" 
                                className='services__title-location-img'
                            />

                            <p className="services__title-txt">
                                Rent your equipment
                            </p>
                        </div>

                        <h4 className="services__subtitle">
                            +3,000 equipment requests daily
                        </h4>

                        <div className="services__description">
                            <p>
                                View tractor and equipment requests near you, and determine the best time to work based on weather and soil conditions.
                                Receive maintenance alerts and see your ratings from farmers.
                                Ideal for agricultural equipment owners.
                            </p>
                        </div>

                        <div className="services__links">
                            <button type='button' className='services__link service__link-singup'>
                                Sign Up as Equipment Dealer
                            </button>

                            <Link to='#' className='services__link service__link-discover'>
                                <p className="service__link-discover-txt">
                                    Discover More
                                </p>

                                <img 
                                    src={LinkIcon} 
                                    alt="Link Icon" 
                                    className='service__link-discover-icon'
                                />
                            </Link>
                        </div>
                    </div>

                    <div className="services__image-wrapper">
                        <img 
                            src={Service3}
                            alt="Service Image 3" 
                            className='service-img'
                        />
                    </div>
                </div>
            </section>

            
            {/* =============== HOW IT WORKS =============== */}
            <section className="howItWorks__home">
                <SectionTitle
                    subtitle='process'
                    title='how it works'
                    description={
                        'Get started in four simple steps and experience the future of agriculture management.'
                    }
                />

                <div className="howItWorks__home__container container grid">
                    {
                        howItWorks_home_data.map( ( { icon, number, title, description}, index ) => {
                            return (
                                <div key={index} className="howItWorks__home__card">
                                    <img 
                                        src={icon} 
                                        alt={`howItWorks__home-Card-Icon-${index + 1}`}
                                        className='howItWorks__home__card-img' 
                                    />

                                    <div className="howItWorks__home__card-number">
                                        <p>{number}</p>
                                    </div>

                                    <p className="howItWorks__home__card-title">
                                        {title}
                                    </p>

                                    <p className="howItWorks__home__card-description">
                                        {description}
                                    </p>
                                </div>
                            )
                        })
                    }
                    <div className="howItWorks__home__horizontal-line"></div>
                </div>
            </section>


            {/* =============== BENEFITS =============== */}
            <section className="benefits">
                <SectionTitle
                    subtitle='beneftis'
                    title='why choose agriSphere'
                    description={
                        'Discover the advantages that make AgriSphere the preferred choice for modern farmers and agricultural professionals.'
                    }
                />

                <div className="benefits__cards grid">
                    {
                        benefits_data.map( ( { icon, title, description }, index) => {
                            return (
                                <div key={index} className="benefits__card">
                                    <div className="benefits__card-title">
                                        <div className="benefits__card-image-wrapper">
                                            <img 
                                                src={icon} 
                                                alt={`Benefits-Card-Icon-${index + 1}`} 
                                                className='benefits__card-img'
                                            />
                                        </div>

                                        <p className="benefits__card-txt">
                                            {title}
                                        </p>
                                    </div>

                                    <p className="benefits__card-description">
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

export default Home;