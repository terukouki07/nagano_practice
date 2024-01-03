class Order < ApplicationRecord
  belongs_to :customer
  has_many :items

  #支払い方法
  enum payment_method: { credit_card: 0, transfer: 1 }

  #注文ステータス
  # 入金待ち0, 入金確認1, 製作中2, 発送準備中3, 発送済み4
  enum status: { wait_payment: 0, confirm_payment: 1, making: 2, preparing_delivery: 3, delivered: 4 }

  def address_display
    ' 〒 ' + postal_code + ' ' + address + ' ' + name
  end
end
