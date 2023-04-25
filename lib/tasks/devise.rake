namespace :devise do
    desc "Send welcome reset password instructions to all users.
    This will lockout all users until they reset their password."
    task send_welcome_reset_password_instructions_to_all_authors: :environment do
     Author.take(100).in_batches(of: 10).each_record do |author|
          # Send instructions so user can enter a new password:
          AuthorMailer.welcome_reset_password_instructions(author).deliver
          p author.id
        end
     end
  end