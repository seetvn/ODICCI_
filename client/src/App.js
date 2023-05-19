import React, { useState } from 'react';

function MemberForm() {
  const [firstName, setFirstName] = useState('');
  const [lastName, setLastName] = useState('');
  const [phoneNumber, setPhoneNumber] = useState('');
  const [email, setEmail] = useState('');
  const [DateOfBirth,setDateOfBirth]=useState('');

  const validateForm = () => {

    // Validate first name and last name (alphabets only)
    const nameRegex = /^[A-Za-z]+(?:\s[A-Za-z]+)*$/;
    if (!nameRegex.test(firstName) || !nameRegex.test(lastName)) {
      alert('First name and last name can only contain alphabets.');
      return false;
    }

    // Validate phone number format (10 digits)
    const phoneRegex = /^\+44\d{10}$/;
    if (!phoneRegex.test(phoneNumber)) {
      alert('Phone number must be a 10-digit number, starting with +44 etc.');
      return false;
    }

    // Validate email domain
    const domainRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    if (!domainRegex.test(email)) {
      alert('Email must be a valid email address.');
      return false;
    }

    return true;
  };

  const handleSubmit = async (e) => {
    e.preventDefault();

    // Perform client-side validation
    if (!validateForm()) {
      return;
    }

    try {
      const response = await fetch('http://localhost:3000/members', { //may need to change port depending
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({
          member: {
            firstName,
            lastName,
            phoneNumber,
            email,
            DateOfBirth
          },
        }),
      });

      if (!response.ok) {
        throw new Error('Conflict: Email or Phone Number already exists');
      }

      // Clear the form fields
      setFirstName('');
      setLastName('');
      setPhoneNumber('');
      setEmail('');
      setDateOfBirth('');

      alert('Member information submitted successfully!');
    } catch (error) {
      console.error(error);
      window.alert(error);
      alert('An error occurred while submitting the form.');
    }
  };

  return (
    <form onSubmit={handleSubmit}>
      <label>
        First Name:
        <input
          type="text"
          value={firstName}
          placeholder="John"
          onChange={(e) => setFirstName(e.target.value)}
        />
      </label>
      <br />
      <label>
        Last Name:
        <input
          type="text"
          value={lastName}
          placeholder="Doe"
          onChange={(e) => setLastName(e.target.value)}
        />
      </label>
      <br />
      <label>
        Phone Number: 
        <input
          type="text"
          value={phoneNumber}
          placeholder="+447236704326"
          onChange={(e) => setPhoneNumber(e.target.value)}
        />
      </label>
      <br />
      <label>
        Email:
        <input
          type="email"
          value={email}
          placeholder="johndoe@example.com"
          onChange={(e) => setEmail(e.target.value)}
        />
      </label>
      <br />
      <label>
        Date of Birth:
        <input
          type="date"
          value={DateOfBirth}
          placeholder="01/02/2003"
          onChange={(e) => setDateOfBirth(e.target.value)}
        />
      </label>
      <br />
      <button type="submit">Submit</button>
    </form>
  );
}

export default MemberForm;
