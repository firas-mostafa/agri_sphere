import React, { useState } from 'react';

import { public_links, roles } from '../../../Data';
import { Link, NavLink } from 'react-router';

import Logo from '../../../assets/Logo.png';
import Facebook from '../../../assets/facebook-btn.svg';
import Google from '../../../assets/google-btn.svg';

import UserProfile from '../../../assets/user-bold 1.png';

import './header.css';

function Header() {

    const [showMenu, setShowMenu] = useState(false);
    const [showPopupLogin, setShowPopupLogin] = useState(false);
    const [showPopupRegister, setShowPopupRegister] = useState(false);
    const [showPopupForgetpassword, setShowPopupForgetpassword] = useState(false);

    return (
        <>
            <header className='header'>
                <nav className="nav container">
                    <Link to='/' className='nav__logo'  >
                        <img src={Logo} alt="AgriShpere Logo" className="nav__logo-img" />

                        <div className="nav__logo-txt">
                            Agri<span>Sphere</span>
                        </div>
                    </Link>

                    <div className={ `${ showMenu ? 'nav__menu show__menu' : 'nav__menu' } ` } id='nav-menu'>
                        <ul className="nav__list">
                            {
                                public_links.map( ( { name, path }, index ) => {
                                    return (
                                        <li className="nav__item" key={index}>
                                            <NavLink
                                                to={path}
                                                className={ ( { isActive } ) =>
                                                    isActive ? 'nav__link active__nav-link' : 'nav__link'
                                                }
                                                onClick={ () => setShowMenu(!showMenu)}
                                            >
                                                {name}
                                            </NavLink>
                                        </li>
                                    )
                                })
                            }
                        </ul>
                    </div>

                    <div className='header__user-actions'>
                        <div className="theme__toggle" id="theme-toggle">
                            <label htmlFor="" className="switch">
                                <input type="checkbox" name="" id="" />
                                <span className="slider"></span>
                            </label>
                        </div>

                        <img 
                            src={UserProfile} 
                            alt="User Profile Image" 
                            className='header__user-profile' 
                            onClick={ () => setShowPopupLogin(!showPopupLogin) }
                        />
                    </div>
                </nav>
            </header>

            <div className={ ` ${ showPopupLogin ? 'login__popup open' : 'login__popup' } ` }>
                <div className="login__popup-inner">
                    <div className="login__popup-content flex">
                        <h4 className="login__popup-title">Welcome back</h4>

                        <form className="login__popup-form">
                            <input 
                                type="email" 
                                name="login_email" 
                                id="login_email" 
                                className='login__popup-input'
                                placeholder='Email'
                            />

                            <input 
                                type="password" 
                                name="login_password" 
                                id="login_password" 
                                className='login__popup-input'
                                placeholder='Password'
                            />

                            <div className="login__popup-remember-forget flex">
                                <div className="login__popup-remember-me flex">
                                    <input 
                                        type="radio" 
                                        name="rememberme" 
                                        id="rememberme" 
                                        className='login__popup-remember-radio'
                                    />

                                    <label htmlFor="rememberme" className='rememberme'>
                                        Remember me
                                    </label>
                                </div>

                                <p 
                                    className="login__popup-forget-password"
                                    onClick={ 
                                        () => {
                                            setShowPopupLogin(!showPopupLogin);
                                            setShowPopupForgetpassword(!showPopupForgetpassword);
                                        } 
                                    }
                                >
                                    Forgot Password?
                                </p>
                            </div>

                            <button type="submit" className='login__popup-btn'>Log In</button>
                        </form>

                        <div className="login__popup-assistant">
                            <span className="login__popup-account">Don't have an account?</span>
                            <span 
                                className='login__popup-singup'
                                onClick={
                                    () => {
                                        setShowPopupLogin(!showPopupLogin);
                                        setShowPopupRegister(!showPopupRegister);
                                    }
                                }
                            >Sign Up</span>
                        </div>

                        <p className='login__popup-divider'>
                            Or With
                        </p>

                        <div className="login__popup-socials flex">
                            <button type="button" className="login__popup-social facebook-btn">
                                <img 
                                    src={Facebook} 
                                    alt="Facebook Icon" 
                                    className='login__popup-facebook-icon'
                                />
                                Facebook
                            </button>

                            <button type="button" className="login__popup-social google-btn">
                                <img 
                                    src={Google}
                                    alt="Google Icon" 
                                    className='login__popup-google-icon'
                                />
                                Log in with Google
                            </button>
                        </div>
                    </div>
                </div>
            </div>

            <div className={` ${ showPopupRegister ? 'register__popup open' : 'register__popup' }  ` }>
                <div className="register__popup-inner">
                    <div className="register__popup-content">
                        <h4 className="register__popup-title">Create account</h4>

                        <p className="register__popup-subtitle">
                            I am registering as...
                        </p>

                        <div className="register__popup-registration-method">
                            {
                                roles.map( ( { name, icon }, index ) => {
                                    return (
                                        <div key={index} className="register__popup-registration-method-box">
                                            <div className="register__popup-registration-method-img-wrapper">
                                                <img 
                                                    src={icon} 
                                                    alt={`${name} Icon`} 
                                                    className="register__popup-registration-method-img" 
                                                />
                                            </div>
                                            
                                            <p className="register__popup-registration-method-role">
                                                {name}
                                            </p>
                                        </div>
                                    )
                                } )
                            }
                        </div>

                        <form className="register__popup-form">
                            <input 
                                type="text" 
                                name="register_name" 
                                id="register_name" 
                                className='register__popup-input'
                                placeholder='Name'
                            />

                            <input 
                                type="email" 
                                name="register_email" 
                                id="register_email" 
                                className='register__popup-input'
                                placeholder='Email'
                            />

                            <input 
                                type="number" 
                                name="phone" 
                                id="phone" 
                                className='register__popup-input'
                                placeholder='Phone'
                            />

                            <input 
                                type="password" 
                                name="register_password"
                                id="register_password" 
                                className='register__popup-input'
                                placeholder='Password'
                            />

                            <button type="submit" className='register__popup-btn'>Create account</button>
                        </form>

                        <div className="register__popup-assistant">
                            Already have an account?
                            <span 
                                className='register__popup-singin'
                                onClick={
                                    () => {
                                        setShowPopupRegister(!showPopupRegister);
                                        setShowPopupLogin(!showPopupLogin);
                                    }
                                }
                            >Log in</span>
                        </div>

                        <p className='register__popup-divider'>
                            Or With
                        </p>

                        <div className="login__popup-socials flex">
                            <button type="button" className="login__popup-social facebook-btn">
                                <img 
                                    src={Facebook} 
                                    alt="Facebook Icon" 
                                    className='login__popup-facebook-icon'
                                />
                                Facebook
                            </button>

                            <button type="button" className="login__popup-social google-btn">
                                <img 
                                    src={Google}
                                    alt="Google Icon" 
                                    className='login__popup-google-icon'
                                />
                                Log in with Google
                            </button>
                        </div>
                    </div>
                </div>
            </div>

            <div className={ ` ${ showPopupForgetpassword ?'forgetpassword__popup open' : 'forgetpassword__popup' } ` }>
                <div className="forgetpassword__popup-inner">
                    <div className="forgetpassword__popup-content flex">
                        <h6 className='forgetpassword__popup-title'>Forget Password</h6>

                        <form className="forgetpassword__popup-form">
                            <label htmlFor="forget_email" className="forgetpassword__popup-label">
                                Email
                            </label>

                            <input 
                                type="email" 
                                name="forget_email" 
                                id="forget_email" 
                                className="forgetpassword__popup-input" 
                                placeholder='Enter your email'
                            />

                            <button type="submit" className="forgetpassword__popup-btn">Send Email</button>
                        </form>

                        <p className="forgetpassword__popup-assistant">
                            Don't have an account?
                            <span 
                                className="forgetpassword__popup-singup"
                                onClick={ 
                                    () => {
                                        setShowPopupForgetpassword(!showPopupForgetpassword);
                                        setShowPopupRegister(!showPopupRegister);
                                    } 
                                }
                            >Sing up now</span>
                        </p>
                    </div>
                </div>
            </div>
        </>
    );
};

export default Header;