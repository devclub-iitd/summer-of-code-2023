import { Route, Routes } from "react-router";
import NavBar from "./nav_bar";
import { BrowserRouter } from "react-router-dom";
import Home from "./Home/Home";
import Contact_Us from "./Contact Us/Contact_Us";
import About_Us from "./About_Us/About_Us";
import Footer from "./footer";

function App() {
  return (<div style={{ width: '100vw' }}>
    <BrowserRouter>
      <NavBar />
      <Routes>
        <Route path="/" element={<Home />} />
        <Route path="/contactus" element={<Contact_Us />} />
        <Route path="/about" element={<About_Us />} />
      </Routes>
      <Footer/>
    </BrowserRouter></div>
  );
}

export default App;