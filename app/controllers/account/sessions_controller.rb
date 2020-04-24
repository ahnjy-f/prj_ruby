require "pp"
class Account::SessionsController < Account::Base
    def new
        if current_account
            pp "indexに行きます"
            redirect_to :account_root
        else
            @form = Account::LoginForm.new
            render action: "new"
        end
    end

    def create
        @form = Account::LoginForm.new(params[:account_login_form])

        if @form.mail_address.present?
            account_info =
                Account.find_by("LOWER(mail_address) = ? ", @form.mail_address.downcase)    
             pp account_info
        end

        if Account::Authenticator.new(account_info).authenticate(@form.password)
            pp "入りました"
            session[:account_id] = account_info.id
    
            flash.alert = "ログイン完了"
            redirect_to :account_root
        else
            flash.notice = "メールアドレスか　パスワードが　正しくないです"
            render action: "new"
        end
    
    end

    def destroy
        pp "ログアウト"
        session.delete(:account_id)
        flash.notice = "ログアウトできました"
        redirect_to :account_root
    end

end
