<!-- src/main/webapp/WEB-INF/views/homeInsuranceForm.jsp -->
<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="UTF-8">
  <title>Formulaire Assurance Habitation</title>
  <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
</head>
<body class="bg-gray-100">

<div class="container mx-auto px-4 py-8">
  <h2 class="text-2xl font-bold text-gray-800 mb-6 text-center">Assurance Habitation</h2>

  <form action="${pageContext.request.contextPath}/home-insurance/calculate" method="post" class="bg-white p-6 rounded-lg shadow-md">
    <div class="mb-4">
      <label for="propertyValue" class="block text-gray-700 font-semibold">Valeur du bien (en MAD)</label>
      <input type="number" id="propertyValue" name="propertyValue" step="0.01" class="w-full px-4 py-2 border rounded-lg" required>
    </div>

    <div class="mb-4">
      <label for="propertyType" class="block text-gray-700 font-semibold">Type de bien</label>
      <select id="propertyType" name="propertyType" class="w-full px-4 py-2 border rounded-lg" required>
        <option value="appartement">Appartement</option>
        <option value="maison">Maison</option>
      </select>
    </div>

    <div class="mb-4">
      <label for="isInRiskZone" class="block text-gray-700 font-semibold">Zone à risque</label>
      <select id="isInRiskZone" name="isInRiskZone" class="w-full px-4 py-2 border rounded-lg">
        <option value="true">Oui</option>
        <option value="false">Non</option>
      </select>
    </div>

    <div class="mb-4">
      <label for="hasSecuritySystem" class="block text-gray-700 font-semibold">Système de sécurité</label>
      <select id="hasSecuritySystem" name="hasSecuritySystem" class="w-full px-4 py-2 border rounded-lg">
        <option value="true">Oui</option>
        <option value="false">Non</option>
      </select>
    </div>

    <div class="flex justify-center">
      <button type="submit" class="bg-blue-500 text-white font-bold py-2 px-4 rounded-lg hover:bg-blue-700">Calculer le devis</button>
    </div>
  </form>
</div>

</body>
</html>
