import { BrowserRouter, Route, Routes } from "react-router-dom";
import Reachus from "./KnowUS/reachus";
import MainPageRouter from "./MainPage/mainpagerouter";


function App() {
  return (
    <BrowserRouter>
      <Routes>
        <Route path="/*" element={<MainPageRouter/>}/>
        <Route path="/reachus/*" element={<Reachus />} />
      </Routes>
    </BrowserRouter>
  );
}

export default App;