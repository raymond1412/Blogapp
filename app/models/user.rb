class User < ApplicationRecord

	 #has_secure_password
	 has_many :posts, :dependent => :destroy
     has_many :comments, :dependent => :destroy
    
    validates :email, presence: true, uniqueness: true

    before_save :downcase_email

    def downcase_email 
        self.email = email.downcase 
    end

end
