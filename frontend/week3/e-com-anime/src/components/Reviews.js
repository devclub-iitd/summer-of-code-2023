import React from "react";

export default function Reviews() {
    return (
        <section className="customer-reviews container">
          <h2>What our clients say</h2>
          <div className="row">
            <div className="col-md-12">
              <div className="review">
                <img src="/assets/client-photo.jpg" alt="Client Photo" />
                <p>"I am absolutely thrilled with my experience at your anime store! 
                  The collection is fantastic, and I found all my favorite characters and series
                  represented with top-notch quality products."</p>
              </div>
            </div>
          </div>
        </section>
      );
}