import { NavLink } from 'react-router-dom';
import './nav_bar.css'

export default function NavBar() {
  return (
    <nav className="navbar navbar-expand-lg bg-body-tertiaryn navbar-custom shadow-none" style={{ backgroundColor: '#4a99d333'}}>
    <div className="container-fluid shadow-none">
      <a className="navbar-brand" style={{
      color: '#4A99D3',
      fontSize: '2.5rem',
      fontFamily: 'ABeeZee',
      fontStyle: 'normal',
      fontWeight: 400,
      lineHeight: 'normal'
    }}>BUYERS NEVER DIE</a>
      <button className="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span className="navbar-toggler-icon"></span>
      </button>
      <div className="collapse navbar-collapse d-flex justify-content-end" id="navbarNav">
        <ul className="navbar-nav">
          <li className="nav-item px-3">
            <NavLink to='/' className={({ isActive })=>{return ('nav-link'+(isActive?" active":""))}} aria-current="page"  id="home">Home</NavLink>
          </li>
          <li className="nav-item px-3">
            <NavLink to='/about' className={({ isActive })=>{return ('nav-link'+(isActive?" active":""))}} id="about">About</NavLink>
          </li>
          <li className="nav-item px-3">
            <NavLink to='/contactus' className={({ isActive })=>{return ('nav-link'+(isActive?" active":""))}} id="contact">Contact Us</NavLink>
          </li>
        </ul>
      </div>
    </div>
  </nav>
  );
}