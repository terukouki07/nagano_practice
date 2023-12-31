class Item < ApplicationRecord
  belongs_to :genre
  belongs_to :cart_item
  
  has_one_attached :image
  
  def get_image(width, height)
	  unless image.attached?
	    file_path = Rails.root.join('app/assets/images/sample-author1.jpg')
	    image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
	  end
		  image.variant(resize_to_limit: [width, height]).processed
  end
  
  def add_tax_price
    (self.price * 1.10).round
  end
end
