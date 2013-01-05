class Bookmark < ActiveRecord::Base
  attr_accessible :name, :url, :description

  validates :name,     :presence =>  true, 
                       length:  { maximum: 50 }

  validates :url,	:presence => true,
                    length: { maximum: 128 }


  validates :description, length: { maximum: 512 }
end
