/* eslint-disable no-unused-vars */
import React, { useEffect,useState } from "react";
import axios from "axios";
import PropTypes from 'prop-types';
const CompanyNameDropdown = ({ selectedCompany, handleCompanyChange }) => {

  const [companies, setCompanies] = useState([]);

  useEffect(() => {
    fetchCompanies();
  }, []);

  const fetchCompanies = () => {
    axios.get('http://localhost:8081/drivestatus/getcompany')
      .then(res => {
        setCompanies(res.data);
      })
      .catch(err => {
        console.error('Error fetching students:', err);
      });
  };

  return (
    <div className="mb-4">
      <label className="mb-2">
        <span className="text-gray-700">Filter by Company:</span>
        <select
          value={selectedCompany}
          onChange={handleCompanyChange}  
          className="block w-full mt-2 p-2 border border-gray-300 rounded-md shadow-sm"
        >
          <option value="">All</option>
          {companies.map((company) => (          
            <option key={company.id} value={company.name}>
              {company.name}
            </option>
          ))}
        </select>
      </label>
    </div>
  );
};

CompanyNameDropdown.propTypes = {
  selectedCompany: PropTypes.string.isRequired,
  handleCompanyChange: PropTypes.func.isRequired,
};

export default CompanyNameDropdown;