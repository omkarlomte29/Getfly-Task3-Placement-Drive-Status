/* eslint-disable no-unused-vars */
import React, { useEffect, useState } from "react";
import { Link , useNavigate } from "react-router-dom";
import axios from 'axios';

const StudentsForRoundFour = () => {
  const [roundFourStudents, setRoundFourStudents] = useState([]);
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
  useEffect(() => {
    extractCompanyIdFromUrl();
    fetchRoundFourStudents(companyId);
    fetchPlacedStudentIds(companyId);
  }, [companyId]);

  const fetchRoundFourStudents = (companyId) => {
    axios.get(`http://localhost:8081/drivestatus/getround4students/${companyId}`)
      .then(res => {
        setRoundFourStudents(res.data);
      })
      .catch(err => {
        console.error('Error fetching students:', err); 
      });
  };

  const fetchPlacedStudentIds = (companyId) => {
    axios.get(`http://localhost:8081/drivestatus/getplacedids/${companyId}`)
      .then(res => {
        const placedIds = res.data.map(item => item.driveid);
        setPlacedStudentIds(placedIds);
        console.log(placedIds);
      })
      .catch(err => {
        console.error('Error fetching placed student IDs:', err);
      });
  };

  const handleAddStudentsToPlaced = (studentId) => {
    // Update the backend to move students to round four
    axios.put(`http://localhost:8081/drivestatus/addtoplaced/${studentId}`)
    .then(res => {
      console.log(`Student ${studentId} moved to placed.`);
      fetchRoundFourStudents(companyId);
      fetchPlacedStudentIds(companyId);
    })
    .catch(err => {
      console.error(`Error moving student ${studentId} back to round one:`, err);
      });
  };

  const handleGoBack = () => {
    navigate(`/students-for-round-three?companyId=${companyId}`);
  };

  const handleDeleteStudent = (studentId) => {
    axios.put(`http://localhost:8081/drivestatus/updatetooneround/${studentId}`, { round: 3 })
      .then(res => {
        setRoundFourStudents(roundFourStudents.filter(student => student.driveid !== studentId));
        console.log(`Student ${studentId} reverted to round three.`);
        fetchRoundFourStudents(companyId);
        fetchPlacedStudentIds(companyId);
      })
      .catch(err => {
        console.error(`Error updating student ${studentId} to round three:`, err);
      });
  };

  const handleDeleteFromPlaced = (studentId) => {
    axios.put(`http://localhost:8081/drivestatus/deletefromplaced/${studentId}`)
      .then(res => {
        setPlacedStudentIds(placedStudentIds.filter(student => student.driveid !== studentId));
        console.log(`Student ${studentId} moved back to round one.`);
        fetchRoundFourStudents(companyId);
        fetchPlacedStudentIds(companyId);
      })
      .catch(err => {
        console.error(`Error moving student ${studentId} back to round one:`, err);
      });
  };

  return (
    <div className="container mx-auto p-4">
      <div className="flex justify-between items-center mb-4 flex flex-wrap">
        <h1 className="text-2xl font-bold">Round Four Students</h1>
        <div>
          <Link
            to={`/placedStudents?companyId=${companyId}`}
            className="bg-blue-500 text-white py-2 px-4 ml-4 mb-4 rounded hover:bg-blue-600 focus:outline-none focus:ring-2 focus:ring-green-500 inline-block"
          >
            View Placed Students
          </Link>
          <button
            onClick={handleGoBack}
            className="bg-gray-500 text-white py-2 px-4 ml-4 mb-4 rounded hover:bg-gray-600 focus:outline-none focus:ring-2 focus:ring-gray-500"
          >
            Back To Round Three
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
              <th className="py-3 px-6 text-left">Actions</th>
            </tr>
          </thead>
          <tbody className="text-gray-600 text-sm font-light">
            {roundFourStudents.map((student, i) => (
              <tr key={student.driveid}>
                <td className="py-3 px-6 text-left whitespace-nowrap">
                  {i + 1}
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
                <td className="py-3 px-6 text-left whitespace-nowrap">
                  {placedStudentIds.includes(student.driveid) ? (
                    <button
                      onClick={() => handleDeleteFromPlaced (student.driveid)}
                      className="bg-red-400 text-white py-1 px-2 rounded hover:bg-red-500 focus:outline-none focus:ring-2 focus:ring-red-400"
                    >
                      Remove from Placed
                    </button>
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

export default StudentsForRoundFour;

