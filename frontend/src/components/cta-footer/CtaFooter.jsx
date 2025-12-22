import React from 'react';

import './ctafooter.css';

function CTAFooter() {
    return (
        // =============== CTA Footer ===============
        <div className="cta__footer">
            <h2 className="cta__footer-title">
                Ready to Transform Your Farm?
            </h2>

            <p className="cta__footer-description">
                Join thousands of farmers who have already improved their operations with our platform. 
                Subscribe to receive farming tips, weather insights, and exclusive updates.
            </p>

            <div className="cta__footer-email">
                <input 
                    type="email" 
                    name="email" 
                    id="email" 
                    className='cta__footer-input'
                    placeholder='@ Enter Your Email'
                />
                <button type="button" className='cta__footer-btn'>Get Start</button>
            </div>
        </div>
    );
};

export default CTAFooter;