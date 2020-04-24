class Account < ApplicationRecord
    belongs_to :member,optional: true

    def password=(raw_password)
        if raw_password.kind_of?(String)
            self.password_digest = BCrypt::Password.create(raw_password)
        elsif raw_password.nil?
            self.password_digest = nil
        end
    end
end
