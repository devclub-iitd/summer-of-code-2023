import { Link } from 'react-router-dom';
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
            <Link to='/' className="nav-link" aria-current="page" activeclassname="active" id="home">Home</Link>
          </li>
          <li className="nav-item px-3">
            <Link to='/about' className="nav-link" activeclassname="active" id="about">About</Link>
          </li>
          <li className="nav-item px-3">
            <Link to='/contactus' className="nav-link" activeclassname="active" id="contact">Contact Us</Link>
          </li>
        </ul>
      </div>
    </div>
  </nav>
  );
}