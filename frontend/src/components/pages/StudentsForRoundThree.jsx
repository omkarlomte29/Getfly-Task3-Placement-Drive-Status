/* eslint-disable no-unused-vars */
import React, { useEffect, useState } from "react";
import { Link, useNavigate } from "react-router-dom";
import axios from 'axios';

const StudentsForRoundThree = () => {
  const [roundThreeStudents, setRoundThreeStudents] = useState([]);
  const [selectedStudentIds, setSelectedStudentIds] = useState([]);
  const [roundFourStudentIds, setRoundFourStudentIds] = useState([]);
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
  // Fetch data from the database 'drive_status.studentslist'
  useEffect(() => {
    extractCompanyIdFromUrl();
    fetchRoundThreeStudents(companyId);
    fetchRoundFourStudentIds(companyId);
    fetchPlacedStudentIds(companyId);
  }, [companyId]);

  //fetching students of round3
  const fetchRoundThreeStudents = (companyId) => {
    axios.get(`http://localhost:8081/drivestatus/getround3students/${companyId}`)
      .then(res => {
        setRoundThreeStudents(res.data);
      })
      .catch(err => {
        console.error('Error fetching round three students:', err);
      });
  };

  //fetching ids of round4
  const fetchRoundFourStudentIds = (companyId) => {
    axios.get(`http://localhost:8081/drivestatus/getround4ids/${companyId}`)
      .then(res => {
        const round4Ids = res.data.map(item => item.driveid);
        setRoundFourStudentIds(round4Ids);
      })
      .catch(err => {
        console.error('Error fetching round four student IDs:', err);
      });
  };

  //fetching ids of placed students
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

  const handleAddStudentsToRoundFour = () => {
    const newRoundFourStudentIds = [...roundFourStudentIds, ...selectedStudentIds];
    setRoundFourStudentIds(newRoundFourStudentIds);

    // Update the backend to move students to round four
    selectedStudentIds.forEach(studentId => {
      axios.put(`http://localhost:8081/drivestatus/updatetooneround/${studentId}`, { round: 4 })
        .then(res => {
          console.log(`Student ${studentId} moved to round four.`);
          fetchRoundThreeStudents(companyId);
        })
        .catch(err => {
          console.error(`Error updating student ${studentId} to round four:`, err);
        });
    });
    setSelectedStudentIds([]);
  };

  const handleAddStudentsToPlaced = (studentId) => {
    // Update the backend to move students to round four
    axios.put(`http://localhost:8081/drivestatus/addtoplaced/${studentId}`)
    .then(res => {
      setPlacedStudentIds(placedStudentIds.filter(student => student.id !== studentId));
      console.log(`Student ${studentId} moved to placed.`);
      fetchRoundThreeStudents(companyId);
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
        fetchRoundThreeStudents(companyId);
        fetchPlacedStudentIds(companyId);
      })
      .catch(err => {
        console.error(`Error moving student ${studentId} back to round one:`, err);
      });
  };

  const handleDeleteStudent = (studentId) => {
    axios.put(`http://localhost:8081/drivestatus/updatetooneround/${studentId}`, { round: 2 })
      .then(res => {
        setRoundThreeStudents(roundThreeStudents.filter(student => student.driveid !== studentId));
        console.log(`Student ${studentId} reverted to round two.`);
      })
      .catch(err => {
        console.error(`Error updating student ${studentId} to round two:`, err);
      });
  };

  const handleViewPlaced = () => {
    navigate(`/placedStudents?companyId=${companyId}`);
  }

  const handleGoBack = () => {
    navigate(`/students-for-round-two?companyId=${companyId}`);
  };

  return (
    <div className="container mx-auto p-4">
      <div className="flex justify-between items-center mb-4 flex flex-wrap">
        <h1 className="text-2xl font-bold">Round Three Students</h1>
        <div>
          <Link
            to={`/students-for-round-four?companyId=${companyId}`}
            className="bg-blue-500 text-white py-2 px-4 ml-4 mb-4 rounded hover:bg-blue-600 focus:outline-none focus:ring-2 focus:ring-green-500 inline-block"
          >
             View Round Four Students
          </Link>
          <button
            onClick={handleAddStudentsToRoundFour}
            className="bg-red-400 text-white py-2 px-4 ml-4 mb-4 rounded hover:bg-red-500 focus:outline-none focus:ring-2 focus:ring-red-400 inline-block"
          >
            Add Students for Round Four
          </button>
          <button
            onClick={handleGoBack}
            className="bg-gray-500 text-white py-2 px-4 ml-4 mb-4 rounded hover:bg-gray-600 focus:outline-none focus:ring-2 focus:ring-gray-500"
          >
            View Round Two Students
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
              <th className="py-3 px-6 text-center  ">Select for Round Four</th>
              <th className="py-3 px-6 text-left">Actions</th>
            </tr>
          </thead>
          <tbody className="text-gray-600 text-sm font-light">
            {roundThreeStudents.map((student, i) => (
              <tr key={student.driveid}>
                <td className="py-3 px-6 text-left whitespace-nowrap">
                  {i+1}
                </td>
                <td className="py-3 px-6 text-left whitespace-nowrap">
                  {student.tpo_id}
                </td>
                <td className="py-3 px-6 text-left whitespace-nowrap">
                  {student.full_name}
                </td>
                <td className="py-3 px-6 text-left whitespace-nowrap">
                  {student.clg_id}
                </td>
                <td className="py-3 px-6 text-left whitespace-nowrap">
                  {student.branch}
                </td>
                <td className="py-3 px-6 text-left whitespace-nowrap">
                  {student.mobile}
                </td>
                <td className="py-3 px-6 text-center whitespace-nowrap">
                  {roundFourStudentIds.includes(student.driveid) ? (
                    <span className="text-green-600 font-semibold">Added to Round Four</span>
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
                <td className="py-3 px-6 text-center whitespace-nowrap">
                  {roundFourStudentIds.includes(student.driveid) ? (
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

export default StudentsForRoundThree;
