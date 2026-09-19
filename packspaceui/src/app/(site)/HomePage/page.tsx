import Home from './FullPage'
import type { HomeProps } from './types'

export default async function FullPage() {
  const API_BASE_URL = process.env.NEXT_PUBLIC_API_URL || "http://127.0.0.1:8000"

  // جلب البيانات
  const resCategories = await fetch(`${API_BASE_URL}/api/categories`, { next: { revalidate: 60 } })
  const categoriesData = await resCategories.json()
  const categories = categoriesData.data.map((cat): HomeProps["categories"]=> ({
    id: cat.id_categorie,
    name: cat.name_categorie,
    slug: cat.name_categorie,
    img: cat.url,
  }))

  const resProducts = await fetch(`${API_BASE_URL}/api/product/topProducts`)
  const productsData = await resProducts.json()
  return <Home categories={categories} products={productsData} />
}

