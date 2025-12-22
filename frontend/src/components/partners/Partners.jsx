import React from 'react';

import { partner_logoes } from '../../Data';

import './partners.css';

function Partners() {
    return (
        // =============== PARTNERS ===============
        <div className="partners">
            <h3 className='partner__title'>Partner With</h3>

            <div className="partner__logos">
                {
                    partner_logoes.map( ( { name, icon }, index ) => {
                        return (
                            <img
                                key={index}
                                src={icon} 
                                alt={`${name} Image`} 
                                className='partner__logo'
                            />
                        )
                    })
                }
            </div>
        </div>
    );
};

export default Partners;