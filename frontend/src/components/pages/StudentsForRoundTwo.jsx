/* eslint-disable no-unused-vars */
import React, { useEffect, useState } from "react";
import { Link, useNavigate } from "react-router-dom";
import axios from 'axios';

const StudentsForRoundTwo = () => {
  const [roundTwoStudents, setRoundTwoStudents] = useState([]);
  const [selectedStudentIds, setSelectedStudentIds] = useState([]);
  const [roundThreeStudentIds, setRoundThreeStudentIds] = useState([]);
  const [placedStudentIds, setPlacedStudentIds] = useState([]);
  const navigate = useNavigate();


  
  const extractCompanyIdFromUrl = () => {
    // Get current URL
    const currentUrl = window.location.href;
    
    // Parse URL and get search params
    const searchParams = new URLSearchParams(new URL(currentUrl).search);
    
    // Get the value of the 'id' parameter
    const companyId = searchParams.get('companyId');
    
    return companyId;
  };
  const companyId = extractCompanyIdFromUrl();
  // Fetch round 2 students and round 3 student IDs
  useEffect(() => {
    extractCompanyIdFromUrl();
    fetchRoundTwoStudents(companyId);
    fetchRoundThreeStudentIds(companyId);
    fetchPlacedStudentIds(companyId);
  }, [companyId]);

  //fetching round2 students
  const fetchRoundTwoStudents = (companyId) => {
    axios.get(`http://localhost:8081/drivestatus/getround2students/${companyId}`)
      .then(res => {
        console.log(res.data)
        setRoundTwoStudents(res.data);
      })
      .catch(err => {
        console.error('Error fetching round 2 students:', err);
      });
  };
 
  //fetching round3 ids
  const fetchRoundThreeStudentIds = (companyId) => {
    axios.get(`http://localhost:8081/drivestatus/getround3ids/${companyId}`)
      .then(res => {
        const roundThreeIds = res.data.map(item => item.driveid);
        setRoundThreeStudentIds(roundThreeIds);
      })
      .catch(err => {
        console.error('Error fetching round 3 student IDs:', err);
      });
  };

  //fetching placed student ids
  const fetchPlacedStudentIds = (companyId) => {
    axios.get(`http://localhost:8081/drivestatus/getplacedids/${companyId}`)
      .then(res => {
        const ids = res.data.map(item => item.driveid);
        setPlacedStudentIds(ids);
      })
      .catch(err => {
        console.error('Error fetching placed student IDs:', err);
      });
  };

  const handleCheckboxChange = (studentId) => {
    if (selectedStudentIds.includes(studentId)) {
      setSelectedStudentIds(selectedStudentIds.filter(id => id !== studentId));
    } else {
      setSelectedStudentIds([...selectedStudentIds, studentId]);
    }
  };

  //adding selected students to round3
  const handleAddStudentsToRoundThree = () => {
    const newRoundThreeStudentIds = [...roundThreeStudentIds, ...selectedStudentIds];
    setRoundThreeStudentIds(newRoundThreeStudentIds);

    // Update the backend to move students to round three
    selectedStudentIds.forEach(studentId => {
      axios.put(`http://localhost:8081/drivestatus/updatetooneround/${studentId}`, { round: 3 })
        .then(res => {
          console.log(`Student ${studentId} moved to round three.`);
          fetchRoundTwoStudents(companyId);
        })
        .catch(err => { 
          console.error(`Error updating student ${studentId} to round three:`, err);
        });
    });
    setSelectedStudentIds([]);
  };

  const handleAddStudentsToPlaced = (studentId) => {
      // Update the backend to move students to round four
      axios.put(`http://localhost:8081/drivestatus/addtoplaced/${studentId}`)
      .then(res => {
        setPlacedStudentIds(placedStudentIds.filter(student => student.driveid !== studentId));
        console.log(`Student ${studentId} moved to placed.`);
        fetchRoundTwoStudents(companyId);
        fetchPlacedStudentIds(companyId);

      })
      .catch(err => {
        console.error(`Error moving student ${studentId} back to round one:`, err);
      });
    setSelectedStudentIds([]);
  };

  const handleDeleteFromPlaced = (studentId) => {
    axios.put(`http://localhost:8081/drivestatus/deletefromplaced/${studentId}`)
      .then(res => {
        setPlacedStudentIds(placedStudentIds.filter(student => student.driveid !== studentId));
        console.log(`Student ${studentId} moved back to round one.`);
        fetchRoundTwoStudents(companyId);
        fetchPlacedStudentIds(companyId);
      })
      .catch(err => {
        console.error(`Error moving student ${studentId} back to round one:`, err);
      });
  };

  const handleDeleteStudent = (studentId) => {
    axios.put(`http://localhost:8081/drivestatus/updatetooneround/${studentId}`, { round: 1 })
      .then(res => {
        setRoundTwoStudents(roundTwoStudents.filter(student => student.driveid !== studentId));
        console.log(`Student ${studentId} moved back to round one.`);
        // fetchPlacedStudentIds();
        // fetchRoundTwoStudents();
        // fetchRoundTwoStudents();
      })
      .catch(err => {
        console.error(`Error moving student ${studentId} back to round one:`, err);
      });
  };

  const handleViewPlaced = () => {
    navigate(`/placedStudents?&companyId=${companyId}`);
  }

  const handleGoBack = () => {
    navigate(`/students?&id=${companyId}`);
  };

  return (
    <div className="container mx-auto p-4">
      <div className="flex justify-between items-center mb-4 flex flex-wrap">
        <h1 className="text-2xl font-bold">Round Two Students</h1>
        <div>
          <Link
            to={`/students-for-round-three?companyId=${companyId}`}
            className="bg-blue-500 text-white py-2 px-4 ml-4 mb-4 rounded hover:bg-blue-600 focus:outline-none focus:ring-2 focus:ring-blue-500"
          >
            View Round Three Students
          </Link>
          <button
            onClick={handleAddStudentsToRoundThree}
            className="bg-red-400 text-white py-2 px-4 ml-4 mb-4 rounded hover:bg-red-500 focus:outline-none focus:ring-2 focus:ring-red-400"
          >
            Add Students for Round Three
          </button>
          <button
            onClick={handleGoBack}
            className="bg-gray-500 text-white py-2 px-4 ml-4 mb-4 rounded hover:bg-gray-600 focus:outline-none focus:ring-2 focus:ring-gray-500"
          >
            Go Back to Registered Students
          </button>
        </div>
      </div>

      <div className="overflow-x-auto">
        <table className="min-w-full bg-white">
          <thead>
            <tr className="bg-gray-100 text-gray-600 uppercase text-sm leading-normal">
              <th className="py-3 px-6 text-left">Sr. No.</th>
              <th className="py-3 px-6 text-left">TPO ID</th>
              <th className="py-3 px-6 text-left">Student Name</th>
              <th className="py-3 px-6 text-left">College ID</th>
              <th className="py-3 px-6 text-left">Branch</th>
              <th className="py-3 px-6 text-left">Mobile</th>
              <th className="py-3 px-6 text-center">Select For Round Three</th>
              <th className="py-3 px-6 text-left">Actions</th>
            </tr>
          </thead>
          <tbody className="text-gray-600 text-sm font-light">
            {roundTwoStudents.map((student, i) => (
              <tr key={student.driveid}>
                <td className="py-3 px-6 text-left whitespace-nowrap">{i + 1}</td>
                <td className="py-3 px-6 text-left whitespace-nowrap">{student.tpo_id}</td>
                <td className="py-3 px-6 text-left whitespace-nowrap">{student.full_name}</td>
                <td className="py-3 px-6 text-left whitespace-nowrap">{student.clg_id}</td>
                <td className="py-3 px-6 text-left whitespace-nowrap">{student.branch}</td>
                <td className="py-3 px-6 text-left whitespace-nowrap">{student.mobile}</td>
                <td className="py-3 px-8 text-center whitespace-nowrap">
                  {roundThreeStudentIds.includes(student.driveid) ? (
                    <span className="text-green-600 font-semibold">Added to Round Three</span>
                  ) : placedStudentIds.includes(student.driveid) ? (
                    <span className="text-blue-600 font-semibold">
                      Added to Placed
                    </span>
                  ) : (
                    <input
                      type="checkbox" 
                      checked={selectedStudentIds.includes(student.driveid)}
                      onChange={() => handleCheckboxChange(student.driveid)}
                    />
                  )}
                </td>
                <td className="py-3 px-6 text-left whitespace-nowrap">
                  {roundThreeStudentIds.includes(student.driveid) ? (
                    <button
                      onClick={() => handleDeleteStudent(student.driveid)}
                      className="bg-red-400 text-white py-1 px-2 rounded hover:bg-red-500 focus:outline-none focus:ring-2 focus:ring-red-400"
                    >
                      Delete
                    </button>
                  ) : placedStudentIds.includes(student.driveid) ? (
                    <React.Fragment>
                    <button
                      onClick={() => handleDeleteFromPlaced(student.driveid)}
                      className="bg-red-400 text-white py-1 px-2 rounded hover:bg-red-500 focus:outline-none focus:ring-2 focus:ring-red-400"
                    >
                      Remove from Placed
                    </button>
                    <button
                      onClick={() => handleViewPlaced(student.driveid)}
                      className="bg-blue-400 text-white py-1 px-3 ml-1 mb-1 rounded hover:bg-blue-500 focus:outline-none focus:ring-2 focus:ring-blue-400"
                    >
                      View Placed
                    </button>
                    </React.Fragment>
                  ) : (
                    <React.Fragment>
                      <button
                        onClick={() => handleAddStudentsToPlaced(student.driveid)}
                        className="bg-green-400 text-white py-1 px-2 rounded hover:bg-green-500 focus:outline-none focus:ring-2 focus:ring-green-400"
                      >
                        Add to Placed
                      </button>
                      <button
                        onClick={() => handleDeleteStudent(student.driveid)}
                        className="bg-red-400 text-white py-1 px-2 rounded hover:bg-red-500 focus:outline-none focus:ring-2 focus:ring-red-400 ml-2"
                      >
                        Delete
                      </button>
                    </React.Fragment>
                  )}
                </td>
              </tr>
            ))}
          </tbody>
        </table>
      </div>
    </div>
  );
};

export default StudentsForRoundTwo;
