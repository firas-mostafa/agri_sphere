import React, { useState } from 'react';
import { page_links } from '../../../Data';
import { Link, NavLink } from 'react-router';
import Logo from '../../../assets/Logo.png';
import UserProfile from '../../../assets/user-bold 1.svg';

import './header.css';

function Header() {

    const [showMenu, setShowMenu] = useState(false);

    return (
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
                            page_links.map( ( { name, path }, index ) => {
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

                    <img src={UserProfile} alt="User Profile Image" />
                </div>
            </nav>
        </header>
    );
};

export default Header;