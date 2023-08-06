import React from "react";

export default function WhatWeDo() {
    return (
        <section className="what-we-do container">
          <h2>What we do to help our customers in the digital era</h2>
          <div className="row">
            <div className="col-md-4">
              <div className="card">
                <img src="/assets/card-image-1.jpg" alt="Card Image" />
                <div className="card-content">
                  <h4>Custom Stylish Designs:</h4>
                  <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                  <a href="#">Learn More</a>
                </div>
              </div>
            </div>
            <div className="col-md-4">
              <div className="card">
                <img src="/assets/card-image-2.jpg" alt="Card Image" />
                <div className="card-content">
                  <h4>Convenient Payment</h4>
                  <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                  <a href="#">Learn More</a>
                </div>
              </div>
            </div>
            <div className="col-md-4">
              <div className="card">
                <img src="/assets/card-image-3.jpg" alt="Card Image" />
                <div className="card-content">
                  <h4>Reliable Delivery</h4>
                  <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                  <a href="#">Learn More</a>
                </div>
              </div>
            </div>
          </div>
        </section>
    );
}