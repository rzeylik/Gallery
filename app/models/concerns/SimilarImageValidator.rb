class SimilarImageValidator < ActiveModel::Validator
  def validate(record)
    if record.image? then
      @image = Image.find(record.image_id)
      @width = @image.image.width
      @max_width = @width + @width * 0.1
      @min_width = @width - @width * 0.1

      @height = @image.image.height
      @max_height = @height + @height * 0.1
      @min_height = @height - @height * 0.1

      @format = @image.image.content_type

      if (record.image.width > @max_width || record.image.width < @min_width) then
        record.errors.add(:image, "width must be between #{@min_width} and #{@max_width} but was #{record.image.width}")
      end

      if (record.image.height > @max_height || record.image.height < @min_height) then
        record.errors.add(:image, "width must be between #{@min_height} and #{@max_height} but was #{record.image.height}")
      end

      unless (record.image.content_type == @format) then
        record.errors.add(:image, "must be #{@format} but was #{record.image.content_type}")
      end
    else
      record.errors.add(:image, "can't be blank")
    end

  end
end
