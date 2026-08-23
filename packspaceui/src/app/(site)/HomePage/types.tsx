export interface Category {
  id: number | string;
  name: string;
  slug: string;
  img: string;
}

export interface Product {
  id: number | string;
  title: string;
  desc: string;
  img: string;
  price: number | string;
}

export interface HomeProps {
  categories: Category[];
  products: Product[];
}