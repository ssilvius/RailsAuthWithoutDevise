require 'rails_helper'

RSpec.describe User, type: :model do
  context 'with active model' do
    it { should have_secure_password }
  end

  context 'with active record' do
    it { should have_db_index(:email).unique }
    it { should validate_uniqueness_of(:email).ignoring_case_sensitivity }
    it { should encrypt(:email).deterministic(true) }
  end

  context 'with a valid factory' do
    let(:user) { create(:user) }

    it { expect(user).to be_valid }
  end

  context 'with a valid factory and valididated email' do
    let(:user) { create(:user, :validated_email) }

    it { expect(user).to be_valid }
    it { expect(user.email_validated).to be true }
    it { expect(user.cookies_accepted).to be false }
  end

  context 'with a valid factory and accepted cookies' do
    let(:user) { create(:user, :accepted_cookies) }

    it { expect(user).to be_valid }
    it { expect(user.cookies_accepted).to be true }
    it { expect(user.email_validated).to be false }
  end

  context 'with an invalid factory' do
    let(:user) { create(:user, password: 'nah') }

    it { expect { user }.to raise_error(ActiveRecord::RecordInvalid) }
  end
end
