import logo from './assets/logo.png'
import { Link } from 'react-router-dom'
export default function Footer(){
    return (
        <>
        <footer className="pt-2 text-white" style={{backgroundColor:'#022325'}}>
            <section className="">
                <div className="container mt-5">
                    <div className="row mt-2">
                        <div className="col-md-2 mx-auto mb-4">
                            <img className='logo d-block w-50 mx-auto' src={logo}></img>
                        </div>
                        <div className="col-md-2 mx-auto mb-4">
                            <h6 className="text-uppercase fw-bold mb-4">
                                <u>Quick links</u>
                            </h6>
                            <p>
                                <Link to='/Register' className='text-decoration-none text-white'>Sign Up</Link>
                            </p>
                            <p>
                                <Link to='/AboutUs' className='text-decoration-none text-white'>About Us</Link>
                            </p>
                        </div>
                        <div className="col-md-3 mx-auto mb-4">
                            <h6 className="text-uppercase fw-bold mb-4">
                                <u>Others</u>
                            </h6>
                            <p>
                                <a href="#!" className="text-decoration-none text-reset">User FAQs</a>
                            </p>
                            <p>
                                <Link to='/ContactUs' className='text-decoration-none text-white'>Contact Us</Link>
                            </p>
                            <p>
                                <a href="#!" className="text-decoration-none text-reset">Legal</a>
                            </p>
                            <p>
                                <a href="#!" className="text-decoration-none text-reset">Privacy Policy</a>
                            </p>
                            <p>
                                <a href="#!" className='text-decoration-none text-reset'>Terms and Conditions</a>
                            </p>
                        </div>

                        <div className="col-sm-4 mx-auto mb-md-0 mb-4">
                            <form action=''>
                                <div className='col-auto'>
                                    <p>
                                        Subscribe to our newsletter and be the first one to know about our updates.<br/>
                                    </p>
                                    <div className="form-outline form-white mb-4">
                                        <input type="email" className="form-control" placeholder="Email Address" aria-label="emailid" aria-describedby="btnGroupAddon"/>
                                        <div className="pt-3 col-auto">
                                            <button type="submit" className="btn btn-warning mb-4">
                                                Subscribe
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </section>
            <div className="p-4 container-fluid" style={{backgroundColor:'black'}}>
                <div className='row'>
                    <div className='col-sm-5'>
                        © 2023 Copyright. All Rights Reserved.
                    </div>
                    <div className='ms-auto col-sm-3'>
                        <a className="btn" style={{color:'white'}} href="#!" role="button">
                            <i className="bi bi-youtube"></i>
                        </a>
                        <a className="btn" style={{color:'white'}} href="#!" role="button">
                            <i className="bi bi-facebook"></i>
                        </a>
                        <a className="btn" style={{color:'white'}} href="#!" role="button">
                            <i className="bi bi-twitter"></i>
                        </a>
                        <a className="btn" style={{color:'white'}} href="#!" role="button">
                            <i className="bi bi-instagram"></i>
                        </a>
                    </div>
                </div>
            </div>
        </footer>
        </>
    );
}