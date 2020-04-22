require "pp"
class Accounts::SessionController < Accounts::Base
    def new
        if current_accounts
            redirect_to :accounts_root #going->dashborad
        else
            @form = Accounts::LoginForm.new #-> new form
            render action: "new" 
        end
    end
    
    def create
        @form = Accounts::LoginForm.new(params[:account_login_form])
        
        pp @form
        
        pp @form.mail_address
        pp @form.hash_password
        
        pp params
        pp params[:forms_accounts_login_form]
        pp "接近します"
        
        if @form.mail_address.present?
            account_member=
            Account.find_by("LOWER(mail_address) = ?", @form.mail_address.downcase)
        end
        if account_member.nil?
            pp "情報がないです!"
            render action: "new"
        else
            pp "情報があります"
        end
    end
        
        
        
    
    redirect_to :accounts_root 
end
