class Deal
  include Mongoid::Document
  include Mongoid::Timestamps
  field :title,   type: String
  field :price,   type: BigDecimal
  field :count,   type: Integer
  field :link,    type: String
  field :status,  type: Integer
  field :image_name, type: String
  field :image_link, type: String

  mount_uploader :image, ImageUploader

  before_save :save_image, :gen_default_name

  def save_image
    begin
      url = open(image_link)
      self.image = MiniMagick::Image.read(url)
    rescue => e
      Rails.logger.info "=====>#{self}::#{__method__} error: #{e.inspect}"
    end
  end

  def gen_default_name
    self.image_name = File.basename(image.filename, '.*').titleize if image
  end

end
