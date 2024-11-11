<!-- src/main/webapp/WEB-INF/views/homeInsuranceResult.jsp -->
<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="UTF-8">
  <title>Résultat du Devis Assurance Habitation</title>
  <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
</head>
<body class="bg-gray-100">

<div class="container mx-auto px-4 py-8">
  <h2 class="text-2xl font-bold text-gray-800 mb-6 text-center">Résultat du Devis</h2>
  <div class="bg-white p-6 rounded-lg shadow-md text-center">
    <p class="text-xl font-semibold text-gray-700">Montant du Devis : <span class="text-blue-600 font-bold">${quoteAmount} MAD</span></p>
    <a href="/home-insurance/form" class="mt-4 inline-block bg-blue-500 text-white font-bold py-2 px-4 rounded-lg hover:bg-blue-700">Calculer un autre devis</a>
  </div>
</div>

</body>
</html>
