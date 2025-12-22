import React from 'react';

import './sectionsubtitle.css';

function SectionSubTitle( {subtitle} ) {
    return (
        <h3 className="section__subtitle">
            {subtitle}
        </h3>
    );
};

export default SectionSubTitle;