class Post < ApplicationRecord
	attr_accessor :content_type, :original_filename, :image_data
 	before_save :decode_base64_image


	has_attached_file :image, styles: { medium: "250x250>", thumb: "120x120>" }, default_url: "/images/:style/missing.png"
  	validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  	protected
    def decode_base64_image
      if image_data && content_type && original_filename
        decoded_data = Base64.decode64(image_data)

        data = StringIO.new(decoded_data)
        data.class_eval do
          attr_accessor :content_type, :original_filename
        end

        data.content_type = content_type
        data.original_filename = File.basename(original_filename)

        self.image = data
      end
    end
end
