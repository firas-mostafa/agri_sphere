import React from 'react';

import './sectiontitle.css';

function SectionTitle( { subtitle, title, description } ) {
    return (
        <div className="section__title">
            {
                subtitle && 
                        <p className='section__title-sub'>{subtitle}</p>
            }

            <h2 className='section__title-title'>
                {title}
            </h2>

            <p className='section__title-description'>
                {description}
            </p>
        </div>
    );
};

export default SectionTitle;