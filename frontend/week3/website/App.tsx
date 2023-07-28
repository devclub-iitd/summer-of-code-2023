import React,{Component} from 'react'
import {  
  BrowserRouter as Router,  
  Routes,  
  Route,  
  Link  
}   
from 'react-router-dom';  
import Navbar from "./Navbar";
import Footer from "./Footer";
import Home from './Home/Home';
import Verify from './Verify/Verify';
import Learn from './Home/LearnMore';
import Register from './Home/Register';
import AboutUs from './AboutUs/AboutUs';
import ContactUs from './ContactUs/ContactUs';
import Login from './Home/LoginRegiser';

class App extends Component {
  render() {
    return (
      <Router>
        <div><Navbar /></div>
        <Routes>
          <Route path='/' element={< Home />}></Route>  
          <Route path='/Login' element={<Login />}></Route>
          <Route path='/Register' element={<Register />}></Route>
          <Route path='/ShoppingPlatform' element={<Learn />}></Route>
          <Route path='/AboutUs' element={< AboutUs />}></Route>  
          <Route path='/ContactUs' element={< ContactUs />}></Route>  
          <Route path='/Verify' element={<Verify />}></Route>
        </Routes>
      <div><Footer/></div>
      </Router>
    );
  }
}

export default App;
