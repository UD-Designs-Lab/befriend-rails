module Helpers::DbHelper
  def generate_token(column, klass)
    loop do
      self[column] = SecureRandom.urlsafe_base64
      break unless klass.exists?(column => self[column])
    end
  end
end
