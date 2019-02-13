class Token
  def self.build
    payload = { expiration: Time.now + 10.days }

    jwt = JWT.encode payload, Rails.application.secrets.secret_key_base, 'HS256'
    Token.new jwt
  end

  def initialize jwt
    @jwt = jwt
    @data = decode_token @jwt
  end

  def valid?
    @valid ||= @data.present? && @data['expiration'].to_time >= Time.now
  end

  def to_jwt() @jwt end

  private

  def decode_token jwt
    JWT.decode(jwt, Rails.application.secrets.secret_key_base, 'HS256').first
  rescue JWT::DecodeError
    nil
  end
end
