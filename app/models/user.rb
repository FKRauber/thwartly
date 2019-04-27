class User < ActiveRecord::Base
    has_secure_password

    validates :username && :email, presence: true
    validates :username, uniqueness: true, on: :create

    def self.create_with_oa(auth)
        create! do |user|
            user.provider = auth["provider"]
            user.uid = auth["uid"]
            user.name = auth["info"]["name"]
        end
    end
end
