import React from 'react';

import Layout from '../../../components/common/Layout';

import './fqa.css';

function FQA() {
    return (
        <Layout>

            {/* =============== FQA HEADER =============== */}
            <section className="header__fqa section">
                <div className="fqa__header__container container">
                    <h2 className="fqa__header-title">
                        frequently asked questions
                    </h2>

                    <h4 className="fqa__header-subtitle">
                        Topics
                    </h4>

                    <div className="fqa__header-filter flex">
                        <select 
                            name="fqa__topic" 
                            id="fqa__topic"
                            className='fqa__header-select'
                        >
                            <option value="#">All Topics</option>
                            <option value="#">For Farmers</option>
                            <option value="#">For Agricultural Engineers</option>
                            <option value="#">For Farm Equipment Owners (Dealers)</option>
                            <option value="#">For all users</option>
                        </select>

                        <select 
                            name="fqa__sort" 
                            id="fqa__sort"
                            className='fqa__header-select'
                        >
                            <option value="#">Newest to oldest</option>
                            <option value="#">Oldest to newest</option>
                        </select>
                    </div>
                </div>
            </section>

        </Layout>
    );
};

export default FQA;