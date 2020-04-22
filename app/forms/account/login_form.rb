require "pp"
class Account::LoginForm
    include ActiveModel::Model

    attr_accessor :mail_address, :hash_password
    pp "login formに接近しました"
end
