require 'csv'

CSV.generate(encoding: Encoding::SJIS, row_sep: "\r\n", force_quotes: true) do |csv|
  column_names = %w(商品名 販売数量 売上価格 販売日時 購買者)
  csv << column_names
  
  @sales.each do |sale|
    item = Item.find(sale.item_id)
    vendor = Company.find(sale.company_id)
    column_values = [
      item.name,
      sale.quantity,
      sale.price,
      sale.created_at.to_s(:ja),
      vendor.company_name
    ]
    csv << column_values
  end
end