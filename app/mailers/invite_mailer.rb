class InviteMailer < ApplicationMailer

    def new_user_invite(user)
        @user = user
        mail(subject: "New User Signup: #{@user.email}")
    end

end
