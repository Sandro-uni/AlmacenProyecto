import './main.css';
import { BrowserRouter, Navigate, Route, Routes } from 'react-router-dom';

import { VentanaBase } from './Components/VentanaBase/VentanaBase';
import {Login} from './Components/Login';

function App() {
  return (
      <BrowserRouter>
        <Routes>
          <Route path="/" element={<Navigate to="/login" />} />
          <Route path="/login" element={<Login/>} />
          <Route path="/Principal/:idrl" element={<VentanaBase />} />
        </Routes>
        
      </BrowserRouter>
  );
}

export default App;