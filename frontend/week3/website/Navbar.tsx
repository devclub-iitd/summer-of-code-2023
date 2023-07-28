import logo from './assets/logo.png'
import {  
  BrowserRouter as Router,  
  Routes,  
  Route,  
  Link  
}   
from 'react-router-dom';  

export default function Navbar(){
    //const links = document.querySelectorAll('.nav-link');
    
    //if (links.length) {
    //links.forEach((link) => {
        //link.addEventListener('click', (e) => {
        //links.forEach((link) => {
            //link.classList.remove('active');
        //});
        //e.preventDefault();
        //link.classList.add('active');
            //});
        //});
    //}
    return (
        <>
        <nav className="navbar navbar-expand-sm navbar-dark sticky-top" style={{backgroundColor:"#022325"}}>
            <div className="container-fluid">
                <a className="navbar-brand">
                    <img className="logo" src={logo} width="15%" alt="logo"></img>
                </a>
                <button className="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#collapsibleNavbar">
                    <span className="navbar-toggler-icon"></span>
                </button>
                <div className="collapse navbar-collapse" id="collapsibleNavbar">
                    <ul className="nav navbar-nav ms-auto">
                        <li className="navitem">
                            <Link to='/' className='text-decoration-none'>
                                <span className='align-middle p-2 text-white'>HOME</span>
                            </Link>
                        </li>
                        <li className="navitem">
                            <Link to='/AboutUs' className='text-decoration-none'>
                                <span className='align-middle p-2 text-white'>ABOUT US</span>
                            </Link>
                        </li>
                        <li className="navitem">
                            <Link to='/ContactUs' className='text-decoration-none'>
                                <span className='align-middle p-2 text-white'>CONTACT US</span>
                            </Link>
                        </li>
                        <li className="navitem">
                            <Link to='/Verify' className='text-decoration-none'>
                                <span className='align-middle p-2 text-white'>VERIFY</span>
                            </Link>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        </>
    );
}