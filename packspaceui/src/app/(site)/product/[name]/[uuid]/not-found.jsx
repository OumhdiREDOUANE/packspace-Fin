export default function NotFound() {
  return (
    <div className="min-h-screen flex flex-col items-center justify-center bg-gray-100 p-6">
      <h1 className="text-4xl font-bold text-red-600 mb-4">Erreur 404</h1>
      <p className="text-lg text-gray-700 mb-6">
        Malheureusement, la page que vous recherchez n'est pas disponible.
      </p>

      <a
        href="/"
        className="px-6 py-3 bg-blue-600 text-white rounded-lg hover:bg-blue-700 transition"
      >
        Retour à l'accueil
      </a>
    </div>
  );
}
