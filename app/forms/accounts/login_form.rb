require "pp"
class Accounts::LoginForm
    include ActiveModel::Model

    attr_accessor :mail_address, :hash_password
    pp "login formに接近しました"
end
