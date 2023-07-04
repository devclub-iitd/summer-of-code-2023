import { Link } from 'react-router-dom';
import './nav_bar.css'

export default function NavBar() {
  return (
    <nav class="navbar navbar-expand-lg bg-body-tertiaryn navbar-custom shadow-none" style={{ backgroundColor: '#4a99d333'}}>
    <div class="container-fluid shadow-none">
      <a class="navbar-brand" style={{
      color: '#4A99D3',
      fontSize: '2.5rem',
      fontFamily: 'ABeeZee',
      fontStyle: 'normal',
      fontWeight: 400,
      lineHeight: 'normal'
    }}>BUYERS NEVER DIE</a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse d-flex justify-content-end" id="navbarNav">
        <ul class="navbar-nav">
          <li class="nav-item px-3">
            <Link to='/' class="nav-link" aria-current="page" activeClassName="active" id="home">Home</Link>
          </li>
          <li class="nav-item px-3">
            <Link to='/about' class="nav-link" activeClassName="active" id="about">About</Link>
          </li>
          <li class="nav-item px-3">
            <Link to='/contactus' class="nav-link" activeClassName="active" id="contact">Contact Us</Link>
          </li>
        </ul>
      </div>
    </div>
  </nav>
  );
}