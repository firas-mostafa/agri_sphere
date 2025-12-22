import React from 'react';
import { platform_links, social_links, support_links, term_links } from '../../../Data';
import { Link, NavLink } from 'react-router';
import Logo from '../../../assets/Logo.png';
import Lang from '../../../assets/Lang.png';
import Apple from '../../../assets/apple.png';
import Google from '../../../assets/google.png';

import './footer.css';

function Footer() {
    return (
        <>
            {/* =============== FOOTER =============== */}
            <footer className="footer">
                <div className="footer__container container grid">
                    <div className="footer__content">
                        <Link to='/' className="footer__logo flex">
                            <img src={Logo} alt="AgriSphere Logo" className="footer__logo-img" />

                            <div className="footer__logo-txt">
                                Agri<span>Sphere</span>
                            </div>
                        </Link>

                        <p className="footer__description">
                            Empowering farmers with smart technology for sustainable agriculture.
                        </p>

                        <div className="footer__socials">
                            <div className="footer__social-links flex">
                                {
                                    social_links.map( ( {name, url, icon }, index ) => {
                                        return (
                                            <a key={index} href={url} target='_blank'>
                                                <img 
                                                    src={icon} 
                                                    alt={`${name} Icon`}
                                                    className='footer__social-icon'
                                                />
                                            </a>
                                        )
                                    })
                                }
                            </div>
                        </div>
                    </div>

                    <div className="footer__content">
                        <div className="footer__title">Platform</div>

                        <ul className="footer__links">
                            {
                                platform_links.map( ( { name, path }, index ) => {
                                    return (
                                        <li key={index}>
                                            <NavLink 
                                                to={path}
                                                className={ ( { isActive } ) => 
                                                    isActive ? 'footer__link active__footer-link' : 'footer__link'
                                                }
                                            >
                                                {name}
                                            </NavLink>
                                        </li>
                                    )
                                })
                            }
                        </ul>
                    </div>

                    <div className="footer__content">
                        <div className="footer__title">Support</div>

                        <ul className="footer__links">
                            {
                                support_links.map( ( { name, path }, index ) => {
                                    return (
                                        <li key={index}>
                                            <NavLink 
                                                to={path}
                                                className={ ( { isActive } ) => 
                                                    isActive ? 'footer__link active__footer-link' : 'footer__link'
                                                }
                                            >
                                                {name}
                                            </NavLink>
                                        </li>
                                    )
                                })
                            }
                        </ul>

                        <div className="footer__title">Language</div>
                        <div className="footer__lang flex">
                            <img 
                                src={Lang} 
                                alt="Earth Icon"
                                className='footer__lang-icon'
                            />

                            <span>English</span>
                        </div>
                    </div>

                    <div className="footer__content">
                        <div className="footer__title">Legal & Policy</div>

                        <ul className="footer__links">
                            {
                                term_links.map( ( { name, path }, index ) => {
                                    return (
                                        <li key={index}>
                                            <Link 
                                                to={path}
                                                className='footer__link'
                                            >
                                                {name}
                                            </Link>
                                        </li>
                                    )
                                })
                            }
                        </ul>
                    </div>

                    <div className="footer__content">
                        <div className="footer__title">Get Our App</div>

                        <div className="footer__app">
                            <a href="#" className="footer__app-btn">
                                <img 
                                    src={Apple} 
                                    alt="Apple Icon" 
                                    className='footer__app-icon'
                                />

                                <div className="footer__app-txt">
                                    <p>Download from</p>
                                    <p>App Store</p>
                                </div>
                            </a>

                            <a href="#" className="footer__app-btn">
                                <img 
                                    src={Google} 
                                    alt="Google Icon" 
                                    className='footer__app-icon'
                                />

                                <div className="footer__app-txt">
                                    <p>GET IT ON</p>
                                    <p>Google Play</p>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>

                <div className="footer__bottom">
                    <p className="copyright">&copy; 2025 AgriSphere All rights reserved</p>
                </div>
            </footer>
        </>
    );
};

export default Footer;