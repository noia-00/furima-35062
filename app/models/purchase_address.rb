class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture, :city, :address_line_1, :address_line_2, :phone_number, :purchase, :user_id, :item_id

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
    validates :prefecture, numericality: {other_than: 1}
    validates :city
    validates :address_line_1
    validates :phone_number, format: {with: /\A\d{,11}\z/}
  end

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture: prefecture, city: city, address_line_1: address_line_1, address_line_2: address_line_2, phone_number: phone_number, purchase_id: purchase.id)
  end

end 