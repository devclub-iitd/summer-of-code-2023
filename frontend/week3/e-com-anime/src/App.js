import logo from './logo.svg';
import './App.css';
import { BrowserRouter as Router, Switch, Route } from "react-router-dom";
import Header from "./components/Header";
import Carousel from "./components/Carousel";
import WhatWeDo from "./components/WhatWeDo";
import HowItWorks from "./components/HowItWorks";
import Reviews from "./components/Reviews";
import Footer from "./components/Footer";
import ContactUs from "./components/ContactUs";

function App() {
  return (
    <>
    <Router>
      <div className="App">
        <Header />
        <Switch>
          <Route exact path="/">
            <Carousel />
            <WhatWeDo />
            <HowItWorks />
            <Reviews />
          </Route>
          <Route path="/contact-us"> {/* Add a route for the Contact Us page */}
            <ContactUs />
          </Route>
        </Switch>
        <Footer />
      </div>
    </Router>
    </>
  );
}

export default App;