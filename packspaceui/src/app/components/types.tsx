export interface Proprietor {
  id_proprieter: string
  name_proprieter: string
  description_proprieter?: string
  product_count: number
  option_count: number
  total_options_owned: number
  filtered_by_product?: number
}