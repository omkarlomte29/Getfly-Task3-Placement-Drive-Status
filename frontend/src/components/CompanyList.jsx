/* eslint-disable no-unused-vars */
import React, { useEffect, useState } from "react";
import CompanyNameDropdown from "./CompanyNameDropdown";
import YearDropdown from "./YearDropdown";
import TimesVisitedDropdown from "./TimesVisitedDropdown";
import { useNavigate } from "react-router-dom";
import axios from "axios";

const CompanyList = () => {
  const navigate = useNavigate();
  const [companies, setCompanies] = useState([]);
  const [selectedCompany, setSelectedCompany] = useState("");
  const [selectedYear, setSelectedYear] = useState("");
  const [selectedTimesVisited, setSelectedTimesVisited] = useState("");
  const [filteredCompanies, setFilteredCompanies] = useState([]);

  useEffect(() => {
    fetchFilter();
  }, []);

  const fetchFilter = () => {
    axios.get('http://localhost:8081/drivestatus/getselectedcomp')
        .then(res => {
          setCompanies(res.data);
          setFilteredCompanies(res.data); // Initialize filteredCompanies with all companies
        })
        .catch(err => {
          console.error('Error fetching companies:', err);
        });
  };

  const handleCompanyChange = (event) => {
    setSelectedCompany(event.target.value);
  };

  const handleYearChange = (event) => {
    setSelectedYear(event.target.value);
  };

  const handleTimesVisitedChange = (event) => {
    setSelectedTimesVisited(event.target.value);
  };

  const handleClearFilters = () => {
    setSelectedCompany("");
    setSelectedYear("");
    setSelectedTimesVisited("");
    setFilteredCompanies(companies); // Reset filteredCompanies to all companies
  };

  const handleSearch = () => {
    const filtered = companies.filter((company) => {
      const matchesCompany = !selectedCompany || company.name === selectedCompany;
      const matchesYear = !selectedYear || company.academic_year.toString() === selectedYear;
      const matchesVisited = !selectedTimesVisited || company.visited.toString() === selectedTimesVisited;

      return matchesCompany && matchesYear && matchesVisited;
    });

    setFilteredCompanies(filtered);
  };

  const handleShowStudents = (company) => {
    navigate(
      `/students?id=${encodeURIComponent(company.id)}&company=${encodeURIComponent(company.name)}&year=${company.academic_year}&timesVisited=${company.visited}`,
      { state: { id: company.id } }
    );
  };

  return (
    <div className="">
      <div className="flex flex-wrap w-full md:gap-10 sm:gap-6">
        <CompanyNameDropdown selectedCompany={selectedCompany} handleCompanyChange={handleCompanyChange} />
        <YearDropdown selectedYear={selectedYear} handleYearChange={handleYearChange} />
        <TimesVisitedDropdown selectedTimesVisited={selectedTimesVisited} handleTimesVisitedChange={handleTimesVisitedChange} />
        <button onClick={handleSearch} className="ml-4 mt-6 h-12 p-2 align-center justify-center bg-blue-500 text-white rounded-md shadow-sm hover:bg-blue-600">
          Search
        </button>
        <button onClick={handleClearFilters} className="mt-6 h-12 p-2 align-center justify-center bg-blue-500 text-white rounded-md shadow-sm hover:bg-blue-600">
          Clear Filters
        </button>
      </div>
      
      <div className="overflow-x-auto">
        <table className="min-w-full bg-white">
          <thead>
            <tr className="bg-gray-100 text-gray-600 uppercase text-sm leading-normal">
              <th className="py-3 px-6 text-left">Company Name</th>
              <th className="py-3 px-6 text-left">Year</th>
              <th className="py-3 px-6 text-left">Times Visited</th>
              <th className="py-3 px-6 text-left">Actions</th>
            </tr>
          </thead>
          <tbody className="text-gray-600 text-sm font-light">
            {filteredCompanies.map((company) => (
              <tr key={company.id}>
                <td className="py-3 px-6 text-left whitespace-nowrap">
                  {company.name}
                </td>
                <td className="py-3 px-6 text-left whitespace-nowrap">
                  {company.academic_year}
                </td>
                <td className="py-3 px-6 text-left whitespace-nowrap">
                  {company.visited}
                </td>
                <td className="py-3 px-6 text-left whitespace-nowrap">
                  <button
                    className="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded"
                    onClick={() => handleShowStudents(company)}
                  >
                    Show Registered Students
                  </button>
                </td>
              </tr>
            ))}
          </tbody>
        </table>
      </div>
    </div>
  );
};

export default CompanyList;