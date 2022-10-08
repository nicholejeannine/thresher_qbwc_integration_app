module ErrorSerializer
  def self.serialize(object)
    object.errors.messages.map do |field, errors|
      errors.map do |error_message|
        {
            status: 422,
            detail: error_message
        }
      end
    end.flatten
  end
end