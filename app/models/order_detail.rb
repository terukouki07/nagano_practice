class OrderDetail < ApplicationRecord
  belongs_to :item
  belongs_to :order


  #制作ステータス
  #製作不可0, 製作待ち1, 製作中2, 製作終了3
  enum making_status: { impossible_manufacture:0, waiting_manufacture:1, manufacturing:2, finish:3 }
end
