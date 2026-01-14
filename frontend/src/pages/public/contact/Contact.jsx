import React from 'react';
import { Link } from 'react-router';

import Layout from '../../../components/common/Layout';
import CtaContactFooter from '../../../components/cta-footer/CtaContactFooter';
import Partners from '../../../components/partners/Partners';

import { contact__data } from '../../../Data';

import FQAImage from '../../../assets/fqa-image.png';
import TelegramIcon from '../../../assets/telegram.svg';

import './contact.css';

function Contact() {
    return (
        <Layout>
            {/* =============== CONTACT =============== */}
            <section className="contact section">
                <div className="contact__container grid">
                    <div className="contact__content grid">
                        <div className="contact__info">
                            <h5 className="contact__info-title">
                                Get in Touch
                            </h5>

                            <div className="contact__info-wrapper">
                                {
                                    contact__data.map( ( {icon, title, data, description}, index ) => {
                                        return (
                                            <div key={index} className='contact__info-content'>
                                                <div className="contact__info-image-wrapper">
                                                    <img 
                                                        src={icon}
                                                        alt={`Contact-Info-Icon-${index + 1}`} 
                                                        className='contact__info-img'
                                                    />
                                                </div>

                                                <div className="contact__info-data">
                                                    <h6 className="contact__info-data-title">
                                                        {title}
                                                    </h6>

                                                    { data && <p className="contact__info-data-data">{data}</p> }
                                                    

                                                    <p className="contact__info-data-description">
                                                        {description}
                                                    </p>
                                                </div>
                                            </div>
                                        )
                                    })
                                }
                            </div>
                        </div>

                        <div className="contact__fqa">
                            <div className="contact__fqa-image-wrapper">
                                <img 
                                    src={FQAImage}
                                    alt="FQA Image"
                                    className='contact__fqa-img' 
                                />
                            </div>

                            <div className="contact__fqa-data">
                                <h6 className="contact__fqa-data-title">
                                    Frequently asked questions
                                </h6>

                                <p className="contact__fqa-data-description">
                                    Find answers to Frequently Asked Questions about our products, services, ordering process, and more.
                                </p>

                                <Link 
                                    to='/fqa' 
                                    className="contact__fqa-data-btn"
                                >
                                    Visit FAQ
                                </Link>
                            </div>
                        </div>
                    </div>

                    <div className="contact__form">
                        <div className="contact__form-wrapper">
                            <h5 className="contact__form-title">
                                Send Us a Message
                            </h5>

                            <p className="contact__form-description">
                                Fill out the form below and we'll get back to you as soon as possible.
                            </p>

                            <div className="contact__form-group grid">
                                <div className="contact__form-div">
                                    <label htmlFor="contact_name" className="contact__form-label">
                                        Full Name <b>*</b>
                                    </label>

                                    <input 
                                        type="text" 
                                        name="contact_name" 
                                        id="contact_name" 
                                        className='contact__form-input'
                                        placeholder='Full name'
                                    />
                                </div>

                                <div className="contact__form-div">
                                    <label htmlFor="contact_email" className="contact__form-label">
                                        Email Address <b>*</b>
                                    </label>

                                    <input 
                                        type="email" 
                                        name="contact_email" 
                                        id="contact_email" 
                                        className='contact__form-input'
                                        placeholder='name@example.com'
                                    />
                                </div>

                                <div className="contact__form-div">
                                    <label htmlFor="contact_number" className="contact__form-label">
                                        Phone Number <b>*</b>
                                    </label>

                                    <input 
                                        type="number" 
                                        name="contact_number" 
                                        id="contact_number" 
                                        className='contact__form-input'
                                        placeholder='(963) 123-4567'
                                    />
                                </div>

                                <div className="contact__form-div">
                                    <label htmlFor="contact_company-farm-name" className="contact__form-label">
                                        Company/Farm Name <b>*</b>
                                    </label>

                                    <input 
                                        type="text" 
                                        name="contact_company-farm-name" 
                                        id="contact_company-farm-name" 
                                        className='contact__form-input'
                                        placeholder='name Family Farm'
                                    />
                                </div>
                            </div>

                            <div className="contact__form-div">
                                <label htmlFor="contact_inquiry" className="contact__form-label">
                                    Inquiry Type <b>*</b>
                                </label>

                                <select 
                                    name="contact_inquiry" 
                                    id="contact_inquiry"
                                    className='contact__form-select'
                                >
                                    <option value="#">Choose option</option>
                                    <option value="#">inquiry 1</option>
                                    <option value="#">inquiry 1</option>
                                    <option value="#">inquiry 1</option>
                                </select>
                            </div>

                            <div className="contact__form-div">
                                <label htmlFor="contact_subject" className="contact__form-label">
                                    Subject <b>*</b>
                                </label>

                                <input 
                                    type="text" 
                                    name="contact_subject" 
                                    id="contact_subject" 
                                    className='contact__form-input'
                                    placeholder='How can we help you?'
                                />
                            </div>

                            <div className="contact__form-div">
                                <label htmlFor="contact_message" className="contact__form-label">
                                    Message <b>*</b>
                                </label>

                                <textarea 
                                    name="contact_message" 
                                    id="contact_message"
                                    className='contact__form-input contact__form-area'
                                ></textarea>
                            </div>

                            <button type="submit" className='contact__form-button'>
                                <img 
                                    src={TelegramIcon}
                                    alt="Telegram Icon" 
                                    className='contact__form-button-icon'
                                />
                            </button>

                            <p className="contact__form-confirmation">
                                By submitting this form, you agree to our privacy policy and terms of service.
                            </p>
                        </div>
                    </div>
                </div>
            </section>

            {/* =============== CTA-Contact-Footer =============== */}
            <CtaContactFooter />

            {/* =============== PARTNERS =============== */}
            <Partners />
        </Layout>
    );
};

export default Contact;