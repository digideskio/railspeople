class User < ActiveRecord::Base
  acts_as_gmappable :process_geocoding => false
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :country, :counter_cache => true

  validates_presence_of :email, :username, :first_name, :last_name, :country, :latitude, :longitude
  validates :blog_url, :url => {:allow_blank => true, :verify => [:resolve_redirects]}
  validates :twitter, :url => {:allow_blank => true, :verify => [:resolve_redirects]}
  validates :facebook, :url => {:allow_blank => true, :verify => [:resolve_redirects]}
  validates :google_plus, :url => {:allow_blank => true, :verify => [:resolve_redirects]}
  validates :github, :url => {:allow_blank => true, :verify => [:resolve_redirects]}
  validates :stackoverflow, :url => {:allow_blank => true, :verify => [:resolve_redirects]}

  def gmaps4rails_address
    "#{self.country}"
  end

  self.per_page = 20

end
