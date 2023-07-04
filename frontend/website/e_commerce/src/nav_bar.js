import { Link } from 'react-router-dom';
import React from 'react';
export default function Nav_bar() {
  return (
    <nav class="navbar navbar-expand-lg bg-body-tertiary">
    <div class="container-fluid">
      <a class="navbar-brand" href="#">Navbar</a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse d-flex justify-content-end" id="navbarNav">
        <ul class="navbar-nav">
          <li class="nav-item px-3">
            <Link to='/Home/Home' class="nav-link active" aria-current="page">Home</Link>
          </li>
          <li class="nav-item px-3">
            <a class="nav-link" href="#">About</a>
          </li>
          <li class="nav-item px-3">
            <a class="nav-link" href="#">Contact Us</a>
          </li>
        </ul>
      </div>
    </div>
  </nav>
  );
}
