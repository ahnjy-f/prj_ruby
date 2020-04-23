class Account::LoginForm
    # 中身は　mail_address と　password でお願いします
    include ActiveModel::Model

    attr_accessor :mail_address, :password
    
end
