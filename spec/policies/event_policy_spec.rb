require 'rails_helper'

RSpec.describe EventPolicy do
  subject { described_class }

  let(:user) { FactoryBot.create(:user) }
  let(:other_user) { FactoryBot.create(:user) }
  let(:event) { FactoryBot.create(:event, user: user) }
  let(:event_with_pin) { FactoryBot.create(:event, user: user, pincode: '1234') }

  context 'User try to edit, update or destroy event' do
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

  context 'User try to look event' do
    context 'when pincode is absent' do
      permissions :show? do
        it { is_expected.to permit(nil, event) }
      end
    end

    context 'when pincode is present' do
      context 'and user is owner' do
        permissions :show? do
          it { is_expected.to permit(user, event_with_pin) }
        end
      end

      context 'and user has valid cookies' do
        permissions :show? do
          it do
            allow(cookies).to receive(:permanent["events_#{event_with_pin.id}_pincode"]).and_return '1234'
            is_expected.to permit(nil, event_with_pin)
          end
        end
      end

      context 'and user has not valid cookies' do
        permissions :show? do
          it do
            allow(cookies).to receive(:permanent["events_#{event_with_pin.id}_pincode"]).and_return nil
            is_expected.not_to permit(nil, event_with_pin)
          end
        end
      end
    end
  end
end
