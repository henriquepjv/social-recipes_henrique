require "rails_helper"

describe UserMailer, type: :mailer do
  describe 'notify_new_user' do
    let(:user) { create(:user, email: 'teste@mail.com') }
    let(:mail) { UserMailer.notify_new_user(user) }

    it 'should be delivered to Campus Code' do
      expect(mail.to).to include 'henriquepjv@gmail.com'
    end

    it 'should have sent by user' do
      expect(mail.from).to include 'henriquerecipes@social.com'
    end

    it 'subject should be' do
      expect(mail.subject).to eq "Novo cadastro de usuário"
    end

    it 'body should have' do
      expect(mail.body).to include user.email
      expect(mail.body).to include user.password
    end
  end
end
