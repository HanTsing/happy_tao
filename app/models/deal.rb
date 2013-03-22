class Deal
  include Mongoid::Document
  include Mongoid::Timestamps
  field :title,   type: String
  field :price,   type: BigDecimal
  field :count,   type: Integer
  field :image,   type: String
  field :link,    type: String
  field :status,  type: Integer
  field :image_link, type: String
end
