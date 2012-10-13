class Authentication < ActiveRecord::Base
  attr_accessible :uid

  belongs_to :user

  def self.create_with_omniauth(auth_hash)
    create! do |auth|
      auth.provider = auth_hash["provider"]
      auth.uid = auth_hash["uid"]
      auth.screen_name = auth_hash["info"]["nickname"]
      auth.token = auth_hash["credentials"]["token"]
      auth.secret = auth_hash["credentials"]["secret"]
    end
  end

  def update_token(auth_hash)
    self.screen_name = auth_hash["info"]["nickname"]
    self.token = auth_hash["credentials"]["token"]
    self.secret = auth_hash["credentials"]["secret"]
    self.save
  end

end
