class Account::LoginForm
    include ActiveModel::Model

    attr_accessor :mail_address, :password
end
