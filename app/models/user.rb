class User < ActiveRecord::Base
  include Clearance::User
  has_many :authentications, :dependent => :destroy
  has_many :sites, :dependent => :destroy

  def self.create_with_auth_and_hash(authentication,auth_hash)
    create! do |u|
      #u.first_name = auth_hash["info"]["first_name"]
      #u.last_name = auth_hash["info"]["last_name"]
      #u.friendly_name = auth_hash["info"]["name"]
      u.email = auth_hash["extra"]["raw_info"]["email"]
      u.authentications<<(authentication)
    end
  end

  def password_optional?
    true
  end

  def email_optional?
    true
  end

end
