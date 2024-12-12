<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Insurance Form</title>
  <style>
    /* General reset */
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
    }

    body {
      font-family: 'Roboto', sans-serif;
      background-color: #f4f7fc;
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
      color: #333;
    }

    /* Main container */
    .form-container {
      background-color: #fff;
      width: 100%;
      max-width: 600px;
      border-radius: 8px;
      box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
      padding: 30px;
    }

    h2 {
      font-size: 24px;
      text-align: center;
      margin-bottom: 20px;
      color: #333;
    }

    /* Input Fields */
    label {
      font-size: 14px;
      color: #555;
      margin-bottom: 8px;
      display: block;
    }

    input, select {
      width: 100%;
      padding: 12px 16px;
      margin-bottom: 16px;
      border: 1px solid #ddd;
      border-radius: 6px;
      font-size: 14px;
      background-color: #f9f9f9;
      transition: border-color 0.3s ease-in-out;
    }

    input:focus, select:focus {
      border-color: #5e81e2;
      outline: none;
      background-color: #ffffff;
    }

    .hidden {
      display: none;
    }

    /* Button */
    .submit-btn {
      background-color: #5e81e2;
      color: #fff;
      padding: 12px 24px;
      border-radius: 6px;
      font-size: 16px;
      cursor: pointer;
      border: none;
      width: 100%;
      transition: background-color 0.3s ease-in-out;
    }

    .submit-btn:hover {
      background-color: #506db4;
    }

    /* Sections for dynamic content */
    .insurance-section {
      margin-top: 30px;
    }

    .insurance-section h3 {
      font-size: 18px;
      color: #333;
      margin-bottom: 10px;
    }

    .insurance-section label {
      font-weight: bold;
      color: #444;
    }

  </style>
</head>
<body>

<div class="form-container">
  <h2>Insurance Request Form</h2>

  <form id="insuranceForm" method="post" onsubmit="updateFormAction()">
    <div class="mb-4">
      <label for="insuranceType">Insurance Type:</label>
      <select id="insuranceType" name="insuranceType" onchange="toggleInsuranceFields()">
        <option value="" disabled selected>Select Insurance Type</option>
        <option value="Home Insurance">Home Insurance</option>
        <option value="Car Insurance">Car Insurance</option>
        <option value="Health Insurance">Health Insurance</option>
      </select>
    </div>

    <div id="ageField" class="hidden">
      <label for="age">Age:</label>
      <input type="number" id="age" name="age" min="18" max="100" required />
    </div>

    <!-- Home Insurance Fields -->
    <div id="homeFields" class="hidden insurance-section">
      <h3>Home Insurance Details</h3>
      <label for="assetValue">Asset Value:</label>
      <input type="number" id="assetValue" name="assetValue" min="10000" />
      <label for="assetType">Asset Type:</label>
      <select id="assetType" name="assetType">
        <option value="apartment">Apartment</option>
        <option value="house">House</option>
      </select>
      <label for="localization">Localization:</label>
      <select id="localization" name="localization">
        <option value="ZoneArisque">Zone à risque</option>
        <option value="address">Other</option>
      </select>
      <label for="securitySystem">Security System:</label>
      <select id="securitySystem" name="securitySystem">
        <option value="Camera">Camera</option>
        <option value="SecuritySystem">Security System</option>
        <option value="">None</option>
      </select>
    </div>

    <!-- Car Insurance Fields -->
    <div id="carFields" class="hidden insurance-section">
      <h3>Car Insurance Details</h3>
      <label for="vehicleType">Vehicle Type:</label>
      <select id="vehicleType" name="vehicleType">
        <option value="lux">Luxury</option>
        <option value="normal">Normal</option>
      </select>
      <label for="vehicleUsing">Vehicle Usage:</label>
      <select id="vehicleUsing" name="vehicleUsing">
        <option value="private">Private</option>
        <option value="professional">Professional</option>
      </select>
      <label for="driverHistory">Driver History (last 3 years):</label>
      <select id="driverHistory" name="driverHistory">
        <option value="accidents">Accidents</option>
        <option value="infractions">Infractions</option>
        <option value="without">Without</option>
      </select>
    </div>

    <!-- Health Insurance Fields -->
    <div id="healthFields" class="hidden insurance-section">
      <h3>Health Insurance Details</h3>
      <label for="typeCoverage">Type of Coverage:</label>
      <select id="typeCoverage" name="typeCoverage">
        <option value="basic">Basic</option>
        <option value="premium">Premium</option>
      </select>
      <label for="healthStatus">Health Status:</label>
      <select id="healthStatus" name="healthStatus">
        <option value="medical">Medical History</option>
        <option value="antecedents">Past Medical Issues</option>
      </select>
    </div>

    <button type="submit" class="submit-btn">Submit Request</button>
  </form>
</div>

<script>
  function toggleInsuranceFields() {
    var insuranceType = document.getElementById("insuranceType").value;

    document.getElementById("homeFields").classList.add("hidden");
    document.getElementById("carFields").classList.add("hidden");
    document.getElementById("healthFields").classList.add("hidden");
    document.getElementById("ageField").classList.add("hidden");

    if (insuranceType === "Home Insurance") {
      document.getElementById("homeFields").classList.remove("hidden");
      document.getElementById("age").removeAttribute("required");
    } else if (insuranceType === "Car Insurance") {
      document.getElementById("carFields").classList.remove("hidden");
      document.getElementById("ageField").classList.remove("hidden");
      document.getElementById("age").setAttribute("required", "true");
    } else if (insuranceType === "Health Insurance") {
      document.getElementById("healthFields").classList.remove("hidden");
      document.getElementById("ageField").classList.remove("hidden");
      document.getElementById("age").setAttribute("required", "true");
    }
  }

  function updateFormAction() {
    var selectedInsurance = document.getElementById("insuranceType").value;
    var form = document.getElementById("insuranceForm");
    if (selectedInsurance === "Home Insurance") {
      form.action = "${pageContext.request.contextPath}/insurances/RequestedHomeInsurance";
    } else if (selectedInsurance === "Car Insurance") {
      form.action = "${pageContext.request.contextPath}/insurances/RequestedCarInsurance";
    } else if (selectedInsurance === "Health Insurance") {
      form.action = "${pageContext.request.contextPath}/insurances/RequestedHealthInsurance";
    }
  }
</script>

</body>
</html>
