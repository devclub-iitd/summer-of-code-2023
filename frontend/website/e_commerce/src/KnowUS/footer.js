export default function Footer(){
    return(
        
            <footer className="text-center text-lg-start border border-white mt-xl-5 pt-4" style={{ backgroundColor: '#4A99D3',color:'white'}}>
            <div className="container p-4">
              <div className="row">
                <div className="col-lg-3 col-md-6 mb-4 mb-lg-0">
                  <h5 className="text-uppercase mb-4">OUR WORLD</h5>
        
                  <ul className="list-unstyled mb-4">
                    <li>
                      <a href="#!" className="text-white">About us</a>
                    </li>
                    <li>
                      <a href="#!" className="text-white">Collections</a>
                    </li>
                    <li>
                      <a href="#!" className="text-white">Environmental philosophy</a>
                    </li>
                    <li>
                      <a href="#!" className="text-white">Artist collaborations</a>
                    </li>
                  </ul>
                </div>
                <div className="col-lg-3 col-md-6 mb-4 mb-lg-0">
                  <h5 className="text-uppercase mb-4">Assistance</h5>
        
                  <ul className="list-unstyled">
                    <li>
                      <a href="#!" className="text-white">Contact us</a>
                    </li>
                    <li>
                      <a href="#!" className="text-white">Size Guide</a>
                    </li>
                    <li>
                      <a href="#!" className="text-white">Shipping Information</a>
                    </li>
                    <li>
                      <a href="#!" className="text-white">Returns & Exchanges</a>
                    </li>
                    <li>
                      <a href="#!" className="text-white">Payment</a>
                    </li>
                  </ul>
                </div>


                <div className="col-lg-3 col-md-6 mb-4 mb-lg-0">
                  <h5 className="text-uppercase mb-4">Careers</h5>
        
                  <ul className="list-unstyled">
                    <li>
                      <a href="#!" className="text-white">Jobs</a>
                    </li>
                  </ul>
                </div>

                <div className="col-lg-3 col-md-6 mb-4 mb-lg-0">
                  <h5 className="text-uppercase mb-4">Sign up to our newsletter</h5>
        
                  <div className="form-floating mb-3">
  <input type="email" className="form-control text-black" id="floatingInput" placeholder="name@example.com"/>
  <label htmlFor="floatingInput" className="text-black">Email address</label>
</div>
        
                  <button type="submit" className="btn btn-outline-white btn-block bg-white">Subscribe</button>
                </div>
              </div>
            </div>

            <div className="text-center p-3 border-top border-white">
              © 2023 Copyright:Buyers Never Die
            </div>
          </footer>
          )
}