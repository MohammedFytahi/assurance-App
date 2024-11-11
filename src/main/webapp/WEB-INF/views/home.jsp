<!-- /WEB-INF/views/home.jsp -->
<!DOCTYPE html>
<html lang="fr">
<head>
    <title>Accueil - Choix du Type d'Assurance</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
</head>
<body class="bg-gray-100">
<div class="container mx-auto px-4 py-8">
    <h2 class="text-3xl font-bold text-center text-gray-800 mb-8">Choisissez votre type d'assurance</h2>

    <div class="grid grid-cols-1 md:grid-cols-3 gap-8">
        <!-- Carte pour l'Assurance Automobile -->
        <div class="bg-white rounded-lg shadow-lg overflow-hidden transform transition duration-300 hover:scale-105">
            <img src="https://img-4.linternaute.com/JpFhmYdrX5SU-sHaq7FN-fdunN8=/1500x/smart/0ab273536fee4e74b6948ad52bbdad2f/ccmcms-linternaute/25016915.jpg" alt="Assurance Automobile" class="w-full h-48 object-cover">
            <div class="p-6">
                <h3 class="text-xl font-semibold text-gray-800 mb-2">Assurance Automobile</h3>
                <p class="text-gray-600 mb-4">Protégez votre véhicule avec une assurance auto adaptée.</p>
                <a href="/devis/auto" class="inline-block px-4 py-2 text-white bg-blue-600 rounded hover:bg-blue-700">Choisir</a>
            </div>
        </div>

        <!-- Carte pour l'Assurance Habitation -->
        <div class="bg-white rounded-lg shadow-lg overflow-hidden transform transition duration-300 hover:scale-105">
            <img src="https://www.selexium.com/app/uploads/2022/01/choisir-assurance-habitation.jpg" alt="Assurance Habitation" class="w-full h-48 object-cover">
            <div class="p-6">
                <h3 class="text-xl font-semibold text-gray-800 mb-2">Assurance Habitation</h3>
                <p class="text-gray-600 mb-4">Sécurisez votre domicile avec une couverture habitation.</p>
                <a href="${pageContext.request.contextPath}/home-insurance/form" class="inline-block px-4 py-2 text-white bg-blue-600 rounded hover:bg-blue-700">Choisir</a>
            </div>
        </div>

        <!-- Carte pour l'Assurance Santé -->
        <div class="bg-white rounded-lg shadow-lg overflow-hidden transform transition duration-300 hover:scale-105">
            <img src="https://www.fos-agri.ma/assets/img/pms/AMC%202.jpg" alt="Assurance Santé" class="w-full h-48 object-cover">
            <div class="p-6">
                <h3 class="text-xl font-semibold text-gray-800 mb-2">Assurance Santé</h3>
                <p class="text-gray-600 mb-4">Assurez-vous une couverture santé complète.</p>
                <a href="/devis/sante" class="inline-block px-4 py-2 text-white bg-blue-600 rounded hover:bg-blue-700">Choisir</a>
            </div>
        </div>
    </div>

    <!-- Logout Button -->
    <div class="text-center mt-8">
        <form action="${pageContext.request.contextPath}/logout" method="post">
            <button type="submit" class="px-4 py-2 text-white bg-red-600 rounded hover:bg-red-700">
                Se Déconnecter
            </button>
        </form>
    </div>
</div>
</body>
</html>
