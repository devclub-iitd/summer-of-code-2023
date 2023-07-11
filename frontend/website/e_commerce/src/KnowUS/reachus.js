import { Route, Routes } from "react-router";
import NavBar from "./nav_bar";
import { BrowserRouter } from "react-router-dom";
import Home from "./Home/Home";
import Contact_Us from "./Contact Us/Contact_Us";
import About_Us from "./About Us/About_Us";
import Footer from "./footer";
export default function Reachus(){
    return(<>
      <NavBar />
      <Routes>
        <Route path="/" element={<Home />} />
        <Route exact path="/contactus" element={<Contact_Us />} />
        <Route exact path="/about" element={<About_Us />} />
      </Routes>
      <Footer/></>);
}