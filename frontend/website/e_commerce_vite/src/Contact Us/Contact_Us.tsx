import './Contact_Us.css'
import React from 'react'
import img from "./images/Screenshot 2023-07-03 at 9.51 1.svg"
export default function Contact_Us():React.ReactNode{
    
  return (
    <div className="row justify-content-center py-5" id='contactus'>
      <div className="card col-sm-8 " style={{ borderRadius: '0.625rem', background: '#FFF', boxShadow: '2px 10px 28px 0px rgba(75, 0, 129, 0.12)' }}>
        <div className="card-body">
          <div className="row "><span className="text-primary p-3 d-flex justify-content-center" style={{color: '#4A99D3',fontSize: '1.5rem',fontFamily: 'ABeeZee',fontStyle: 'normal',fontWeight: 400,lineHeight: 'normal',letterSpacing: '0.015rem',}}>Get in Touch</span></div>
          <div className="row">
            {/* <div className="d-sm-flex flex-column"> */}
            <div className="col">
              <div className="px-2 py-4"> <span
      style={{
        fontSize: '1.25rem',
        fontFamily: 'Cambay',
        fontStyle: 'normal',
        fontWeight: 400,
        lineHeight: 'normal',
      }}
    >Leave us a message</span></div>
              <div className="form-floating mb-3">
                <input
                  type="text"
                  className="form-control"
                  id="name"
                  placeholder="Name"
                />
                <label htmlFor="floatingInput">Name</label>
              </div>
              <div className="form-floating mb-3">
                <input
                  type="email"
                  className="form-control"
                  id="floatingInput"
                  placeholder="name@example.com"
                />
                <label htmlFor="floatingInput">Email address</label>
              </div>
              <div className="form-floating">
                <textarea
                  className="form-control mb-3"
                  placeholder="Leave a comment here"
                  id="floatingTextarea2"
                  style={{ height: 100 }}
                ></textarea>
                <label htmlFor="floatingTextarea2">Message Us</label>
                <div className="d-grid gap-2 mb-4">
                  <button className="btn btn-primary" type="button">
                    Button
                  </button>
                </div>
              </div>
            </div>
            <div className="col">
              <div className="pb-2 pt-3">
              <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" className="bi bi-geo-alt mx-2" viewBox="0 0 16 16">
  <path d="M12.166 8.94c-.524 1.062-1.234 2.12-1.96 3.07A31.493 31.493 0 0 1 8 14.58a31.481 31.481 0 0 1-2.206-2.57c-.726-.95-1.436-2.008-1.96-3.07C3.304 7.867 3 6.862 3 6a5 5 0 0 1 10 0c0 .862-.305 1.867-.834 2.94zM8 16s6-5.686 6-10A6 6 0 0 0 2 6c0 4.314 6 10 6 10z"/>
  <path d="M8 8a2 2 0 1 1 0-4 2 2 0 0 1 0 4zm0 1a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
</svg>
                IIT Campus, Indian Institute of Technology Delhi,
                Hauz Khas, New Delhi, Delhi 110016
              </div>
              <div className="pb-2">
              <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" className="bi bi-earbuds mx-2" viewBox="0 0 16 16">
  <path fillRule="evenodd" d="M6.825 4.138c.596 2.141-.36 3.593-2.389 4.117a4.432 4.432 0 0 1-2.018.054c-.048-.01.9 2.778 1.522 4.61l.41 1.205a.52.52 0 0 1-.346.659l-.593.19a.548.548 0 0 1-.69-.34L.184 6.99c-.696-2.137.662-4.309 2.564-4.8 2.029-.523 3.402 0 4.076 1.948zm-.868 2.221c.43-.112.561-.993.292-1.969-.269-.975-.836-1.675-1.266-1.563-.43.112-.561.994-.292 1.969.269.975.836 1.675 1.266 1.563zm3.218-2.221c-.596 2.141.36 3.593 2.389 4.117a4.434 4.434 0 0 0 2.018.054c.048-.01-.9 2.778-1.522 4.61l-.41 1.205a.52.52 0 0 0 .346.659l.593.19c.289.092.6-.06.69-.34l2.536-7.643c.696-2.137-.662-4.309-2.564-4.8-2.029-.523-3.402 0-4.076 1.948zm.868 2.221c-.43-.112-.561-.993-.292-1.969.269-.975.836-1.675 1.266-1.563.43.112.561.994.292 1.969-.269.975-.836 1.675-1.266 1.563z"/>
</svg>
              +91-844*******
              </div>
              <div className="pb-5 mb-3">
              <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" className="bi bi-envelope mx-2" viewBox="0 0 16 16">
  <path d="M0 4a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V4Zm2-1a1 1 0 0 0-1 1v.217l7 4.2 7-4.2V4a1 1 0 0 0-1-1H2Zm13 2.383-4.708 2.825L15 11.105V5.383Zm-.034 6.876-5.64-3.471L8 9.583l-1.326-.795-5.64 3.47A1 1 0 0 0 2 13h12a1 1 0 0 0 .966-.741ZM1 11.105l4.708-2.897L1 5.383v5.722Z"/>
</svg>
                <a href="devclub.iitd@gmail.com">devclub.iitd@gmail.com</a>
              </div>
              <img src={img}/>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}
