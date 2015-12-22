class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :omniauthable, :omniauth_providers => [:google_oauth2]
 
  before_validation :parse_date
  validates :login,      presence: true
  validates :full_name,  presence: true
  validates :birthday,   presence: true,
                         format:   { with: /([0-2]\d|3[01])\.(0\d|1[012])\.(\d{4})/,
                         message: "Right date format dd.mm.yyyy"}
  validates :address,    presence: true
  validates :city,       presence: true
  validates :state,      presence: true
  validates :country,    presence: true
  validates :zip,        presence: true
  validate  :address_is_bad
  
  has_many :advertisements
  has_many :responses
  
  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_h).where(["lower(login) = :value", { :value => login.downcase }]).first
    else
      where(conditions.to_h).first
    end
  end
  
  def address_is_bad
    if !Geocoder.coordinates("#{address},#{city},#{state},#{zip},#{country}")
      errors.add(:address, "fields is wrong")
    end
  end
  
  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(:email => data["email"]).first

    # Uncomment the section below if you want users to be created if they don't exist
    # unless user
    #     user = User.create(name: data["name"],
    #        email: data["email"],
    #        password: Devise.friendly_token[0,20]
    #     )
    # end
    user
  end
 
  private
    
    def parse_date
      self.birthday = self.birthday.split('-').reverse.join('.') if self.birthday.count('-')
    end
  
end
