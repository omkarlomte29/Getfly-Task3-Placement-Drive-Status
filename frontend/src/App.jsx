// eslint-disable-next-line no-unused-vars
import React from "react";
import { BrowserRouter as Router, Route, Routes } from "react-router-dom";
import CompanyList from "./components/CompanyList";
import StudentsList from "./components/pages/StudentsList";
import StudentsForRoundTwo from "./components/pages/StudentsForRoundTwo";
import StudentsForRoundThree from "./components/pages/StudentsForRoundThree";
import StudentsForRoundFour from "./components/pages/StudentsForRoundFour"; // Import the new component
import PlacedStudents from "./components/pages/PlacedStudents";

const App = () => {
  return (
    <Router>
      <div className="container mx-auto p-4">
        <h1 className="text-2xl font-bold mb-4 ">Company Information</h1>
        <Routes>
          <Route path="/" element={<CompanyList />} />
          <Route path="/students" element={<StudentsList />} />
          <Route
            path="/students-for-round-two"
            element={<StudentsForRoundTwo />}
          />
          <Route
            path="/students-for-round-three"
            element={<StudentsForRoundThree />}
          />
          <Route
            path="/students-for-round-four"
            element={<StudentsForRoundFour />}
          />
          <Route
            path="/placedStudents"
            element={<PlacedStudents />}
          />
          {/* Add new route */}
        </Routes>
      </div>
    </Router>
  );
};

export default App;
