import React from 'react';

import SectionTitle from '../title/SectionTitle';

import './howitworks.css';

function HowItWorks(props) {
    return (
        <>
            <SectionTitle
                title='How It Works'
                description={
                    'Get started in minutes and transform your agricultural operations'
                }
            />

            <div className="howItWorks-cards grid">
                {
                    props.data.map( ( { title, description }, index ) => {
                        return (
                            <div 
                                key={index} 
                                data-number={index + 1}
                                className="howItWorks-card"
                            >
                                <h6 className="howItWorks-card-title">
                                    {title}
                                </h6>

                                <p className="howItWorks-card-description">
                                    {description}
                                </p>
                            </div>
                        )
                    })
                }
                <div className="howItWorks-vertical-line"></div>
            </div>
        </>
    );
};

export default HowItWorks;