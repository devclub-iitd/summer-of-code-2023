import { useState } from "react";
import { Link } from "react-router-dom";

export default function Navbar(props) {
  const {products,setProducts}=props;
  const [search,setSearch]=useState("");
    return (
      <nav className="navbar navbar-expand-lg bg-primary">
        <div className="container-fluid">
          <a className="navbar-brand text-white" href="/reachus">
            Buyers Never Die
          </a>
          <button
            className="navbar-toggler"
            type="button"
            data-bs-toggle="collapse"
            data-bs-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent"
            aria-expanded="false"
            aria-label="Toggle navigation"
          >
            <span className="navbar-toggler-icon"></span>
          </button>
          <div className="collapse navbar-collapse" id="navbarSupportedContent">
            <ul className="navbar-nav me-auto mb-2 mb-lg-0">
              <li className="nav-item">
                <button className="nav-link active text-white" aria-current="page" onClick={async()=>{
                  setProducts([])
                  await fetch("https://marketplace-1-b3203472.deta.app/search/promoted").then(x=>x.json()).then(x=>{setProducts(x)})
                }}>
                  Promoted
                </button>
              </li>
              <li className="nav-item">
                <button className="nav-link text-white"  onClick={async()=>{
                  setProducts([])
                  await fetch("https://marketplace-1-b3203472.deta.app/search/featured").then(x=>x.json()).then(x=>{setProducts(x)})
                }}>
                  Featured
                </button>
              </li>
              <li className="nav-item">
                <Link to="/add_product" className="nav-link text-white" >
                  Add Product
                </Link>
              </li>
              <li className="nav-item">
                <Link to="/update_product" className="nav-link text-white" >
                  Update Product
                </Link>
              </li>
            </ul>
            <form className="d-flex" role="search">
              <input
                className="form-control me-2"
                type="search"
                placeholder="Search"
                aria-label="Search"
                value={search}
                onChange={(e)=>{
                  setSearch(e.target.value);
                }}
              />
              <button className="btn btn-outline-success" style={{ color: 'white', borderColor: 'white' }} type="submit" onClick={async(e)=>{e.preventDefault();
                setProducts([]);
                await fetch("https://marketplace-1-b3203472.deta.app/search?skip=0&limit=10&query="+search).then(x=>x.json()).then(x=>{setProducts(x)})
              }}>
                Search
              </button>
            </form>
          </div>
        </div>
      </nav>
    );
  }
  