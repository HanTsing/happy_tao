class Sort
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name

  has_many :deals, dependent: :destroy

end