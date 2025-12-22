import React from 'react';
import { Link } from 'react-router';

import './ctafooter.css';

function CtaContactFooter() {
    return (
        // =============== PARTNERS ===============
        <div className="cta__contact__footer">
            <h3 className="cta__contact__footer-title">
                Need Immediate Assistance?
            </h3>

            <p className="cta__contact__footer-description">
                Our support team is ready to help you with any questions or technical issues.
            </p>

            <div className="cta__contact__footer-info">
                <Link to='#' className='cta__contact__footer-info-link1'>
                    Call Now: +963988005166
                </Link>

                <Link to='#' className='cta__contact__footer-info-link2'>
                    Email Support
                </Link>
            </div>
        </div>
    );
};

export default CtaContactFooter;