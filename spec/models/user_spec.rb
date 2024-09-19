require 'rails_helper'

RSpec.describe User, type: :model do
  context 'with active model' do
    it { should have_secure_password }
  end

  context 'with active record' do
    it { should have_db_index(:email).unique }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email).ignoring_case_sensitivity }
    it { should encrypt(:email).deterministic(true) }
  end

  context 'with a valid factory' do
    let(:user) { create(:user) }

    it { expect(user).to be_valid }
  end

  context 'with a valid factory and valididated email' do
    let(:now) { Timecop.freeze(Time.now.utc.iso8601) }
    let(:user) { create(:user, email_validated_at: now) }

    it { expect(user).to be_valid }
    it { expect(user.email_validated_at).to eq(now) }
  end

  context 'with a valid factory and accepted cookies' do
    let(:now) { Timecop.freeze(Time.now.utc.iso8601) }
    let(:user) { create(:user, cookies_accepted_at: now) }

    it { expect(user).to be_valid }
    it { expect(user.cookies_accepted_at).to eq(now) }
  end

  context 'with an invalid factory' do
    let(:user) { create(:user, password: 'nah') }

    it { expect { user }.to raise_error(ActiveRecord::RecordInvalid) }
  end
end
