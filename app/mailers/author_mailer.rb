#class AuthorMailer < Devise::Mailer
 #   helper :application # gives access to all helpers defined within `application_helper`.
  #  include Devise::Controllers::UrlHelpers # Optional. eg. `confirmation_url`
   # default template_path: 'authors/mailer' # to make sure that your mailer uses the devise views
    # def welcome_reset_password_instructions(author)
    # create_reset_password_token(author)
     # mail(to: author.email, subject: 'Welcome to reset password')
     # end
    # private
    # def create_reset_password_token(author)
      # raw, hashed = Devise.token_generator.generate(Author, :reset_password_token)
       #@token = raw
       #author.reset_password_token = hashed
       #author.reset_password_sent_at = Time.now.utc
       #author.save
     #end
   #end