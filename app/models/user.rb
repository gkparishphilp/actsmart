class User < ActiveRecord::Base #SwellUsers::User

	enum status: { 'pending' => 0, 'active' => 1, 'inactive' => 2 }
	enum role: { 'basic' => 0, 'admin' => 1, 'godmin' => 2 }

	attr_accessor	:login

	### FILTERS		--------------------------------------------


	### VALIDATIONS	---------------------------------------------
	validates_uniqueness_of		:name, case_sensitive: false, allow_blank: true, if: :name_changed?
	validates_uniqueness_of		:email, case_sensitive: false, if: :email_changed?
	validates_format_of			:email, with: Devise.email_regexp, if: :email_changed?

	validates_confirmation_of	:password, if: :encrypted_password_changed?
	validates_length_of			:password, within: Devise.password_length, allow_blank: true, if: :encrypted_password_changed?

	### RELATIONSHIPS   	--------------------------------------

	has_many 	:organization_users, dependent: :destroy
	has_many	:organizations, through: :organization_users

	

	### Plugins  	---------------------------------------------
	# Include default devise modules. Others available are:
	# :token_authenticatable, :confirmable,
	# :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, authentication_keys: [ :login ]


	### Class Methods   	--------------------------------------
	# over-riding Deivse method to allow login via name or email
	def self.find_first_by_auth_conditions( warden_conditions )
		conditions = warden_conditions.dup
		if login = conditions.delete( :login )
			where( conditions ).where( ["lower(name) = :value OR lower(email) = :value", { :value => login.downcase }] ).first
		else
			where( conditions ).first
		end
    end


	### Instance Methods  	--------------------------------------



	def avatar_tag( opts={} )
		return self.gravatar_tag( opts ) if self.avatar.blank?

		tag = "<img src="
		tag += "'" + self.avatar + "' "
		for key, value in opts do
			tag += key.to_s + "='" + value.to_s + "' "
		end
		tag += "/>"
		return tag.html_safe
		
	end


	def full_name
		if self.first_name.present? || self.last_name.present?
			"#{self.first_name} #{self.last_name}"
		else
			self.name
		end
	end

	def full_name=( name )
		name_array = name.split( / / )
		self.first_name = name_array.shift
		self.last_name = name_array.join( ' ' )
	end

	def gravatar_tag( opts={} )
		default = opts[:default] || 'identicon'
		gravatar = "http://gravatar.com/avatar/" + Digest::MD5.hexdigest( self.email ) + "?d=#{default}"
		tag = "<img src="
		tag += "'" + gravatar + "' "
		for key, value in opts do
			tag += key.to_s + "='" + value.to_s + "' "
		end
		tag += "/>"
		return tag.html_safe
	end


	
	def to_s
		str = self.name || "#{self.first_name} #{self.last_name}"

		str = 'Guest' if str.blank?
		return str
	end


end