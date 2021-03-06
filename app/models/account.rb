class Account < ApplicationRecord
    belongs_to :member, class_name: "Member", foreign_key: "member_id", optional: true

    # validates :member_id, presence: true
    
    def password=(raw_password)
        if raw_password.kind_of?(String)
            self.password_digest = BCrypt::Password.create(raw_password)
        elsif raw_password.nil?
            self.password_digest = nil
        end
    end
end
