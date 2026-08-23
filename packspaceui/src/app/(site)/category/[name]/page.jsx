// app/category/page.tsx
import Link from 'next/link';
import Image from "next/image";
import { notFound } from "next/navigation";

async function fetchProductsByCategory(name) {
  const API_BASE_URL = process.env.NEXT_PUBLIC_API_URL || "http://127.0.0.1:8000";

  const res = await fetch(`${API_BASE_URL}/api/categories/${name}`, {
    next: { revalidate: 60 }
  });

  if (!res.ok) throw new Error('Failed to fetch products');

  const response = await res.json();
  return response.data || [];
}

export default async function CategoryPage({ params }) {
  const { name } = await params;

  // فك الترميز لإصلاح %20 و %C3%94 ... إلخ
  const decodedName = decodeURIComponent(name);

  // إصلاح العنوان
  const displayName =
    decodedName === "Hôtellerie / Restauration"
      ? "hôtellerie-restauration"
      : decodedName === "Tout produit" || decodedName === "tout produit"
      ? "Tout produit"
      : decodedName;

  let products = [];
  try {
    products = await fetchProductsByCategory(displayName);
  } catch (error) {
   
    notFound();
  }

  return (
    <div className="container mx-auto px-4 font-helveticaCondensed">
      {/* Banner */}
      <div className="mb-8">
        <Image
          src="/slide2.jpg"
          alt="Banner"
          width={1200}
          height={600}
          className="w-full h-auto object-cover"
          placeholder="blur"
          blurDataURL="/placeholder.jpg"
        />
      </div>

      {/* Title */}
      <h6 className="text-[#006294] text-2xl text-center font-semibold my-[36px] tracking-wide">
        {displayName}
      </h6>

      {/* Products */}
      {products.length === 0 ? (
        <p className="text-center text-gray-600">Aucun produit trouvé dans cette catégorie.</p>
      ) : (
        <div className="flex flex-wrap -mx-2">
          {products.map((prod) => {
            // صورة المنتج
            const productImage =
              displayName === "Tout produit"
                ? prod.main_image || '/placeholder.jpg'
                : prod.image_product?.[0]?.url_image || '/placeholder.jpg';

            return (
              <div key={prod.id_product} className="w-full sm:w-1/2 md:w-1/4 px-2 mb-6">
                <div className="flex flex-col h-full bg-white transition overflow-hidden">

                  {/* Product Image */}
                  <img
                    src={productImage}
                    alt={prod.name_product}
                    className="w-full h-[225px] object-cover"
                  />

                  {/* Title */}
                  <h3 className="text-center text-[#333] font-semibold text-lg py-6 px-2">
                    <Link
                      href={`/product/${encodeURIComponent(prod.name_product)}`}
                      className="hover:text-[#C09200] transition-colors duration-200"
                    >
                      {prod.name_product}
                    </Link>
                  </h3>

                  {/* Button */}
                  <div className="flex-1 flex flex-col justify-end px-4 pb-4">
                    <Link
                      href={`/product/${encodeURIComponent(prod.name_product)}`}
                      className="bg-[#006294] hover:bg-[#C09200] text-white text-center py-2 rounded-md font-semibold transition-colors duration-300"
                    >
                      Commander
                    </Link>
                  </div>

                </div>
              </div>
            );
          })}
        </div>
      )}
    </div>
  );
}
