require 'rails_helper'

RSpec.describe EventPolicy do
  subject { described_class }

  let(:user) { FactoryBot.create(:user) }
  let(:other_user) { FactoryBot.create(:user) }
  let(:event) { FactoryBot.create(:event, user: user) }

  context 'when user is owner' do
    permissions :edit?, :update?, :destroy? do
      it { is_expected.to permit(user, event) }
    end
  end

  context 'when user is not owner' do
    permissions :edit?, :update?, :destroy? do
      it { is_expected.not_to permit(other_user, event) }
    end
  end

  context 'when user is not authentificated' do
    permissions :edit?, :update?, :destroy? do
      it { is_expected.not_to permit(nil, event) }
    end
  end
end
