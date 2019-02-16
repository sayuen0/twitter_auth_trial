class NotificationMailer < ApplicationMailer
  default from:"hogehoge@example.com"

  def send_confirm_to_user(user)
    @user = user
    mail(
      subject: "会員登録が完了しました",
      to: "sayuen0@gmail.com"
    ) do |format|
        format.text
    end
  end
end
