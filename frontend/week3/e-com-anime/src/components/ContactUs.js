// src/components/ContactUs.js

import React from 'react';
import Header from './Header';
import Footer from './Footer';

const ContactUs = () => {
  return (
    <div>
      <Header />
      <h1>Contact Us</h1>
      {/* Get in touch => 2 Cards 
          Bigger Footer w/ socials */}
      <section className="what-we-do container">
        <h2>What we do to help our customers in the digital era</h2>
        <div className="row">
            <div className="col-md-4">
              <div className="card">
                <div className="card-content">
                  <h4>Leave a Message:</h4>
                  <p><italics>insert a form</italics></p>
                </div>
              </div>
            </div>
            <div className="col-md-4">
              <div className="card">
                <img src="/assets/card-image-2.jpg" alt="Map image" />
                <div className="card-content">
                  <h4>IIT Delhi Address</h4>
                  <p><italics>insert more details</italics></p>
                  <a href="#">Learn More</a>
                </div>
              </div>
            </div>
        </div>
      </section>
      {/* Make the footer bigger */}
      <Footer />
    </div>
  );
};

export default ContactUs;
